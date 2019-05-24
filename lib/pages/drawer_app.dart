import 'package:flutter/material.dart';
class DrawerDemo extends StatelessWidget {
  final Widget child;
  DrawerDemo({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerHeader() {
      return UserAccountsDrawerHeader(
        accountName:
            Text('candy', style: TextStyle(fontWeight: FontWeight.bold)),
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
            //边角
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
            shape: BoxShape.rectangle),
      );
    }
    Widget _buildHeaderList() {
      return Column(
        children: <Widget>[
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
      );
    }
    return Drawer(
      elevation: 0.4,
      child: ListView(
        children: <Widget>[
          _buildDrawerHeader(),
          _buildHeaderList()
        ],
      ),
    );
  }
}
