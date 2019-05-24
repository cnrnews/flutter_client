import 'package:flutter/material.dart';

class WrapWidget extends StatefulWidget {
  _WrapWidgetState createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  buildPhoto() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.pink,
        child: Center(
            child: Text(
          '相册',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
  buildAddButton() {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (list.length < 9) {
              list.insert(list.length - 1, buildPhoto());
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            width: 80.0,
            height: 80.0,
            color: Colors.grey.shade200,
            child: Icon(Icons.add),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Wrap布局'),
        ),
        body: Opacity(
          opacity: 0.8,
          child: Center(
            child: Container(
              width: width,
              height: height / 2,
              color: Colors.grey,
              child: Wrap(
                children: list,
                spacing: 12.0,
              ),
            ),
          ),
        ));
  }
}
