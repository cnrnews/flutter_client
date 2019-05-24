import 'package:flutter/material.dart';

class WidgetEnum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatioDemo();
  }
}
//AspectRatio 宽高比
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: AspectRatio(
        aspectRatio: 3.0 / 2.0,
        child: Container(
          color: Colors.blue,
          child: AspectRatio(
            aspectRatio: 2.0 / 1.0,
            child: Center(
              child: Text('AspectRatio',style: TextStyle(color: Colors.yellow),),
            ),
          ),
        ),
      ),
    );
  }
}
