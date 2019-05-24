import 'package:flutter/material.dart';
import '../pages/meeting.dart';
import '../pages/meeting_manage.dart';
import '../pages/meeting_group.dart';
import 'package:app/pages/meeting_home.dart';
import 'package:app/utils/utils.dart';
import 'package:app/pages/personal_share.dart';
import 'package:app/pages/my_push_message.dart';

//发现
class Make extends StatelessWidget {
  _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('业务团队信息'),
          leading: Icon(Icons.business),
          onTap: () {
          },
        ),
        new Divider(),
        ListTile(
          title: Text('潜在客户信息'),
          leading: Icon(Icons.exit_to_app),
        ),
        new Container(
          color: Color.fromARGB(214, 215, 214, 214),
          height: 20.0,
        ),
        ListTile(
          title: Text('个人分享'),
          leading: Icon(Icons.share),
          onTap: () {
            new Utils().pushOtherPage(context, PersonShare());
          },
        ),
        new Divider(),
        ListTile(
          title: Text('企业公告'),
          leading: Icon(Icons.announcement),
          onTap: () {
            new Utils().pushOtherPage(context, PersonShare());
          },
        ),
        new Container(
          color: Color.fromARGB(214, 215, 214, 214),
          height: 20.0,
        ),
        ListTile(
          title: Text('系统消息'),
          leading: Icon(Icons.message),
          onTap: () {
            new Utils().pushOtherPage(context, MyPushMessage());
          },
        ),
        new Divider(),
        ListTile(
          title: Text('扫码签到'),
          leading: Icon(Icons.scanner),
          onTap: () {},
        ),
        new Container(
          color: Color.fromARGB(214, 215, 214, 214),
          height: 20.0,
        ),
        ListTile(
          title: Text('会议商机'),
          leading: Icon(Icons.monetization_on),
          onTap: () {
            new Utils().pushOtherPage(context, MettingHome());
          },
        ),
        new Divider(),
        ListTile(
          title: Text('会议管理'),
          leading: Icon(Icons.markunread),
          onTap: () {
            showAlertDialog(context);
            //  new Utils().pushOtherPage(context,ManageMeeting());
          },
        ),
        Divider(),
        ListTile(
          title: Text('会议群组'),
          leading: Icon(Icons.chat),
          onTap: () {
            new Utils().pushOtherPage(context, MeetingGroup());
          },
        ),
        new Divider(),
        ListTile(
          title: Text('我的会议'),
          leading: Icon(Icons.smartphone),
          onTap: () {
            new Utils().pushOtherPage(context, Meeting(title:'我参加的会议'));
          },
        )
      ],
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new SimpleDialog(
              children: <Widget>[
                ListTile(
                  title: Text('公开'),
                  onTap: () {
                    Navigator.of(context).pop();
                    new Utils().pushOtherPage(context, ManageMeeting());
                  },
                ),
                ListTile(
                  title: Text('内部'),
                  onTap: () {
                    Navigator.of(context).pop();
                    new Utils().pushOtherPage(context, ManageMeeting());
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('幸会')),
      body: _buildBody(context),
    );
  }
}
