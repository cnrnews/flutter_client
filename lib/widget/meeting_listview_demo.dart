import 'package:flutter/material.dart';
import 'package:app/data/asset.dart';
import 'package:app/pages/meeting_detail.dart';
import 'package:app/utils/utils.dart';

class MeetingListViewWidget extends StatefulWidget {
  _MeetingListViewWidgetState createState() => _MeetingListViewWidgetState();
}

class _MeetingListViewWidgetState extends State<MeetingListViewWidget> {
  var titleStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
  var subStyle = TextStyle(color: Colors.grey.shade600, fontSize: 12);
  _buildTag(List<String> tags) {
    return Row(
      children: <Widget>[
        Card(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(tags[0]),
          ),
          elevation: 0.5,
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(tags[1]),
          ),
          elevation: 0.5,
        )
      ],
    );
  }

  _buildContainer(int index) {
    // print(posts[index].);
    return GestureDetector(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              posts[index].url,
              width: MediaQuery.of(context).size.width,
              height: 160.0,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 8),
              child: Text(
                posts[index].title,
                style: titleStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, top: 5, bottom: 5, right: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.local_airport,
                              color: Colors.orangeAccent,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child:
                                  Text(posts[index].address, style: subStyle),
                            ),
                          ],
                        ),
                      ),
                      Text('17km', style: subStyle)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(children: <Widget>[
                          Icon(Icons.timelapse, color: Colors.orangeAccent),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(posts[index].date, style: subStyle),
                          ),
                        ]),
                      ),
                      Text('免费', style: subStyle)
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            _buildTag(posts[index].tag),
            Container(
              height: 12,
            )
          ],
        ),
      ),
      onTap: () {
        new Utils().pushOtherPage(context, MeetingDetail(meetingId:'423'));
      },
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Container(child: _buildContainer(index)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会议列表'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: _buildListItem,
      ),
    );
  }
}
