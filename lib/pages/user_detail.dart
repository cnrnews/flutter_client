import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'swiper_page.dart';
import 'package:app/data/asset.dart';
import 'package:app/widget/progress_hud.dart';

//用户详情
class UserDetail extends StatefulWidget {
  final String uid;
  UserDetail({Key key,this.uid}):super(key:key);
  _UserDetailState createState() => _UserDetailState();
}
class _UserDetailState extends State<UserDetail> {
  final commonStyle = TextStyle(
      color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold);
  final infoStyle = TextStyle(color: Colors.grey, fontSize: 14.0);
  DataBean _dataBean;
  ProgressHUD _progressHUD;
  bool _isLoading=true;
  _loadUserInfo() async {
    var api = 'https://xh.2188.com.cn/app/Conference/companyqx?format=json';
    var param = {'conf_user_id': '64'};
    var response = await http.post(api, body: param);
    if (response.statusCode == 200) {
      var result = BaseResult.fromJson(json.decode(response.body)['data']);
      return DataBean.fromJson(result.data);
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
    _loadUserInfo().then((bean) {
      setState(() {
        dismissLoading();
        _dataBean = bean;
      });
    });
  }
  void dismissLoading(){
    if(_isLoading)
    {
      _progressHUD.state.dismiss();
    }else{
      _progressHUD.state.show();
    }
    _isLoading=!_isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('企业信息详情'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
      body: Stack(
        children: <Widget>[
          _progressHUD,
           _buildBody(),
        ],
      )
    );
  }

  _buildBottomBar(BuildContext context) {
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            title: Text(''),
            icon: MaterialButton(
              minWidth: 120.0,
              color: Colors.grey,
              child: Text('取消关注', style: TextStyle(color: Colors.white)),
              onPressed: () {},
            )),
        new BottomNavigationBarItem(
            title: Text(''),
            icon: MaterialButton(
                minWidth: 120.0,
                color: Colors.blue,
                child: Text(
                  '发送消息',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {})),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }

  _buildBody() {
    if (_dataBean == null) {
      return Container();
    }
    var expansionPan = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.local_activity),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('地址', style: commonStyle),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text('新媒体', style: infoStyle),
                    )
                  ],
                ),
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.email),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('公司邮箱', style: commonStyle),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text('1601974@qq.com', style: infoStyle),
              )
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.local_bar),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('公司电话', style:  commonStyle),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text('18891021', style:  infoStyle),
              )
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.local_activity),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('企业资料', style:  commonStyle),
                    ),
                  ],
                ),
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.local_activity),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text('公司简介', style: commonStyle),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
              Text(
                '百度翻译官方出品。支持27种语言的翻译，浏览外文网页时可一键网页翻译、双语对照查看、查询单词结果等。特别针对20+家海淘网站进行过翻译优化，让你的海淘过程更加得心应手。',
                style:  infoStyle,
              ),
            ],
          ),
        ),
      ],
    );
    var expansionTile = ExpansionTile(
      title: Text('更多信息'),
      leading: Icon(Icons.more_horiz),
      children: <Widget>[expansionPan],
    );
    var basicInfo = Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network('https://lhldream.top/images/favicon.png'),
            Text(
              _dataBean.companyname,
              style:  commonStyle,
            ),
            Icon(
              Icons.business,
              size: 12,
            ),
            Icon(
              Icons.ac_unit,
              size: 12,
            )
          ],
        ),
        SwiperPage(),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.announcement),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('公告', style:  commonStyle),
                    )
                  ],
                ),
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.contacts),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('联系方式', style:  commonStyle),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text('188102948', style:  infoStyle),
              )
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.redeem),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('用户备注', style:  commonStyle),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: <Widget>[
                    Text('用户备注', style:  infoStyle),
                    Icon(
                      Icons.redeem,
                      size: 12,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.local_bar),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('所属行业', style: commonStyle),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text('新媒体', style: infoStyle),
              )
            ],
          ),
        ),
        expansionTile
        // _expansionPanelList,
      ],
    );
    var body = Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            basicInfo,
          ],
        ));
    return body;
  }
}
