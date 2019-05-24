import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/utils/api.dart';
import 'package:app/data/asset.dart';
import 'package:app/widget/progress_hud.dart';

class AboutApp extends StatefulWidget {
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  var basicStyle = TextStyle(color: Colors.black, fontSize: 18);
  var infoStyle = TextStyle(color: Colors.grey, fontSize: 13);
  AboutAppBean aboutApp;
  ProgressHUD _progressHUD;
  bool isLoading=true;

  loadData() async {
    final result = await http.get(API_ABOUT_APP);
    if (result.statusCode == 200) {
      var data = AppBaseResult.fromJson(json.decode(result.body));
      return AboutAppBean.fromJson(data.data);
    }
  }

  @override
  void initState() {
    super.initState();
    _progressHUD=ProgressHUD(
      backgroundColor: Colors.white,
      color: Colors.blue,
      text: 'loading...',
    );
    loadData().then((bean) {
      setState(() {
        aboutApp = bean;

        dissmissLoading();
      });
    });
  }
  void dissmissLoading(){
    if(isLoading)
  {
    _progressHUD.state.dismiss();
  }else
  {_progressHUD.state.show();}
isLoading=!isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于APP'),
      ),
      body: Stack(
        children: <Widget>[
          _progressHUD,
           _buildBody(),
        ],
      )
    );
  }

  _buildInfo(String title, String info) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(title, style: basicStyle),
          ),
          Text(info, style: infoStyle)
        ],
      ),
    );
  }

  _buildBody() {
    if (aboutApp == null) {
      return Container();
    }
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/head.jpg',
                  width: 120,
                  height: 120,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4, bottom: 4),
                  child: Text(
                    '版本号:' + aboutApp.appVersion,
                    style: basicStyle,
                  ),
                ),
                Text(aboutApp.appInfo, style: basicStyle),
                Container(
                  height: 12,
                )
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.grey.shade300,
          ),
          Column(
            children: <Widget>[
              _buildInfo('平台客服电话', aboutApp.appPhone),
              Divider(),
              _buildInfo('公司官网', aboutApp.appUrl),
              Divider(),
              _buildInfo('公司地址', aboutApp.appAddress)
            ],
          ),
        ],
      ),
    );
  }
}
