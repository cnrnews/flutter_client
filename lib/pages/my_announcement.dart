import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/utils/api.dart';
import 'package:app/data/asset.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widget/progress_hud.dart';


//我的公告
class MyAnnouncement extends StatefulWidget {
  _MyAnnouncementState createState() => _MyAnnouncementState();
}

//离线消息
class _MyAnnouncementState extends State<MyAnnouncement> {
  //定义一个成员变量
  List<Announcement> beans = [];
  final titleStyle = TextStyle(color: Colors.black, fontSize: 16);
  final subTitleStyle = TextStyle(color: Colors.grey, fontSize: 13);
  ProgressHUD _progressHUD;
  bool _isLoading=true;
  _loadData() async {
    var param = {"user_id": "45", "page": "1"};
    final result = await http.post(API_MY_ANNOUNCEMENT, body: param);
    if (result.statusCode == 200) {
      var data = BaseResult.fromJson(json.decode(result.body)['data']);
      List list = data.data;
      for (int i = 0; i < list.length; i++) {
        beans.add(Announcement.fromJson(list[i]));
      }
      return beans;
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    super.initState();
    _progressHUD=ProgressHUD(
      backgroundColor: Colors.white,
      color: Colors.white,
      text: 'loading...',
    );
    _loadData().then((obj) {
      setState(() {
        dissmissLoading();
        beans = obj;
      });
    });
  }
  void dissmissLoading(){
    if(_isLoading)
    {
      _progressHUD.state.dismiss();
    }else{
      _progressHUD.state.show();
    }
    _isLoading=!_isLoading;

  }
  _buildItem(int index) {
    var create=new Utils().formatDate(int.parse(beans[index].addtime));
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
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.looks),
                  Text(beans[index].countstats)
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: new Text(create,style: subTitleStyle),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('公告'),
        actions: <Widget>[Icon(Icons.add)],
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
      )
    );
  }
}
