import 'package:flutter/material.dart';

class DownloadManage extends StatefulWidget {
  _DownloadManageState createState() => _DownloadManageState();
}

class _DownloadManageState extends State<DownloadManage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('下载管理'),
            bottom: TabBar(
              //标签样式
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.white,
             // indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2.0,
              tabs: <Widget>[
                Tab(
                  child: Text('企业资料'),
                ),
                Tab(
                  child: Text('会议资料'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Text('企业资料'),
              ),
              Center(
                child: Text('会议资料'),
              ),
            ],
          ),
        ));
  }
}
