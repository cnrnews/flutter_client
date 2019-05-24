import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'swiper_page.dart';
import 'package:app/data/asset.dart';
import 'package:app/widget/progress_hud.dart';

class MeetingDetail extends StatefulWidget {
  final String meetingId;
  MeetingDetail({Key key, this.meetingId}) : super(key: key);
  _MeetingDetailState createState() => _MeetingDetailState();
}

class _MeetingDetailState extends State<MeetingDetail>
    with SingleTickerProviderStateMixin {
  MeetingBean detail;
  ProgressHUD _progressHUD;
  bool _isLoading = true;
  _getMeetingDetail() async {
    var api = 'https://xh.2188.com.cn/app/Conference/getOne?format=json';
    var item = {
      "id": widget.meetingId,
    };
    try {
      final response = await http.post(api, body: item);
      if (response.statusCode == 200) {
        var result = BaseResult.fromJson(json.decode(response.body)['data']);
        return MeetingBean.fromJson(result.data);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _progressHUD = ProgressHUD(
      backgroundColor: Colors.white,
      color: Colors.white,
      text: 'loading...',
    );
    _getMeetingDetail().then((beanLi) {
      setState(() {
        dissmissLoading();
        detail = beanLi;
      });
    });
  }

  void dissmissLoading() {
    if (_isLoading) {
      _progressHUD.state.dismiss();
    } else {
      _progressHUD.state.show();
    }
    _isLoading = !_isLoading;
  }

  _buildShareItem(IconData iconData, String title) {
    return Expanded(
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(iconData),
            onPressed: () {},
          ),
          Text(title)
        ],
      ),
    );
  }

  _buildBottomSheet() {
    return Builder(
      builder: (context) => IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      height: 150.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              _buildShareItem(Icons.speaker_group, '新浪微博'),
                              _buildShareItem(
                                  Icons.stay_primary_landscape, 'QQ空间'),
                              _buildShareItem(Icons.smoking_rooms, '微信好友'),
                              _buildShareItem(Icons.first_page, '微信朋友圈'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              _buildShareItem(Icons.place, 'QQ'),
                              _buildShareItem(Icons.find_replace, '好友'),
                              Expanded(
                                child: Container(),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          )
                        ],
                      ));
                });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (detail == null) {
      return new Scaffold(
        appBar: AppBar(
          title: Text(''),
          actions: <Widget>[_buildBottomSheet()],
        ),
      );
    }
    return new Scaffold(
        appBar: AppBar(
          title: Text(detail.title),
          actions: <Widget>[_buildBottomSheet()],
        ),
        bottomNavigationBar: _buildBottomBar(context),
        body: Stack(
          children: <Widget>[
            _progressHUD,
            _buildMeetingDetail(context),
          ],
        ));
  }

  _buildBottomNavigationBarItem(Color color, String title) {
    return BottomNavigationBarItem(
        title: Text(''),
        icon: MaterialButton(
          // minWidth: 0.0,
          color: color,
          child: Text(title, style: TextStyle(color: Colors.white)),
          onPressed: () {},
        ));
  }

  _buildBottomBar(BuildContext context) {
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        _buildBottomNavigationBarItem(Colors.grey, '已收藏'),
        _buildBottomNavigationBarItem(Colors.blue, '已结束'),
        _buildBottomNavigationBarItem(Colors.blue, '进入讨论组')
      ],
      type: BottomNavigationBarType.fixed,
    );
  }

  _buildInfoItem(IconData iconData, String title, String info) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 8),
      child: Row(children: <Widget>[
        Row(
          children: <Widget>[
            Icon(iconData),
            Padding(child: Text(title), padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(info),
        )
      ]),
    );
  }

  _buildInfoItemWidthRight(IconData iconData, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 8),
      child: Row(children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Icon(iconData),
            Padding(child: Text(title), padding: EdgeInsets.only(left: 8)),
          ],
        )),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(Icons.keyboard_arrow_right),
        )
      ]),
    );
  }

  _buildMeetingDetail(BuildContext context) {
    var expansionPan = Column(
      children: <Widget>[
        _buildInfoItem(Icons.date_range, '会议时间', detail.etime),
        Divider(),
        _buildInfoItem(
            Icons.location_city, '会议地点', detail.address + detail.xxaddress),
        Divider(),
        _buildInfoItem(Icons.computer, '举办单位', detail.companyname),
        Divider(),
        _buildInfoItemWidthRight(Icons.child_friendly, '合作伙伴'),
        Divider(),
        _buildInfoItemWidthRight(Icons.people, '参会人员')
      ],
    );
    var expansionTile = ExpansionTile(
      title: Text('更多信息'),
      leading: Icon(Icons.more_horiz),
      children: <Widget>[expansionPan],
    );
    var tabs = DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            Container(
              height: 20,
            ),
            TabBar(
              tabs: <Widget>[
                new Text(
                  '会议介绍',
                  style: TextStyle(color: Colors.grey),
                ),
                new Text(
                  '会议日程',
                  style: TextStyle(color: Colors.grey),
                ),
                new Text(
                  '会议嘉宾',
                  style: TextStyle(color: Colors.grey),
                ),
                new Text(
                  '参会指南',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ));
    var basicInfo = Column(
      children: <Widget>[
        _buildInfoItem(Icons.contacts, '联系人', detail.contact),
        Divider(),
        _buildInfoItem(Icons.contact_phone, '联系电话', detail.phone),
        Divider(),
        _buildInfoItemWidthRight(Icons.file_upload, '会议资料'),
        Divider(),
        _buildInfoItemWidthRight(Icons.question_answer, '调查问卷'),
        expansionTile,
        tabs
      ],
    );
    var meetingDetail = ListView(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 12, top: 12),
            child: Text(
              detail.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              SwiperPage(),
              //基本信息
              basicInfo,
            ],
          ),
        )
      ],
    );
    return meetingDetail;
  }
}
