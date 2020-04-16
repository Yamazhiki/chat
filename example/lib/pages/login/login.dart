import 'package:chat_example/domain/chat_provider.dart';
import 'package:chat_example/pages/login/register.dart';
import 'package:chat_example/widgets/flat_fill_button.dart';
import 'package:chat_example/widgets/raise_button.dart';
import 'package:chat_example/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class _LoginBloc {
  final TextEditingController mobile;
  final TextEditingController code;
  _LoginBloc({this.mobile, this.code});
}

class LoginPage extends StatefulWidget {
  final TextEditingController mobile = TextEditingController();
  final TextEditingController code = TextEditingController();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final chat = Provider.of<ChatProvider>(context).manager;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: ListView.separated(
                itemBuilder: (_, idx) {
                  switch (idx) {
                    case 0:
                      return Icon(
                        Icons.adb,
                        size: 150,
                      );
                    case 1:
                      return SSTextField(
                        prefix: Icon(Icons.phone_iphone),
                        suffix: Icon(Icons.keyboard_arrow_down),
                        hitText: "用户名",
                      );
                    case 2:
                      return SSTextField(
                        obscureText: true,
                        prefix: Icon(Icons.vpn_key),
                        suffix: null,
                        hitText: "密码",
                      );
                    case 3:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                onChanged: (bool value) {},
                                value: true,
                              ),
                              Text("记住密码"),
                            ],
                          ),
                          GestureDetector(
                            child: Text("忘记密码"),
                          )
                        ],
                      );
                    case 4:
                      return SSRaisedButton(
                        color: Colors.blue,
                        content: Container(
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            "登录",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                        onPress: () {},
                      );
                    case 5:
                      return SSFlatFillButton(
                        content: Text("注册"),
                        onPressed: () => Navigator.push(
                            context, MaterialPageRoute(builder: (_) => RegisterPage())),
                      );
                    case 6:
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Divider(
                            height: 1,
                          ),
                          Text(
                            "  OR  ",
                            style: TextStyle(backgroundColor: Colors.white),
                          ),
                        ],
                      );
                    case 7:
                      return OutlineButton(
                          child: Container(
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Positioned(
                                  child: Icon(
                                    Icons.wb_cloudy,
                                    color: Colors.green,
                                  ),
                                  left: 10,
                                ),
                                Text("微信登录")
                              ],
                            ),
                          ),
                          onPressed: () {});
                    default:
                      return null;
                  }
                },
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemCount: 8),
          ),
        ),
      ),
    );
  }
}
