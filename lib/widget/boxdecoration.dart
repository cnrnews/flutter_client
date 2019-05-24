import 'package:flutter/material.dart';
//BoxDecoration
class BoxDecorationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.4,
      child: ListView(
        children: <Widget>[
          _buildDrawerHeader(),
          ListTile(
            title: Text('商务合作'),
            leading: Icon(Icons.business),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            title: Text('联系方式:010893434'),
            leading: Icon(Icons.contact_phone),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
   return UserAccountsDrawerHeader(
      accountName: Text('candy', style: TextStyle(fontWeight: FontWeight.bold)),
      accountEmail: Text('1601796593@qq.com'),
      //头像
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://goss.veer.com/creative/vcg/veer/800water/veer-152745862.jpg'),
      ),
      decoration: BoxDecoration(
          color: Colors.blue[400],
          //背景图象
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/head.jpg'),
            //滤镜模式
            colorFilter: ColorFilter.mode(
                Colors.blue.withOpacity(0.8), BlendMode.softLight),
          ),
          //圆角
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //边框
          border: Border.all(
              color: Colors.white, width: 1.0, style: BorderStyle.solid),
          //渐变
          gradient: RadialGradient(colors: [
            Color.fromARGB(123, 212, 123, 12),
            Color.fromARGB(23, 43, 43, 12)
          ]),
          // gradient: LinearGradient(
          //    colors: [
          //       Color.fromARGB(123, 212, 123, 12),
          //       Color.fromARGB(23, 43, 43, 12)
          //    ],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter
          // )
          //形状
          shape: BoxShape.rectangle,
          //阴影
          boxShadow: [
            BoxShadow(
                offset: Offset(1.2, 1.0),
                color: Color.fromARGB(12, 32, 123, 251),
                //滤镜程度
                blurRadius: 2.3,
                //扩散程度
                spreadRadius: 1.2)
          ]),
    );
  }
}
