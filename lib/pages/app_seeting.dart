import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart'; 
import 'package:app/data/asset.dart';

class AppSeetings extends StatelessWidget {
  _renderAppBar(BuildContext context) {
    return AppBar(
      title: Text('设置'),
    );
  }
  _buildItem(context,index)
  {
    return ListTile(
          title: Text(items[index].name),
          onTap: () {
            new Utils().pushOtherPage(context,items[index].widget); 
          },
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _renderAppBar(context), body: ListView.builder(
       itemCount: items.length,
       itemBuilder: (BuildContext context,int index){
         return _buildItem(context,index);
       },
    ));
  }
}
