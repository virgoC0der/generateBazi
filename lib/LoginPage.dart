import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'SignupPage.dart';
import 'InputInfoPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _focusNodeUsername = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();

  TextEditingController _usernameController = new TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _username;
  var _password;
  var _isShowPwd = false;
  var _usernameColor = Colors.grey;
  var _passwordColor = Colors.grey;

  @override
  void initState() {
    // TODO: implement initState
    _focusNodeUsername.addListener(_focusNodeListener);
    _focusNodePassword.addListener(_focusNodeListener);

    _usernameController.addListener(() {
      setState(() {
        _username = '';
        _password = '';
        _isShowPwd = false;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _focusNodeUsername.removeListener(_focusNodeListener);
    _focusNodePassword.removeListener(_focusNodeListener);
    _usernameController.dispose();
    super.dispose();
  }

  Future<Null> _focusNodeListener() async {
    if (_focusNodeUsername.hasFocus) {
      _focusNodePassword.unfocus();
    }
    if (_focusNodePassword.hasFocus) {
      _focusNodeUsername.unfocus();
    }
  }

  String validateNumber(value) {
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return '用户名不能为空';
    } else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
    }
    return null;
  }

  String validatePwd(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (value.trim().length < 6 || value.trim().length > 18) {
      return '密码长度不正确';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil instance = ScreenUtil(width: 750, height: 1334)..init(context);
//    print(ScreenUtil().scaleHeight);

    Widget title = new Container(
      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
      child: Text('登陆',
          style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold)),
    );

    Widget inputTextArea = new Container(
      padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      child: new Form(
        key: _formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new TextFormField(
              onTap: () {
                _usernameColor = Colors.blue;
                _passwordColor = Colors.grey;
              },
              controller: _usernameController,
              focusNode: _focusNodeUsername,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                labelText: '用户名',
                hintText: '请输入手机号',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _usernameColor,
                ),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: _usernameColor,
                ),
              ),
              validator: validateNumber,
              onSaved: (String value) {
                _username = value;
              },
            ),
            new TextFormField(
              onTap: () {
                _passwordColor = Colors.blue;
                _usernameColor = Colors.grey;
              },
              focusNode: _focusNodePassword,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                labelText: '密码',
                hintText: '请输入密码',
                labelStyle: TextStyle(
                  color: _passwordColor,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: _passwordColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isShowPwd ? Icons.visibility : Icons.visibility_off,
                    color: _passwordColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isShowPwd = !_isShowPwd;
//                      _themeColor = Colors.green;
                    });
                  },
                ),
              ),
              obscureText: !_isShowPwd,
              validator: validatePwd,
              onSaved: (String value) {
                _password = value;
              },
            ),
            SizedBox(height: 5.0),
            Container(
              alignment: Alignment(1.0, 0.0),
              padding: EdgeInsets.only(top: 15.0, left: 20.0),
              child: InkWell(
                child: Text(
                  '忘记密码',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
            )
          ],
        ),
      ),
    );

    Widget loginArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 40,
      child: new Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blueAccent,
          color: Colors.blue,
          elevation: 7.0,
          child: GestureDetector(
            onTap: () {
              _focusNodeUsername.unfocus();
              _focusNodePassword.unfocus();

              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => InputInfoPage()));
            },
            child: Center(
              child: Text(
                '登陆',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
    );

    Widget wechatLogin = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 40.0,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, style: BorderStyle.solid, width: 1.0),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ImageIcon(
                AssetImage('assets/wechat.png'),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Center(
              child: Text(
                '微信登录',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );

//    Widget thirdPartyLogin = new Container(
//        margin: EdgeInsets.only(left: 20, right: 20),
//        child: new Column(
//          children: <Widget>[
//            new Row(
//              mainAxisSize: MainAxisSize.min,
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                Container(
//                  width: 80,
//                  height: 1.0,
//                  color: Colors.grey,
//                ),
//                Text('第三方登陆'),
//                Container(
//                  width: 80,
//                  height: 1.0,
//                  color: Colors.grey,
//                ),
//                new SizedBox(
//                  height: 18,
//                ),
//              ],
//            ),
//            new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                IconButton(
//                  color: Colors.green[200],
//                  icon: Icon(FontAwesomeIcons.weixin),
//                  iconSize: 40.0,
//                  onPressed: () {
//                    //TODO: add Wechat Auth
//                  },
//                ),
//                IconButton(
//                  color: Colors.blue,
//                  icon: Icon(FontAwesomeIcons.qq),
//                  iconSize: 40.0,
//                  onPressed: () {
//                    //TODO: add QQ Auth
//                  },
//                ),
//                IconButton(
//                  color: Colors.black,
//                  icon: Icon(FontAwesomeIcons.apple),
//                  iconSize: 40.0,
//                  onPressed: () {
//                    //TODO: add Apple Auth
//                  },
//                )
//              ],
//            ),
//          ],
//        ));

    Widget bottomArea = new Container(
        margin: EdgeInsets.only(right: 20, left: 30),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '新用户？',
            ),
            SizedBox(
              width: 5.0,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => SignupPage()));
              },
              child: Text(
                '注册',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
//              onPressed: () {
//                //TODO: Add sign in acivity
//              },
          ],
        ));

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: new GestureDetector(
        onTap: () {
          _focusNodeUsername.unfocus();
          _focusNodePassword.unfocus();
          _usernameColor = Colors.grey;
          _passwordColor = Colors.grey;
        },
        child: new ListView(
          children: <Widget>[
            title,
            inputTextArea,
            new SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            loginArea,
            new SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            wechatLogin,
            new SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            bottomArea,
          ],
        ),
      ),
    );
  }
}
