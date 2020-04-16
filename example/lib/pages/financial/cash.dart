import 'package:chat_example/widgets/raise_button.dart';
import 'package:flutter/material.dart';

class CashPage extends StatefulWidget {
  @override
  _CashPageState createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  int _currentType = 0;
  int _currentAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("我要提现"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text(
              "提现说明",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(top: 1),
          ),
          SliverToBoxAdapter(
            child: _header(context),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("提现方式"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: OutlineButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.payment,
                                  color: Colors.green,
                                ),
                              ),
                              Text("微信")
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: OutlineButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.monochrome_photos,
                                color: Colors.blue,
                              ),
                              Text("支付宝")
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          SliverToBoxAdapter(
            child: _amount(context),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: SSRaisedButton(
                color: Colors.blue,
                content: Text(
                  "提现",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "当前金币",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "13,804",
                style: TextStyle(fontSize: 20),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          OutlineButton(
            child: Text("提现记录"),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _amount(BuildContext context) {
    final List<int> amounts = [10, 30, 50, 100];
    const selectedColor = Colors.blue;
    const unSelectedColor = Color(0xFFAFAFAF);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text("提现金额"),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.spaceBetween,
            children: amounts.map(
              (e) {
                int idx = amounts.indexOf(e);
                final color = idx == _currentAmount ? selectedColor : unSelectedColor;
                return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all(color: color, width: 1)),
                    width: (MediaQuery.of(context).size.width - 50) / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$e 元",
                          style: TextStyle(fontSize: 14, color: color),
                        ),
                        Text(
                          "售价：${e * 1000}金币",
                          style: TextStyle(fontSize: 12, color: color),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _currentAmount = idx;
                    });
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
