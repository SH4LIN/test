import 'package:flutter/material.dart';
import 'ChatScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Frosty Chat"),
      ),
      body: new ChatScreen(),
    );
  }
}
