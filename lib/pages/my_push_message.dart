import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/utils/api.dart';
import 'package:app/data/asset.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widget/progress_hud.dart';

//离线消息
class MyPushMessage extends StatefulWidget {
  _MyPushMessageState createState() => _MyPushMessageState();
}

//离线消息
class _MyPushMessageState extends State<MyPushMessage> {
  //定义一个成员变量
  List<PushMsg> beans = [];
  final titleStyle = TextStyle(color: Colors.black, fontSize: 16);
  final subTitleStyle = TextStyle(color: Colors.grey, fontSize: 13);
  ProgressHUD _progressHUD;
  bool _loading = true;
  _loadData() async {
    var param = {"user_id": "45", "page": "1"};
    final result = await http.post(API_MY_MESSAGE, body: param);
    if (result.statusCode == 200) {
      var data = BaseResult.fromJson(json.decode(result.body)['data']);
      List list = data.data;
      for (int i = 0; i < list.length; i++) {
        beans.add(PushMsg.fromJson(list[i]));
      }
      return beans;
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    super.initState();
   _progressHUD = new ProgressHUD(
      backgroundColor: Colors.white,
      color: Colors.lightBlue,
      //containerColor: Colors.grey.withAlpha(2),
      // borderRadius: 5.0,
      text: 'Loading...',
    );
    _loadData().then((obj) {
      setState(() {
        dismissProgressHUD();
           beans = obj;
      });
    });
  }

  _buildItem(int index) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              beans[index].title,
              style: titleStyle,
            ),
          ),
          Text(
            new Utils().formatDate(int.parse(beans[index].addtime)),
            style: subTitleStyle,
          ),
        ],
      ),
    );
  }
void dismissProgressHUD() {
      setState(() {
        if (_loading) {
          _progressHUD.state.dismiss();
        } else {
          _progressHUD.state.show();
        }
        _loading = !_loading;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的消息'),
        ),
        body: Stack(
          children: <Widget>[
                 _progressHUD,
            ListView.builder(
              itemCount: beans.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[_buildItem(index), Divider()],
                );
              },
            ),
          ],
        ));
  }
}
