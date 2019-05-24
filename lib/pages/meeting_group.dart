import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/widget/progress_hud.dart';

class NoteBean {
  String id;
  String title;
  String userId;
  String groupId;
  String groupMaster;
  String addtime;

  NoteBean.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        userId = map['user_id'],
        groupId = map['group_id'],
        groupMaster = map['group_master'],
        addtime = map['addtime'];
}

class ResultBean {
  String msg;
  int code;
  var data;
  ResultBean.fromJson(Map<String, dynamic> map)
      : msg = map['msg'],
        code = map['code'],
        data = map['result'];
}

class MeetingGroup extends StatefulWidget {
  final Widget child;

  MeetingGroup({Key key, this.child}) : super(key: key);

  _MeetingGroupState createState() => _MeetingGroupState();
}

class _MeetingGroupState extends State<MeetingGroup> {
  
  var dataLi = <NoteBean>[];
  ProgressHUD _progressHUD;
  bool _isLoading=true;
  _loadMeetingGroup() async {
    var api =
        'https://xh.2188.com.cn/app/Conferencegroupchat/grouplist?format=json';
    var params = {'group_master': '45', 'page': '1'};
    try {
      final response = await http.post(api, body: params);
      if (response.statusCode == 200) {
        var result = ResultBean.fromJson(json.decode(response.body)['data']);
        List data = result.data;
        for (int i = 0; i < data.length; i++) {
          dataLi.add(NoteBean.fromJson(data[i]));
        }
        return dataLi;
      }
    } catch (e) {}
  }
  @override
  void initState() {
    super.initState();
    _progressHUD=ProgressHUD(
      backgroundColor: Colors.white,
      color: Colors.white,
      text: 'loading...',
    );
    _loadMeetingGroup().then((beanli) {
      setState(() {
        dismissLoading();
        dataLi = beanli;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会议群组'),
      ),
      body:Stack(
        children: <Widget>[

          _progressHUD,
           ListView.builder(
        itemCount: dataLi.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              _renderItem(dataLi[index]),
              Divider(
                height: 1,
              )
            ],
          );
        },
      ),
        ],
      )
    );
  }

  _renderItem(NoteBean item) {
    var view = Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'images/rc_discussion.png',
                    scale: 2.4,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        item.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Text('1980-12-12')
          ],
        ),
        onTap: () {},
      ),
    );
    return view;
  }
}
