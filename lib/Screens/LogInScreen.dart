import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:log_in_screen/CustomIcons.dart';
import 'package:log_in_screen/Widgets/SocialIcons.dart';

bool _signUpActive = false;
bool _signInActive = true;
TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => new _MyAppState();
}

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: ScreenUtil.getInstance().setWidth(120),
        height: 1.0,
        color: Colors.white.withOpacity(0.6),
      ),
    );

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return new Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(247, 140, 123, 1),
              Color.fromRGBO(197, 112, 98, 1)
            ])),
        child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          //Sets the main padding all widgets has to adhere to.
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "MOMENTUM",
                          style: TextStyle(
                            //fontFamily: 'Open Sans',
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "GROWTH * HAPPENS * TODAY",
                          style: TextStyle(
                            //fontFamily: 'Open Sans',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                width: ScreenUtil.getInstance().setWidth(750),
                height: ScreenUtil.getInstance().setHeight(200),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(60),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: IntrinsicWidth(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        OutlineButton(
                          onPressed: () => setState(() => changeToSignIn()),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          borderSide: new BorderSide(
                            style: BorderStyle.none,
                          ),
                          child: new Text('SIGN IN',
                              style: _signInActive
                                  ? TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)
                                  : TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                        ),
                        OutlineButton(
                          onPressed: () => setState(() => changeToSignUp()),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                          ),
                          child: Text('SIGN UP',
                              style: _signUpActive
                                  ? TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)
                                  : TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                        )
                      ],
                    ),
                  ),
                ),
                width: ScreenUtil.getInstance().setWidth(750),
                height: ScreenUtil.getInstance().setHeight(200),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(40),
              ),
              Container(
                child: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: _signInActive ? showSignIn() : showSignUp()),
                width: ScreenUtil.getInstance().setWidth(750),
                height: ScreenUtil.getInstance().setHeight(754),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget showSignIn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      SizedBox(
        height: ScreenUtil.getInstance().setHeight(50),
      ),
      Container(
        child: Padding(
          padding: EdgeInsets.only(),
          child: TextField(
            style: TextStyle(color: Colors.white),
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: ScreenUtil.getInstance().setHeight(50),
      ),
      Container(
        child: Padding(
          padding: EdgeInsets.only(),
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            controller: _passwordController,
            decoration: InputDecoration(
              //Add th Hint text here.
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: ScreenUtil.getInstance().setHeight(60),
      ),
      Container(
        child: Padding(
          padding: EdgeInsets.only(),
          child: RaisedButton(
            child: Text(
              'SIGN IN',
              style: TextStyle(
                color: Color.fromRGBO(247, 140, 123, 1),
                fontSize: 24.0,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.white,
            onPressed: () =>
                tryToSignIn(_usernameController, _passwordController),
          ),
        ),
      ),
      SizedBox(
        height: ScreenUtil.getInstance().setHeight(60),
      ),
      Container(
        child: Padding(
          padding: EdgeInsets.only(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              horizontalLine(),
              Text('Social Login', style: TextStyle(color: Colors.white)),
              horizontalLine()
            ],
          ),
        ),
      ),
      SizedBox(
        height: ScreenUtil.getInstance().setHeight(40),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SocialIcon(
            colors: [
              Color(0xFF3C5A99),
              Color(0xFF3C5A99),
              //Color(0xFF00eaf8)
            ],
            iconData: CustomIcons.facebook,
            onPressed: () {},
          ),
          SocialIcon(
            colors: [
              Color(0xFF1DA1F2),
              Color(0xFF1DA1F2),
            ],
            iconData: CustomIcons.twitter,
            onPressed: () {},
          ),
          SocialIcon(
            colors: [
              Color(0xFF0077B5),
              Color(0xFF0077B5),
            ],
            iconData: CustomIcons.linkedin,
            onPressed: () {},
          )
        ],
      )
    ],
  );
}

Widget showSignUp() {
  return Column(
    children: <Widget>[Text('Love')],
  );
}

void tryToSignIn(
    TextEditingController _username, TextEditingController _password) {}

void tryToSignUp() {}

void changeToSignUp() {
  _signUpActive = true;
  _signInActive = false;
}

void changeToSignIn() {
  _signUpActive = false;
  _signInActive = true;
}
