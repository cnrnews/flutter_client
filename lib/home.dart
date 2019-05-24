import 'package:flutter/material.dart';
import 'package:app/bar/message.dart';
import 'package:app/bar/find.dart';
import 'package:app/bar/contact.dart';
import 'package:app/bar/me.dart';
import 'package:app/pages/drawer_app.dart';

class BottomNavigation{
  String title;
  IconData iconData;
  BottomNavigation({this.title,this.iconData});
}


class BottomNavagationBarWidget extends StatefulWidget {
  _BottomNavagationBarWidgetState createState() =>
      _BottomNavagationBarWidgetState();
}

class _BottomNavagationBarWidgetState extends State<BottomNavagationBarWidget> {
  final _activieColor = Colors.lightBlue;
  List<Widget> list = List();
  List<BottomNavigation> items=List();
  int _curIndex = 0;
  @override
  void initState() {
    list = [Home(), Make(), Contact(), Settings()];
    items=[
       BottomNavigation(
        title: '消息',
        iconData: Icons.message
      ),
      BottomNavigation(
        title: '发现',
        iconData: Icons.find_replace
      ),
      BottomNavigation(
        title: '关注',
        iconData: Icons.contacts
      ),
       BottomNavigation(
        title: '我',
        iconData: Icons.menu
      ),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDemo(),
      body: list[_curIndex],
      bottomNavigationBar: _buildBottomBar(),
    );
  }
  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _curIndex,
      fixedColor: _activieColor,
      items: items.map((BottomNavigation item){
        return BottomNavigationBarItem(
          title: Text(item.title),
          icon: Icon(item.iconData),
          activeIcon: Icon(item.iconData, color: _activieColor),
        );
      }).toList(),
      onTap: (int index) {
        setState(() {
          _curIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
    );
  }
}
