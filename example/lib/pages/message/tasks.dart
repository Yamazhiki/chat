import 'package:chat_example/pages/financial/cash.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            _header(context),
            SizedBox(
              height: 10,
            ),
            Expanded(flex: 1, child: _list(context)),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.only(top: 16),
        decoration: ShapeDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF217EFF), Color(0xFF005AD9)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(maxWidth / 2.0),
                    bottomRight: Radius.circular(maxWidth / 2.0)))),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CashPage())),
                      child: RichText(
                        text: TextSpan(
                            text: "1.33",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                            children: [TextSpan(text: "元 >", style: TextStyle(fontSize: 14))]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Text(
                        "金币余额：12378",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xFFEFEFEF), width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(left: 50, right: 50),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                    text: "已签到",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    children: [
                                      TextSpan(
                                          text: "2/30",
                                          style: TextStyle(color: Colors.blue, fontSize: 20)),
                                      TextSpan(text: "天"),
                                    ]),
                              ),
                              Text("明日签到得388金币",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.monetization_on,
                                color: Color(0xFFFF7838),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("今日签到领金币"),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _list(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.web,
                    color: Colors.blue,
                  ),
                ),
                Text("日常任务")
              ],
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Expanded(
            flex: 1,
            child: ListView.separated(
                itemBuilder: (_, idx) => Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text("阅读推送新闻"),
                          ),
                          Container(
                            height: 16,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: Color(0x80FFEDB1), borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.attach_money,
                                  size: 10,
                                  color: Color(0xFFFF7838),
                                ),
                                Text(
                                  "430",
                                  style: TextStyle(fontSize: 10, color: Color(0xFFFF7838)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text("打开推送赚金币，每天不定时推送"),
                      trailing: RaisedButton(
                        child: Text("去阅读"),
                        onPressed: () {},
                      ),
                    )),
                separatorBuilder: (_, idx) => SizedBox(
                      height: 1,
                    ),
                itemCount: 5),
          )
        ],
      ),
    );
  }
}
