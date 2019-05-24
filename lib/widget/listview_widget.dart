import 'package:flutter/material.dart';
import 'package:app/data/asset.dart';

class ListViewWidget extends StatefulWidget {
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  _buildContainer(int index) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Image.network(posts[index].url),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.local_see),
                  Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Text(posts[index].click,style: TextStyle(color: Colors.white),),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Padding(
        padding: EdgeInsets.all(12),
        child: Container(child: _buildContainer(index)

            // Column(
            //   children: <Widget>[
            //     Image.network(posts[index].url),
            //     Center(
            //       child: Column(
            //         children: <Widget>[
            //           Text(
            //             posts[index].title,
            //             style: TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //           // Text(posts[index].click),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView widget'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: _buildListItem,
      ),
    );
  }
}
