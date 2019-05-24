import 'package:flutter/material.dart';
import 'meeting_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/utils/utils.dart';

var smallType =
    TextStyle(color: Color.fromARGB(214, 215, 214, 214), fontSize: 13);

class NoteBean {
  String id;
  String status;
  String title;
  String ctime;
  String etime;
  String qtime;
  String address;
  String xxaddress;
  String isUser;
  String isPrivate;
  String click;
  String companypic;
  NoteBean.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        status = map['status'],
        title = map['title'],
        ctime = map['ctime'],
        etime = map['etime'],
        qtime = map['qtime'],
        address = map['address'],
        xxaddress = map['xxaddress'],
        isUser = map['is_user'],
        isPrivate = map['is_private'],
        click = map['click'],
        companypic = map['companypic'];
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
var dataLi = <NoteBean>[];
//会议
class MeetingList extends StatefulWidget {
  _MeetingListWidgetState createState() => _MeetingListWidgetState();
}
class _MeetingListWidgetState extends State<MeetingList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  var resultMap;
  //定义一个成员变量
  List<NoteBean> _notes = [];
  _getMeetingList() async {
    var api = 'https://xh.2188.com.cn/app/Conference/myaudit?format=json';
    var item = {
      "user_id": "45",
    };
    try {
      final response = await http.post(api, body: item);
      if (response.statusCode == 200) {
        var result = ResultBean.fromJson(json.decode(response.body)['data']);
        List data = result.data;
        for (int i = 0; i < data.length; i++) {
          dataLi.add(NoteBean.fromJson(data[i]));
        }
        return dataLi;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getMeetingList().then((beanLi) {
      setState(() {
        _notes = beanLi;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[_buildItem(_notes[index]), Divider(height: 1)],
          );
        },
      ),
    );
  }

  _buildItem(NoteBean meeting) {
    if (meeting == null) {
      return ListTile();
    }
    var item = ListTile(
      title: Row(children: <Widget>[
        Image.network(
          new Utils().parseImageUrl(meeting.companypic),
          fit: BoxFit.fitHeight,
          width: 120,
          height: 90,
        ),
        //2
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  meeting.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.looks),
                      Text(
                        meeting.click,
                        style: smallType,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    meeting.address,
                    style: smallType,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          flex: 2,
        ),
        //3
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                new Utils().meetingStatus(meeting.status),
                style: TextStyle(color: Colors.lightBlue),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  meeting.ctime.split(' ')[0],
                  style: smallType,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          flex: 1,
        ),
      ]),
      onTap: () {
        new Utils().pushOtherPage(context, MeetingDetail(meetingId:meeting.id));
      },
    );
    return item;
  }
}
