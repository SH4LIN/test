import 'package:flutter/material.dart';
import 'package:flutter1_3/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _t1 = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];

  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(
        color: Colors.blue
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _t1,
                decoration: new InputDecoration.collapsed(
                    hintText: "Send a Message"
                ),
                //onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_t1.text)
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            itemBuilder: (_,int index) => _messages[index],
            itemCount: _messages.length,
            padding: const EdgeInsets.all(8.0),
            reverse: true,
          ),
        ),
        new Divider(
            height: 10.0
        ),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _textComposerWidget(),
        ),
      ],
    );
  }

  void _handleSubmitted(String value) {
    ChatMessage message = new ChatMessage(
      text: value,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _t1.clear();
  }
}
