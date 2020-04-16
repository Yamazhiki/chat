import 'package:flutter/material.dart';

import '../im/conversation.dart';
import 'tasks.dart';

class MessagePage extends StatelessWidget {
  static List<String> _tabs = ["任务", "私信"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: DefaultTabController(
            length: _tabs.length,
            initialIndex: 1,
            child: Column(
              children: <Widget>[
                Center(
                  child: TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    unselectedLabelColor: Colors.black54,
                    tabs: _tabs
                        .map((e) => Container(padding: EdgeInsets.all(10), child: Text(e)))
                        .toList(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TabBarView(
                    children: [TasksPage(), ConversationPage()],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
