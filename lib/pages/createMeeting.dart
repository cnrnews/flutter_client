import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final titleStyle = TextStyle(color: Colors.black, fontSize: 16.0);
final inputStyle = TextStyle(color: Colors.grey.shade400, fontSize: 13.0);

class CreateMeeting extends StatefulWidget {
  // CreateMeeting( ) : super(key: key);
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  bool _check = false;
  String _radio;
  _buildBody() {
    var isOpen = Row(
      children: <Widget>[
        Text(
          '是否公开',
          style: titleStyle,
        ),
        Radio(
          groupValue: _radio,
          activeColor: Colors.blue,
          value: '0',
          onChanged: (String val) {
            setState(() {
              _radio = val;
            });
          },
        ),
        Radio(
          groupValue: _radio,
          activeColor: Colors.blue,
          value: '1',
          onChanged: (String val) {
            _radio = val;
          },
        ),
      ],
    );
    var container = Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: '会议名称',
              labelStyle: titleStyle,
              hintText: '请输入会议名称',
              hintStyle: inputStyle),
        ),
        Divider(),
        isOpen,
        Divider(),
        GestureDetector(
          child: Row(
            children: <Widget>[
              Text(
                '会议图片',
                style: titleStyle,
              ),
              Icon(Icons.picture_as_pdf)
            ],
          ),
           onTap:(){
           },
        ),
        Container(
          height: 20,
          color: Color.fromARGB(214, 215, 214, 214),
        ),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: '会议地点',
              labelStyle: titleStyle,
              hintText: '请输入会议地点',
              hintStyle: inputStyle),
          onTap: () {
          },
        ),
        Divider(),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: '详细地址',
              labelStyle: titleStyle,
              hintText: '请输入详细地址',
              hintStyle: inputStyle),
        ),
        Divider(),
        TextField(
          decoration: InputDecoration(
              labelText: '联系人',
              border: InputBorder.none,
              labelStyle: titleStyle,
              hintText: '请输入联系人',
              hintStyle: inputStyle),
        ),
        Divider(),
        TextField(
          decoration: InputDecoration(
              labelText: '联系电话',
              border: InputBorder.none,
              labelStyle: titleStyle,
              hintText: '请输入联系电话',
              hintStyle: inputStyle),
        ),
        Container(
          height: 20,
          color: Color.fromARGB(214, 215, 214, 214),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: '会议简介',
              labelStyle: titleStyle,
              border: InputBorder.none,
              hintText: '请输入会议简介',
              hintStyle: inputStyle),
        ),
        Divider(),
        Text(
          '会议时间',
          style: titleStyle,
        ),
        ListTile(
          title: Row(
            children: <Widget>[Icon(Icons.date_range), Text('开始时间')],
          ),
          onTap: () {
            _showDatePiker();
          },
        ),
        ListTile(
          title: Row(
            children: <Widget>[Icon(Icons.date_range), Text('结束时间')],
          ),
          onTap: () {
            _showDatePiker();
          },
        ),
        ListTile(
          title: Row(
            children: <Widget>[Icon(Icons.date_range), Text('签到时间')],
          ),
          onTap: () {
            _showDatePiker();
          },
        ),
        Divider(),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '参会者审核',
                style: titleStyle,
              ),
            ),
            Switch(
              value: this._check,
              activeColor: Colors.blue,
              onChanged: (bool val) {
                setState(() {
                  this._check = !this._check;
                });
              },
            )
          ],
        )
      ],
    );
    var body = Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[container],
        ));
    return body;
  }

  _showDatePiker() {
    // 调用函数打开
    showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
      lastDate: new DateTime.now().add(new Duration(days: 30)), // 加 30 天
    ).then((DateTime val) {
      print(val); // 2018-07-12 00:00:00.000
      _showTimePicker();
    }).catchError((err) {
      print(err);
    });
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    ).then((val) {
      print(val);
    }).catchError((err) {
      print(err);
    });
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
                title: new Text("提示"),
                content: new Text("确认退出?"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("取消"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new Text("确定"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  )
                ]));
  }

  Future<bool> _requestPop() {
    showAlertDialog(context);
    return new Future<bool>.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text('新建会议'),
            actions: <Widget>[
              Center(
                child: Text(
                  '发布',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          body: _buildBody(),
        ),
        onWillPop: _requestPop);
  }
}
