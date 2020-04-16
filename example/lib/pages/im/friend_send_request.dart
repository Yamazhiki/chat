import 'package:chat/model/message.dart';
import 'package:chat_example/domain/chat_provider.dart';
import 'package:chat_example/domain/present/state.dart';
import 'package:chat_example/widgets/state_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendSendRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEEEE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("我发起的"),
      ),
      body: Consumer<ChatProvider>(
        builder: (_, provider, widget) {
          return FutureBuilder<UIState<List<IMFriendRequest>>>(
            future: provider.manager.friendRequests.then((value) => UIState.loaded(value)),
            initialData: UIState.loading(),
            builder: (_, snap) {
              switch (snap.data.state) {
                case LoadState.loading:
                  return StateLoading();
                default:
                  if (snap.data.value.length == 0)
                    return Text("没有数据");
                  else
                    return ListView.separated(
                        itemBuilder: (_, idx) => ListTile(
                              title: Text(snap.data.value[idx].target),
                            ),
                        separatorBuilder: (_, idx) => Divider(
                              height: 1,
                            ),
                        itemCount: snap.data.value.length);
              }
            },
          );
        },
      ),
    );
  }
}
