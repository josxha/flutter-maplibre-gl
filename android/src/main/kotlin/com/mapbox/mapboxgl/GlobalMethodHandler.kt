package com.mapbox.mapboxgl

import android.content.Context
import android.util.Log
import com.mapbox.mapboxsdk.net.ConnectivityReceiver
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import java.io.BufferedInputStream
import java.io.BufferedOutputStream
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException
import java.io.InputStream
import java.io.OutputStream

class GlobalMethodHandler(
    private val context: Context,
    private val messenger: BinaryMessenger,
    private val registrar: PluginRegistry.Registrar? = null,
    private val flutterAssets: FlutterPlugin.FlutterAssets? = null
) : MethodChannel.MethodCallHandler {

    companion object {
        private const val TAG = "GlobalMethodHandler"
        private const val DATABASE_NAME = "mbgl-offline.db"
        private const val BUFFER_SIZE = 1024 * 2
    }

    private var downloadOfflineRegionChannelHandler: OfflineChannelHandlerImpl? = null

    constructor(registrar: PluginRegistry.Registrar) : this(
        registrar.activeContext(),
        registrar.messenger(),
        registrar
    )

    constructor(binding: FlutterPlugin.FlutterPluginBinding) : this(
        binding.applicationContext,
        binding.binaryMessenger,
        flutterAssets = binding.flutterAssets
    )

    private fun copy(input: InputStream, output: OutputStream) {
        val buffer = ByteArray(BUFFER_SIZE)
        val inStream = BufferedInputStream(input, BUFFER_SIZE)
        val outStream = BufferedOutputStream(output, BUFFER_SIZE)
        var count = 0
        try {
            var n = inStream.read(buffer, 0, BUFFER_SIZE)
            while (n != -1) {
                outStream.write(buffer, 0, n)
                count += n
                n = inStream.read(buffer, 0, BUFFER_SIZE)
            }
            outStream.flush()
        } finally {
            try {
                outStream.close()
            } catch (e: IOException) {
                Log.e(TAG, e.message, e)
            }
            try {
                inStream.close()
            } catch (e: IOException) {
                Log.e(TAG, e.message, e)
            }
        }
    }

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        MapBoxUtils.getMapbox(context)

        when (methodCall.method) {
            "installOfflineMapTiles" -> {
                val tilesDb = methodCall.argument<String>("tilesdb") ?: ""
                installOfflineMapTiles(tilesDb)
                result.success(null)
            }

            "setOffline" -> {
                val offline = methodCall.argument<Boolean>("offline") ?: false
                ConnectivityReceiver.instance(context).isConnected = !offline
                result.success(null)
            }

            "mergeOfflineRegions" -> {
                val path = methodCall.argument<String>("path") ?: ""
                OfflineManagerUtils.mergeRegions(result, context, path)
            }

            "setOfflineTileCountLimit" -> {
                val limit = methodCall.argument<Number>("limit")?.toLong() ?: 0L
                OfflineManagerUtils.setOfflineTileCountLimit(result, context, limit)
            }

            "setHttpHeaders" -> {
                val headers = methodCall.argument<Map<String, String>>("headers") ?: emptyMap()
                MapboxHttpRequestUtil.setHttpHeaders(headers, result)
            }

            "downloadOfflineRegion#setup" -> {
                val channelName = methodCall.argument<String>("channelName") ?: ""
                downloadOfflineRegionChannelHandler =
                    OfflineChannelHandlerImpl(messenger, channelName)
                result.success(null)
            }

            "downloadOfflineRegion" -> {
                val definitionMap =
                    methodCall.argument<Map<String, Any>>("definition") ?: emptyMap()
                val metadataMap = methodCall.argument<Map<String, Any>>("metadata") ?: emptyMap()

                if (downloadOfflineRegionChannelHandler == null) {
                    result.error(
                        "downloadOfflineRegion#setup NOT CALLED",
                        "The setup has not been called, please call downloadOfflineRegion#setup before",
                        null
                    )
                    return
                }

                OfflineManagerUtils.downloadRegion(
                    result,
                    context,
                    definitionMap,
                    metadataMap,
                    downloadOfflineRegionChannelHandler!!
                )
                downloadOfflineRegionChannelHandler = null
            }

            "getListOfRegions" -> OfflineManagerUtils.regionsList(result, context)
            "updateOfflineRegionMetadata" -> {
                val metadata = methodCall.argument<Map<String, Any>>("metadata") ?: emptyMap()
                val id = methodCall.argument<Number>("id")?.toLong() ?: 0L
                OfflineManagerUtils.updateRegionMetadata(result, context, id, metadata)
            }

            "deleteOfflineRegion" -> {
                val id = methodCall.argument<Number>("id")?.toLong() ?: 0L
                OfflineManagerUtils.deleteRegion(result, context, id)
            }

            else -> result.notImplemented()
        }
    }

    private fun installOfflineMapTiles(tilesDb: String) {
        val dest = File(context.filesDir, DATABASE_NAME)
        try {
            val input = openTilesDbFile(tilesDb)
            val output = FileOutputStream(dest)
            copy(input, output)
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    private fun openTilesDbFile(tilesDb: String): InputStream {
        return if (tilesDb.startsWith("/")) { // Absolute path.
            FileInputStream(File(tilesDb))
        } else {
            val assetKey = when {
                registrar != null -> registrar.lookupKeyForAsset(tilesDb)
                flutterAssets != null -> flutterAssets.getAssetFilePathByName(tilesDb)
                else -> throw IllegalStateException()
            }
            context.assets.open(assetKey)
        }
    }
}