import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  final Widget child;

  ToolTipDemo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tootipwidget'),
      ),
      body: Center(
        child:Tooltip(
        message: 'tooltip',
        child: Image.network(
            'https://goss.veer.com/creative/vcg/veer/800water/veer-149611774.jpg'),
      )),
    );
  }
}
