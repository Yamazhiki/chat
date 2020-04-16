package io.newstyle.flutter.plugin.wildfirechat.chat

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.IBinder
import android.os.RemoteException
import androidx.annotation.NonNull
import cn.wildfirechat.client.*
import cn.wildfirechat.message.Message
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.newstyle.flutter.plugin.ext.toMap

/** ChatPlugin */
public class ChatPlugin : FlutterPlugin, MethodCallHandler, EventChannel.StreamHandler {

    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private lateinit var context: Context
    private lateinit var sink: EventChannel.EventSink
    private var client: IRemoteClient? = null

    private fun startUp(): Boolean {
        if (client == null) {
            val intent = Intent(context, ClientService::class.java)
            return context.bindService(intent, serviceConnection, Context.BIND_AUTO_CREATE)
        }
        return true
    }


    private val serviceConnection: ServiceConnection = object : ServiceConnection {
        override fun onServiceConnected(componentName: ComponentName, iBinder: IBinder) {
            client = IRemoteClient.Stub.asInterface(iBinder)
            try {
                client?.run {
                    setOnConnectionStatusChangeListener(object : IOnConnectionStatusChangeListener.Stub() {
                        @Throws(RemoteException::class)
                        override fun onConnectionStatusChange(i: Int) {
                            sink.success(i)
                        }
                    })
                    setOnReceiveMessageListener(object : IOnReceiveMessageListener.Stub() {
                        override fun onRecall(p0: Long) {
                            sink.success(null)
                        }

                        override fun onReceive(p0: MutableList<Message>?, p1: Boolean) {
                            sink.success(null)
                        }

                    })
                }
            } catch (e: RemoteException) {
                e.printStackTrace()
            }
        }
        override fun onServiceDisconnected(componentName: ComponentName) {}
    }


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        methodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, methodName)
        eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, eventName)
        eventChannel.setStreamHandler(this)
        methodChannel.setMethodCallHandler(this)
    }

    companion object {
        const val methodName = "io.newstyle.flutter.plugin.wildfirechat.chat/method"
        const val eventName = "io.newstyle.flutter.plugin.wildfirechat.chat/event"

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "chat")
            channel.setMethodCallHandler(ChatPlugin())
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (startUp()) {
            val methodId = call.method
            val params = call.arguments as Map<*, *>
            client?.let { it ->
                when (methodId) {
                    "connect" -> {
                        it.connect(params["userId"] as String?, params["token"] as String?)
                    }
                    "serverAddress" -> {
                        it.setServerAddress(params["serverAddress"] as String)
                    }
                    "disconnect" -> it.disconnect(params["clearSession"] as Boolean)
                    "isLogin" -> result.success(true)

                    "serverDeltaTime" -> result.success(it.serverDeltaTime)
                    /*用户信息*/
                    "getUserInfo" -> {
                        result.success(it.getUserInfo("", "", false)?.toMap())
                    }
                    /*好友*/
                    "searchFriends" -> {
                        result.success(it.searchFriends(params["keyword"] as String)?.map { it.toMap() })
                    }
                    "sendFriendRequest" -> it.sendFriendRequest(params["userId"] as String?, params["reason"] as String?, object : IGeneralCallback.Stub() {
                        override fun onSuccess() {
                            sink.success(0)
                        }

                        override fun onFailure(p0: Int) {
                            sink.success(p0)
                        }

                    })
                    "getReceivedFriendRequests" -> {
                        result.success(it.getFriendRequest(true)?.let { list ->
                            list.map { it.toMap() }
                        })
                    }
                    "handleFriendRequest" -> it.handleFriendRequest(params["userId"] as String?, params["accept"] as Boolean, params["extra"] as String, object : IGeneralCallback.Stub() {
                        override fun onSuccess() {
                            result.success(0)
                        }

                        override fun onFailure(p0: Int) {
                            result.success(p0)
                        }
                    })
                    /*会话*/
                    else -> {
                    }
                    /*好友*/
                }
            }
        }
    }


    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)
        eventChannel.setStreamHandler(null)
        context.unbindService(serviceConnection)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        events?.run {
            sink = this
        }
    }

    override fun onCancel(arguments: Any?) {
        dispose()
    }

    private fun dispose() {

    }
}
