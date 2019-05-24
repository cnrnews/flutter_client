import 'package:flutter/material.dart';

//行内多样是文本
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('行内多样式文本'),
      ),
      body: Container(
        child: RichText(
          text: TextSpan(
              text: 'lhldream',
              style: TextStyle(
                  fontSize: 34.0,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
              children: [
                TextSpan(
                  text: '.com',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 10.0,
                      fontStyle: FontStyle.italic),
                )
              ]),
        ),
      ),
    );
  }
}
