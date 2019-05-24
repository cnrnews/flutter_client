import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/utils/api.dart';
import 'package:app/data/asset.dart';

class PersonDetail extends StatefulWidget {
  _PersonDetailState createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  var titleStyle = TextStyle(color: Colors.black, fontSize: 15);
  var infoStyle = TextStyle(color: Colors.grey, fontSize: 13);
  DataBean _dataBean;
  loadData() async {
    var param = {"id": "45"};
    final result = await http.post(API_USER_INFO, body: param);
    if (result.statusCode == 200) {
      var userData = AppBaseResult.fromJson(json.decode(result.body));
      return DataBean.fromJson(userData.data);
    }
  }

  @override
  void initState() {
    super.initState();
    loadData().then((bean) {
      setState(() {
        _dataBean = bean;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_dataBean == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('用户详情'),
        ),
      );
    }
    return Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: new SliverAppBar(
                //appbar标题
                title: const Text('用户详情'),
                //列表在滚动的时候appbar是否一直保持可见
                pinned: true,
                //展开的最大高度
                expandedHeight: 140.0,
                flexibleSpace: const FlexibleSpaceBar(
                  //背景,final Widget background;
                  //我们要使用的Image对象必须是const声明的常量对象,对象不可变
                  background: const Image(
                    colorBlendMode: BlendMode.multiply,
                    color: Colors.black38,
                    image: const AssetImage("images/head.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                //强制appbar下面有阴影
                forceElevated: true,
              ),
            )
          ];
        },
        body: new SafeArea(
          child: _buildBody(),
          top: true,
        ),
      ),
    );
  }

  _buildBody() {
    var _basicInfo = Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Row(
                    children: <Widget>[
                      Image.network('https://lhldream.top/images/favicon.png'),
                      Text(_dataBean.nickname)
                    ],
                  )),
                  Row(
                    children: <Widget>[
                      Text(
                        '更改头像',
                        style: infoStyle,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.restore_from_trash),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '二维码名片',
                            style: titleStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.query_builder),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.cloud_off),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '所属行业',
                            style: titleStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _dataBean.position,
                        style: infoStyle,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.near_me),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '企业名称',
                            style: titleStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _dataBean.companyname,
                        style: infoStyle,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.local_cafe),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '公司地址',
                            style: titleStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _dataBean.address,
                        style: infoStyle,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.local_airport),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '详细地址',
                            style: titleStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _dataBean.area,
                        style: infoStyle,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.directions_run),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '公司官网',
                            style: titleStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _dataBean.website,
                        style: infoStyle,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.credit_card),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '公司邮箱',
                            style: titleStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _dataBean.email,
                        style: infoStyle,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.comment),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '公司电话',
                            style: titleStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _dataBean.phone,
                        style: infoStyle,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.closed_caption),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            '公司简介',
                            style: titleStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _dataBean.profile,
                        style: infoStyle,
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
    var body = ListView(
      children: <Widget>[
        _basicInfo,
      ],
    );
    return body;
  }
}
