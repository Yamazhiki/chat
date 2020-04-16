import 'package:chat/model/user.dart';
import 'package:chat_example/domain/chat_provider.dart';
import 'package:chat_example/pages/message/chat-room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'friend_info.dart';

class ConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      child: Column(
        children: <Widget>[
          _search(context),
          Expanded(
            flex: 1,
            child: _list(context),
          )
        ],
      ),
    );
  }

  Widget _search(BuildContext context) {
    final chat = Provider.of<ChatProvider>(context);
    return Container(
      color: Color(0xFFECEEEE),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: GestureDetector(
            //onTap: () => showSearch(context: context, delegate: _IMSearchDelegate()),
            onTap: () {
              chat.login("13121218001", "66666");
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                Text(
                  "搜索",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _list(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chat, _) {
        return ListView.separated(
            itemBuilder: (_, idx) => _row(context),
            separatorBuilder: (_, idx) => SizedBox(
                  height: 1,
                ),
            itemCount: 1);
      },
    );
  }

  Widget _row(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage())),
        leading: Icon(
          Icons.camera,
          size: 50,
        ),
        title: Text(
          "南风不竞",
          style: TextStyle(color: Colors.black87),
        ),
        subtitle: Text(
          "疫情现危险信号！钟南山担心的事发生了…",
          style: TextStyle(color: Colors.black54),
          maxLines: 1,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "12:00",
              style: TextStyle(fontSize: 10),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 16, minHeight: 16),
              child: Container(
                padding: EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 2),
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                decoration:
                    BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IMSearchDelegate extends SearchDelegate<IMUser> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.map),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Icon(Icons.search);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ListTile(
        title: Text("某某用户"),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => FriendInfoPage(
                      user: IMUser(userId: "ikininWW"),
                    ))),
      ),
    );

    final chat = Provider.of<ChatProvider>(context);
    return FutureBuilder<List<IMUser>>(
      future: chat.manager.searchFriends(query.trim()),
      initialData: [],
      builder: (_, snap) {
        return Container(
            margin: EdgeInsets.all(16),
            child: snap.data.length == 0
                ? Center(
                    child: Text("搜索中"),
                  )
                : ListView.separated(
                    itemBuilder: (_, idx) => ListTile(
                          title: Text(snap.data[idx].displayName),
                        ),
                    separatorBuilder: (_, idx) => Divider(
                          height: 1,
                        ),
                    itemCount: snap.data.length));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("搜索建议");
  }
}
