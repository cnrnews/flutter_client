import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/utils/api.dart';
import 'package:app/data/asset.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widget/progress_hud.dart';

//个人分享
class PersonShare extends StatefulWidget {
  _PersonShareState createState() => _PersonShareState();
}

//离线消息
class _PersonShareState extends State<PersonShare> {
  //定义一个成员变量
  List<Announcement> beans = [];
  final titleStyle = TextStyle(color: Colors.black, fontSize: 16);
  final nicknameStyle = TextStyle(color: Colors.black, fontSize: 14);
  final subTitleStyle = TextStyle(color: Colors.grey, fontSize: 13);
  ProgressHUD _progressHUD;
  bool _isLoading=true;
  _loadData() async {
    var param = {"user_id": "45", "page": "1", "type": "1"};
    final result = await http.post(API_PERSON_SHARE, body: param);
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
      color: Colors.blue,
      text: 'loading...',
    );
    _loadData().then((obj) {
      setState(() {
        dismissLoading();
        beans = obj;
      });
    });
  }
  void dismissLoading(){
    if(_isLoading)
    {
      _progressHUD.state.dismiss();
    }else{
      _progressHUD.state.show();
    }
    _isLoading=!_isLoading;
  }

  _buildItem(int index) {
    Announcement item = beans[index];
    var create = new Utils().formatDate(int.parse(item.addtime));
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Image.network(
                'https://goss.veer.com/creative/vcg/veer/800water/veer-310158280.jpg',
                width: 50,
                height: 50,
              ),
              Container(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.nickname,
                    style: nicknameStyle,
                  ),
                  Text(
                    item.title,
                    style: titleStyle,
                  ),
                ],
              )
            ],
          )),
          Text(create, style: subTitleStyle)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人分享'),
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
    ));
  }
}
