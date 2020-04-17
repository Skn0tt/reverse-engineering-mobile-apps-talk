import 'package:flutter/material.dart';

class SecretKeeper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecretKeeperState();
  }
}

class _SecretKeeperState extends State<SecretKeeper> {
  List<String> secrets = [
    "I picked my nose multiple times during Zoom calls",
    "I've bought some toilet paper in advance",
    "I've secretly been fedding the mouse in our cellar",
    "I vibe to Justin Bieber's 'Baby'",
    "Sometimes I wish I was born as a squirrel",
    "To kill time during isolation, I've bought a Wii U.",
    "My Airpod fakes from AliExpress were confiscated by customs",
    "My favorite T-Shirt has a Dugong on it"
  ];

  final TextEditingController eCtrl = new TextEditingController();

  Widget buildSecretCard(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          )
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Your secret secrets")),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                TextField(
                    controller: eCtrl,
                    onSubmitted: (text) {
                      setState(() {
                        secrets.insert(0, text);
                      });
                      eCtrl.clear();
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Add a secret ...",
                      labelStyle: TextStyle(fontSize: 18)
                    ),
                  ),
                Padding(padding: EdgeInsets.all(10)),
                Expanded(
                  child: ListView.builder(
                      itemCount: secrets.length,
                      itemBuilder: (context, index) {
                        return buildSecretCard(secrets[index]);
                      }),
                ),
              ],
            )));
  }
}
