import 'package:flutter/material.dart';

import 'home.dart';
import 'message/message.dart';
import 'mine.dart';
import 'social.dart';
import 'video/video.dart';

class TabContent extends StatefulWidget {
  @override
  _TabContentState createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MessagePage(),
    HomePage(),
    VideoPage(),
    SocialPage(),
    MinePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text('视频'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text('社区'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('消息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            title: Text('我的'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
