import 'package:flutter/material.dart';
import 'meeting_list.dart';
import 'package:app/utils/utils.dart';
import 'package:app/pages/createMeeting.dart';

//会议管理
class ManageMeeting extends StatefulWidget {
  final Widget child;

  ManageMeeting({Key key, this.child}) : super(key: key);

  _ManageMeetingState createState() => _ManageMeetingState();
}

class _ManageMeetingState extends State<ManageMeeting> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('我发布的'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: IconButton(
                  icon: Icon(
                    Icons.create,
                  ),
                  onPressed: () {
                    new Utils().pushOtherPage(context, CreateMeeting());
                  }),
            ),
          ],
          bottom: new TabBar(
            tabs: <Widget>[
              new Text('进行中'),
              new Text('已结束'),
            ],
          ),
        ),
        body: new TabBarView(
          children: <Widget>[new MeetingList(), new MeetingList()],
        ),
      ),
    );
  }
}
