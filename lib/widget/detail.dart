import 'package:flutter/material.dart';
import 'package:app/data/asset.dart';

class PagerDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Picture post = posts[0];
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: Column(
        children: <Widget>[
          Image.network(
            post.url,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  post.address,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  post.detail,
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
