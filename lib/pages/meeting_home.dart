import 'package:flutter/material.dart';
import 'swiper_page.dart';
import 'meeting_list.dart';
import 'package:app/pages/meeting_detail.dart';
import 'package:flutter_marquee/flutter_marquee.dart';
import 'package:app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/widget/zlist/city_select_page.dart';
import 'package:app/widget/progress_hud.dart';

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

class MettingHome extends StatefulWidget {
  _MettingHomeState createState() => _MettingHomeState();
}

class _MettingHomeState extends State<MettingHome> {
  var resultMap;
  var curCity = '北京';
  ProgressHUD progressHUD;
  bool _loading = true;
  //定义一个成员变量
  List<NoteBean> _notes = [];
  _getMeetingList() async {
    var api = 'https://xh.2188.com.cn/app/Conference/myaudit?format=json';
    var item = {"user_id": "45", "page": "1"};
    try {
      final response = await http.post(api, body: item);
      if (response.statusCode == 200) {
        var result = ResultBean.fromJson(json.decode(response.body)['data']);
        List data = result.data;
        for (int i = 0; i < data.length; i++) {
          _notes.add(NoteBean.fromJson(data[i]));
        }
        return _notes;
      }
    } catch (e) {
      print(e);
    }
  }

  _buildAppBar() {
    return AppBar(
        title: GestureDetector(
          child: Row(
            children: <Widget>[
              Text(curCity),
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(Icons.arrow_drop_down),
              )
            ],
          ),
          onTap: () {
            Navigator.push<String>(context,
                new MaterialPageRoute(builder: (BuildContext context) {
              return CitySelectCustomHeaderRoute();
            })).then((String result) {
              //处理代码
              setState(() {
                curCity = result;
              });
            });
            // new Utils().pushOtherPage(context, CitySelectCustomHeaderRoute());
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton(
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[Icon(Icons.filter_2), Text('分类')],
              ),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('全部'),
                    ),
                  ),
                  PopupMenuItem(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('金融'),
                    ),
                  ),
                  PopupMenuItem(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('信息技术'),
                    ),
                  ),
                  PopupMenuItem(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('商业服务'),
                    ),
                  ),
                ],
            offset: Offset(112, 380),
          ),
          PopupMenuButton(
            child: Padding(
              padding: EdgeInsets.only(right: 12, left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[Icon(Icons.date_range), Text('时间')],
              ),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('不限'),
                    ),
                  ),
                  PopupMenuItem(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('最近3天'),
                    ),
                  ),
                  PopupMenuItem(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('最近一个月'),
                    ),
                  ),
                  PopupMenuItem(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('最近三个月'),
                    ),
                  ),
                ],
            offset: Offset(242, 380),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          children: <Widget>[
            progressHUD,
            _buildBody(),
          ],
        ));
  }
  @override
  void initState() {
    super.initState();
    progressHUD =new ProgressHUD(
      backgroundColor: Colors.white,
      color: Colors.blue,
      text: 'loading...',
    );
    _getMeetingList().then((bean) {
      setState(() {
        _notes = bean;
        dismissProgress();
      });
    });
  }

  void dismissProgress() {
    setState(() {
      if (_loading) {
        progressHUD.state.dismiss();
      } else {
        progressHUD.state.show();
      }
      _loading = !_loading;
    });
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
        new Utils()
            .pushOtherPage(context, MeetingDetail(meetingId: meeting.id));
      },
    );
    return item;
  }

  _buildTop() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(4),
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: FlutterMarquee(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.fast_forward),
                      Text(
                        "爱丽丝奇境缤纷之旅中国首展.北京站",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.fast_forward),
                      Text(
                        "【资本正道】2018企业上市与",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
              onChange: (i) {},
              animationDirection: AnimationDirection.t2b,
              duration: 4),
        )
      ],
    );
  }

  _buildBody() {
    if (_notes == null) {
      return Container();
    }
    var body = CustomScrollView(
      physics: ScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(child: _buildTop()),
        SliverToBoxAdapter(
          child: SwiperPage(),
        ),
        SliverFixedExtentList(
          itemExtent: 100.0,
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
            return _buildItem(_notes[index]);
          }, childCount: _notes.length),
        ),
      ],
    );
    return body;
  }
}
