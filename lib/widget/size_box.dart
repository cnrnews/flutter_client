import 'package:flutter/material.dart';
//固定尺寸
class SizeBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('行内多样式文本'),
      ),
      body:Column(
      children: <Widget>[
        SizedBox(
           width: 50.0,
           height: 80.0,
           child: Container(
             decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(5.0))
             ),
             child: Icon(Icons.ac_unit,size: 32,color: Colors.pink,),
           ),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          width: 30,
          height: 20,
           child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(7.0))
             ),
             child: Icon(Icons.access_alarms,size: 12,color: Colors.blue,),
           ),
        ),
        
      ],
      )
    );
  }
}
