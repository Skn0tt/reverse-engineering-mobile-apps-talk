import 'package:demo_app/SecretKeeper.dart';
import 'package:flutter/material.dart';

var intro = """
Welcome to your very own, very private, very local secret treasure app.
It is _the_ best app that you can use,
and it is _the_ most private one.
I assure you.
""".trim();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void _sneakilyUploadPasswordToOwnServer(String password) {

  }

  void _handleSubmitted(String password) {
    _sneakilyUploadPasswordToOwnServer(password);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecretKeeper())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lol"),
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                intro,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                obscureText: true,
                autocorrect: false,
                onSubmitted: _handleSubmitted
              )
            ],
          ),
        ),
      ),
    );
  }
}
