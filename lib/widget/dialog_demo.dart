import 'package:flutter/material.dart';
import 'dart:async';

enum Action { OK, CANCEL }
enum Option { A, B, C }

class DialogDemo extends StatefulWidget {
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Column(
        children: <Widget>[
          AlertDialogDemo(),
          BottomSheetDemo(),
          SimpleDialogDemo()
        ],
      ),
    );
  }
}

class AlertDialogDemo extends StatefulWidget {
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choose = 'Nothing';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('you choose is: $_choose'),
        SizedBox(
          height: 16,
        ),
        RaisedButton(
          onPressed: () {
            _showAlertDialog();
          },
          child: Text('AlertDialog'),
        )
      ],
    );
  }

  Future _showAlertDialog() async {
    final action = await showDialog(
        barrierDismissible: false, //点击空白处是否关闭对话框
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('是否删除'),
            content: Text('删除动作会清空您的浏览记录'),
            actions: <Widget>[
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context, Action.CANCEL);
                },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context, Action.OK);
                },
              )
            ],
          );
        });
    switch (action) {
      case Action.CANCEL:
        setState(() {
          _choose = 'CANCEL';
        });
        break;
      case Action.OK:
        setState(() {
          _choose = 'OK';
        });
        break;
    }
  }
}

class BottomSheetDemo extends StatefulWidget {
  _BottomSheetDemo createState() => _BottomSheetDemo();
}

class _BottomSheetDemo extends State<BottomSheetDemo> {
  String _bootomSheet = 'Nothing';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        FlatButton(
          child: Text('BottomSheet'),
          onPressed: () {
            _showBottomSheet(context);
          },
        ),
        FlatButton(
          child: Text('BottomSheetModel' + _bootomSheet),
          onPressed: () {
            _showBottomSheetModel();
          },
        )
      ],
    ));
  }

  void _showBottomSheet(context) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BottomAppBar(
            child: Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.mood_bad),
                        Text('李鸿章'),
                      ],
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text('1990-12-12'),
                    flex: 1,
                  )
                ],
              ),
            ),
          );
        });
  }

  Future _showBottomSheetModel() async {
    final sheet = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    '音乐',
                  ),
                  onTap: () {
                    Navigator.pop(context, Option.A);
                  },
                ),
                ListTile(
                  title: Text('电影'),
                  onTap: () {
                    Navigator.pop(context, Option.B);
                  },
                ),
                ListTile(
                  title: Text('舞蹈'),
                  onTap: () {
                    Navigator.pop(context, Option.C);
                  },
                )
              ],
            ),
          );
        });
    switch (sheet) {
      case Option.A:
        setState(() {
          _bootomSheet = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _bootomSheet = 'B';
        });
        break;
      case Option.C:
        setState(() {
          _bootomSheet = 'C';
        });
        break;
    }
  }
}

class SimpleDialogDemo extends StatefulWidget {
  final Widget child;

  SimpleDialogDemo({Key key, this.child}) : super(key: key);

  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';

  Future _openSimpleDialog() async {
    final options = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('音乐'),
                onPressed: () {
                  Navigator.pop(context, Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text('电影'),
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
              ),
            ],
          );
        });
    switch (options) {
      case Option.A:
        setState(() {
          _choice = '音乐';
        });
        break;
      case Option.B:
        setState(() {
          _choice = '电影';
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(_choice),
        onPressed: () {
          _openSimpleDialog();
        },
      ),
    );
  }
}
