import 'package:chat/chat.dart';
import 'package:chat/model/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/chat_provider.dart';
import 'pages/main-tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: Consumer<ChatProvider>(
        builder: (context, chat, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.grey,
            ),
            home: StreamBuilder<IMEventConnect>(
              stream: chat.manager.connectStream,
              initialData: IMEventConnect(status: 1001),
              builder: (_, data) {
                if (data.data.status == 1) {
                  handleConnect(data.data.status, chat.manager);
                }
                return TabContent();
              },
            ),
          );
        },
      ),
    );
  }

  handleConnect(int code, Chat chat) async {
    final rlt = await chat.sendFriendRequest("ikininWW");
    print(rlt);
  }
}
