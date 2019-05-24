import 'package:flutter/material.dart';
import 'package:app/pages/user_detail.dart';
import 'package:app/utils/utils.dart';
//关注
class Contact extends StatelessWidget {
  _renderAppBar(BuildContext context) {
    return AppBar(
      title: Text('幸会'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('搜索'),
            ));
          },
        ),
        IconButton(
          icon: Icon(Icons.scanner),
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('扫码关注'),
            ));
          },
        )
      ],
    );
  }
  _renderBody(BuildContext context){
   return   ListView(
          children: <Widget>[
            ListTile(
              title: Text('添加好友'),
              leading: Icon(Icons.new_releases),
              onTap: () {},
            ),
            new Divider(),
            ListTile(
              title: Text('新建群组'),
              leading: Icon(Icons.group_add),
              onTap: () {},
            ),
            new Divider(),
            ListTile(
              title: Text('通讯录好友'),
              leading: Icon(Icons.contacts),
              onTap: () {},
            ),
            new Divider(),
            ListTile(
              title: Text('影响力(21)'),
              leading: Icon(Icons.change_history),
              onTap: () {},
            ),
            new Container(
              alignment: Alignment.centerLeft,
              color: Color.fromARGB(214, 215, 214, 214),
              child: Text('A'),
              height: 30.0,
            ),
            ListTile(
              title: Text('阿里巴巴'),
              leading: Icon(Icons.all_inclusive),
              onTap: () {
                new Utils().pushOtherPage(context, UserDetail(uid:"64"));
              },
            ),
            new Divider(),
            ListTile(
              title: Text('爱雪'),
              leading: Icon(Icons.near_me),
              onTap: () {
                new Utils().pushOtherPage(context, UserDetail(uid:"64"));
              },
            ),
            new Container(
              alignment: Alignment.centerLeft,
              color: Color.fromARGB(214, 215, 214, 214),
              child: Text('B'),
              height: 30.0,
            ),
            ListTile(
              title: Text('爸爸'),
              leading: Icon(Icons.format_shapes),
              onTap: () {
                new Utils().pushOtherPage(context, UserDetail(uid:"64"));

              },
            ),
            new Divider(),
            ListTile(
              title: Text('必力'),
              leading: Icon(Icons.blur_linear),
              onTap: () {
              new Utils().pushOtherPage(context, UserDetail(uid:"64"));
              },
            ),
          ],
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _renderAppBar(context),
        body: _renderBody(context));
  }
}
