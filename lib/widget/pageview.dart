import 'package:flutter/material.dart';
import 'package:app/data/asset.dart';

class PageViewDemo extends StatelessWidget {
  Widget _buildPageIndex(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].url,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].address,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildPageIndex(context, index);
          },
          //滑动方向
          scrollDirection: Axis.horizontal,
          controller: PageController(
            //初始index
            initialPage: 1,
            keepPage: false,
          ),
          onPageChanged: (index) => debugPrint('debug+$index')),
           
    );
  }
}
