import 'package:chat_example/widgets/app_bar.dart';
import 'package:chat_example/widgets/raise_button.dart';
import 'package:chat_example/widgets/text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SSAppBar(
        title: Text("注册"),
      ),
      body: Center(
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: ListView.separated(
                    itemBuilder: (_, idx) {
                      switch (idx) {
                        case 0:
                          return SizedBox(
                            height: 100,
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
                            prefix: Icon(Icons.message),
                            suffix: RaisedButton(
                              child: Text("发送验证码"),
                              onPressed: () {},
                            ),
                            hitText: "短信验证码",
                          );
                        case 3:
                          return SSTextField(
                            obscureText: true,
                            prefix: Icon(Icons.vpn_key),
                            suffix: Icon(Icons.remove_red_eye),
                            hitText: "登录密码",
                          );
                        case 4:
                          return Row(
                            children: <Widget>[
                              Checkbox(
                                onChanged: (_) {},
                                value: true,
                              ),
                              Text("我已阅读同意条款"),
                              GestureDetector(
                                child: Text(
                                  "《注册协议》",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          );
                        default:
                          return SSRaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            content: Text("注册"),
                          );
                      }
                    },
                    separatorBuilder: (_, __) => SizedBox(
                          height: 20,
                        ),
                    itemCount: 6),
              )
            ],
          ),
        ),
      ),
    );
  }
}
