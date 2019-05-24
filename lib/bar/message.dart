import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/data/asset.dart';
import 'package:app/pages/my_push_message.dart';
import 'package:app/utils/utils.dart';
import 'package:app/pages/my_announcement.dart';

//正常文字
var commonStyle = TextStyle(color: Colors.black, fontSize: 18);
//灰色较小文字
var infoStyle = TextStyle(color: Color(0xff999999), fontSize: 13);

//消息
class Home extends StatelessWidget {
  _buildListViewItem(BuildContext context) {
    var msgInfo = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '李海欣',
          style: commonStyle,
        ),
        Text(
          '[文本]',
          style: infoStyle,
        )
      ],
    );
    var listBody = ListTile(
      title: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(1),
            child: Image.asset(
              'images/rc_discussion.png',
              scale: 2.4,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: msgInfo,
            ),
          ),
          Text('2月18日')
        ],
      ),
      onTap: () {},
    );
    return listBody;
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('幸会'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: SearchWidget());
          },
        ),
        IconButton(
          icon: Icon(Icons.announcement),
          onPressed: () {
           new Utils().pushOtherPage(context, MyAnnouncement());
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.grey.shade200,
              child: ListTile(
                title: Text(
                  '重要消息提醒',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.voice_chat),
                onTap: (){
new Utils().pushOtherPage(context, MyPushMessage());
                },
              ),
            ),
            _buildListViewItem(context),
            Divider(),
            _buildListViewItem(context),
          ],
        ));
  }
}

class SearchWidget extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.amberAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionLists = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionLists.length,
      itemBuilder: (context, index) => ListTile(
            title: RichText(
              text: TextSpan(
                  text: suggestionLists[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: suggestionLists[index].substring(query.length),
                      style: TextStyle(color: Colors.grey),
                    )
                  ]),
            ),
          ),
    );
  }
}
