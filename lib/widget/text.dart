import 'package:flutter/material.dart';
//行内多样是文本
class TextDemo extends StatelessWidget {

  final _textStyle=TextStyle(fontSize: 16.0,color: Colors.black38);
  final _title='将进酒';
  final _author='李白';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('行内多样式文本'),
      ),
      body:Container(
      child: Text('《$_title》是唐代大诗人$_author 沿用乐府古题创作的一首诗。 此诗为李白长安放还以后所作，思想内容非常深沉，艺术表现非常成熟，在同题作品中影响最大。 诗人豪饮高歌，借酒消愁，抒发了忧愤深广的人生感慨。',style: _textStyle,
       maxLines: 2,
       overflow: TextOverflow.ellipsis,
       textAlign: TextAlign.start,),
      )
    );
  }
}
