import 'package:flutter/material.dart';

//会议管理
class TabBarWidget extends StatefulWidget {
  final Widget child;

  TabBarWidget({Key key, this.child}) : super(key: key);

  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          bottom: TabBar(
             controller: tabController,
            tabs: <Widget>[
              IconButton(
                icon: Icon(Icons.cake),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.directions_bike),
                onPressed: () {},
              )
            ],
          ),
        ),
        body: TabBarView(
           controller: tabController,
          children: <Widget>[
            Center(
              child: Text('cake'),
            ),
            Center(
              child: Text('bike'),
            )
          ],
        ),
      ),
    );
  }
}
