import 'package:flutter/material.dart';

class ExpansionPanelBean {
  String headerText;
  Widget body;
  bool isOpen;
  ExpansionPanelBean({this.headerText, this.body, this.isOpen});
}

class ExpansionPanelListWidget extends StatefulWidget {
  // final Widget child;

  // ExpansionPanelListWidget({Key key, this.child}) : super(key: key);

  _ExpansionPanelListWidgetState createState() =>
      _ExpansionPanelListWidgetState();
}

class _ExpansionPanelListWidgetState extends State<ExpansionPanelListWidget> {
  List<ExpansionPanelBean> widgets;
  @override
  void initState() {
    super.initState();
    widgets = [
      ExpansionPanelBean(
          headerText: '电影',
          body: ListTile(
            title: Text('电影'),
            leading: Icon(Icons.indeterminate_check_box),
          ),
          isOpen: false),
      ExpansionPanelBean(
          headerText: '音乐',
          body: ListTile(
            title: Text('音乐'),
            leading: Icon(Icons.music_note),
          ),
          isOpen: false),
      ExpansionPanelBean(
          headerText: '读书',
          body: ListTile(
            title: Text('读书'),
            leading: Icon(Icons.bookmark),
          ),
          isOpen: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelListDemo'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
            expansionCallback: (index, isOpen) {
              setState(() {
                widgets[index].isOpen = !isOpen;
              });
            },
            children: widgets.map((item) {
              return ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return item.body;
                  },
                  body: item.body,
                  isExpanded: item.isOpen);
            }).toList()),
      ),
    );
  }
}
