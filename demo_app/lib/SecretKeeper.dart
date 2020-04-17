import 'package:flutter/material.dart';

class SecretKeeper extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _SecretKeeperState();
  }
  
}

class _SecretKeeperState extends State<SecretKeeper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your secret secrets")
      ),
    );
  }

}