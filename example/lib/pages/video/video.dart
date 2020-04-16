import 'package:chat_example/widgets/clip_x_network_image.dart';
import 'package:chat_example/widgets/raise_button.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _search(),
            Expanded(
              flex: 1,
              child: _videoList(),
            )
          ],
        ),
      )),
    );
  }

  Widget _search() {
    return Row(
      children: <Widget>[
        Expanded(
          child: SSRaisedButton(
            color: Color(0xFFEFEFEF),
            content: Row(
              children: <Widget>[Icon(Icons.search), Text("搜索")],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: <Widget>[Icon(Icons.monetization_on), Text("赚钱")],
          ),
        )
      ],
    );
  }

  Widget _videoList() {
    return ListView.separated(
        itemBuilder: (_, idx) => Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ClipXNetworkImage(
                          url:
                              "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=38073125,1946515008&fm=26&gp=0.jpg",
                          size: 40,
                          borderRadius: 5,
                        ),
                      ),
                      Text("南风不竞")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipXNetworkImage(
                    url:
                        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2445651768,3226038233&fm=26&gp=0.jpg",
                    borderRadius: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: <Widget>[
                      Chip(
                        avatar: Icon(Icons.swap_horiz),
                        label: Text("每日步行街话题"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton.icon(onPressed: null, icon: Icon(Icons.chat), label: Text("143")),
                      FlatButton.icon(
                          onPressed: null, icon: Icon(Icons.favorite_border), label: Text("143")),
                      FlatButton.icon(onPressed: null, icon: Icon(Icons.camera), label: Text(""))
                    ],
                  )
                ],
              ),
            ),
        separatorBuilder: (_, idx) => Divider(
              height: 1,
            ),
        itemCount: 10);
  }
}
