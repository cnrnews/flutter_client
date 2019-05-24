import 'package:flutter/material.dart';
import 'package:app/data/asset.dart';
import 'package:app/utils/utils.dart';
import 'detail.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        //floating: false,
        pinned: true,
        expandedHeight: 178.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            'beautiful'.toUpperCase(),
            style: TextStyle(letterSpacing: 6, fontWeight: FontWeight.w500),
          ),
          background: Image.network(
            'https://goss.veer.com/creative/vcg/veer/800water/veer-313612836.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverSafeArea(
          sliver: SliverPadding(
        padding: EdgeInsets.all(12.0),
        sliver: SliverListDemo(),
      ))
    ]));
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].url,
              fit: BoxFit.cover,
            ),
          );
        }, childCount: posts.length));
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return GestureDetector(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32.0),
                child: Material(
                  borderRadius: BorderRadius.circular(22.0),
                  elevation: 18.0,
                  shadowColor: Colors.grey.withOpacity(0.6),
                  child: Stack(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          posts[index].url,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 32.0,
                        left: 32.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              posts[index].title,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            Text(
                              posts[index].address,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                  child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.white.withOpacity(0.1),
                ),
              ))
            ],
          ),
          onTap: () {
            new Utils().pushOtherPage(context, new PagerDetail());
          },
        );
      }, childCount: posts.length),
    );
  }
}
