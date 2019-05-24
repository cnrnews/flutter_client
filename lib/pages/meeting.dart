import 'package:flutter/material.dart';
import 'meeting_list.dart';
class Meeting extends StatefulWidget {
  final String title;
  Meeting({Key key, this.title}) : super(key: key);
  _MeetingWidgetState createState() => _MeetingWidgetState();
}
class _MeetingWidgetState extends State<Meeting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new MeetingList(),
    );
  }
}
