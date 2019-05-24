import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassWidget  extends StatelessWidget {
  final Widget child;

  FrostedGlassWidget ({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('毛玻璃'),
      ),
      body: Stack(
        children: <Widget>[
            ConstrainedBox(
               constraints: const BoxConstraints.expand(),//限制条件，可扩展的
               child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg'),
            ),
            Center(
              child: ClipRect(//裁切矩形
                 child: BackdropFilter(//背景过滤器
                    filter: ImageFilter.blur( sigmaX: 5.0,sigmaY: 5.0),
                    child: Opacity(//透明组件
                       opacity: 0.4,//透明度 0-1
                       child: Container(
                         width: 500.0,
                         height: 700.0,
                         decoration:  BoxDecoration(color: Colors.grey.shade200),//盒子装饰器
                         child: Center(
                           child: Text('睡醒的兔子',style: Theme.of(context).textTheme.display3,),
                         ),
                       ),
                    ),
                 ),
              ),
            )
        ],
      ),
    );
  }
}