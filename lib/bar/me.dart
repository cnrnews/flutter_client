import 'package:flutter/material.dart';
import 'package:app/pages/userinfo_manage.dart';
import 'package:app/pages/app_seeting.dart';
import 'package:app/pages/download_manage.dart';
import 'package:app/pages/meeting_group.dart';
import 'package:app/utils/utils.dart';
import 'package:app/pages/meeting.dart';
import 'package:app/pages/about_app.dart';
//正常文字
var commonStyle = TextStyle(color: Colors.black, fontSize: 18);
//灰色较小文字
var infoStyle = TextStyle(color: Color(0xff999999), fontSize: 13);

class Settings extends StatelessWidget {
  _buildUserInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('阳光海岸', style: commonStyle),
        Text('tzht2019', style: infoStyle),
      ],
    );
  }
  _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        new Container(
          color: Color.fromARGB(214, 215, 214, 214),
          height: 40.0,
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.dashboard),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: _buildUserInfo(),
                ),
              ),
              Icon(Icons.dashboard)
            ],
          ),
          onTap: () {
            new Utils().pushOtherPage(context, PersonDetail());
          },
        ),
        new Container(
          color: Color.fromARGB(214, 215, 214, 214),
          height: 20.0,
        ),
        ListTile(
          title: Text('我建的群'),
          leading: Icon(Icons.group),
          onTap: () {
            new Utils().pushOtherPage(context, MeetingGroup());
          },
        ),
        new Divider(),
        ListTile(
          title: Text('设置'),
          leading: Icon(Icons.settings),
          onTap: () {
            new Utils().pushOtherPage(context, AppSeetings());
          },
        ),
        new Container(
          color: Color.fromARGB(214, 215, 214, 214),
          height: 30.0,
        ),
        ListTile(
          title: Text('下载管理'),
          leading: Icon(Icons.cloud_download),
          onTap: () {
               new Utils().pushOtherPage(context, DownloadManage());
          },
        ),
        new Divider(),
        ListTile(
          title: Text('我的收藏'),
          leading: Icon(Icons.save),
          onTap: () {
              new Utils().pushOtherPage(context, Meeting(title:'我的收藏'));
          },
        ),
          new Divider(),
        ListTile(
          title: Text('关于APP'),
          leading: Icon(Icons.save),
          onTap: () {
              new Utils().pushOtherPage(context, AboutApp());
          },
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Image.asset('images/p_code.png',scale: 2.3,),
              Text('扫一扫二维码'),
              Text('加我幸会'),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('幸会'),
      ),
      body: _buildBody(context),
    );
  }
}
