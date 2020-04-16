import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class ChatRoomInputBar extends StatefulWidget {
  final BuildContext context;

  const ChatRoomInputBar({
    Key key,
    this.context,
  }) : super(key: key);

  @override
  _ChatRoomInputBarState createState() => _ChatRoomInputBarState();
}

class _ChatRoomInputBarState extends State<ChatRoomInputBar> {
  KeyboardVisibilityNotification _keyboardVisibility = new KeyboardVisibilityNotification();
  int _keyboardVisibilitySubscriberId;
  double _bottomPadding = 34;

  @override
  void initState() {
    super.initState();
    _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(onChange: (isShow) {
      _bottomPadding = _bottomPadding == 34 ? 500 : 34;
      print("hidden $_bottomPadding");
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
          top: 0,
          left: 10,
          bottom:
              _bottomPadding != null ? _bottomPadding : MediaQuery.of(context).viewPadding.bottom,
          right: 10),
      duration: Duration(milliseconds: 200),
      child: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFEFEFEF)))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.voice_chat),
              onPressed: () {},
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xEFEFEF)),
              child: TextField(),
            )),
            IconButton(
              icon: Icon(Icons.insert_emoticon),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
    _keyboardVisibility.dispose();
    super.dispose();
  }
}
