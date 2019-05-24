import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  // final Widget child;
  // WidgetButton({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('widget button')),
      floatingActionButton: FloatingActionButtonDemo(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: Theme.of(context).accentColor,
        ),
        shape: CircularNotchedRectangle(),
      ),
      body: ButtonDemo(),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget FlatButtonDemo = Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          color: Theme.of(context).accentColor,
          child: Text(
            'Flatbutton',
            style: TextStyle(color: Colors.white),
          ),
          splashColor: Colors.white24,
          onPressed: () {},
        ),
        SizedBox(
          width: 30,
        ),
        FlatButton.icon(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: Text('Flatbutton Icon', style: TextStyle(color: Colors.white)),
          color: Theme.of(context).backgroundColor,
          splashColor: Colors.lightBlueAccent.withOpacity(0.7),
          onPressed: () {},
        ),
      ],
    ));
    final Widget OuterlineButonDemo = Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          child: Text(
            'Flatbutton',
            style: TextStyle(color: Colors.black),
          ),
          borderSide: BorderSide(color: Colors.grey[400]),
          splashColor: Colors.grey,
          onPressed: () {},
        ),
        SizedBox(
          width: 30,
        ),
        OutlineButton.icon(
          icon: Icon(
            Icons.add,
            color: Colors.grey,
          ),
          borderSide: BorderSide(
              color: Colors.pink.withOpacity(0.4), style: BorderStyle.solid),
          label: Text('Flatbutton Icon', style: TextStyle(color: Colors.black)),
          splashColor: Colors.grey,
          onPressed: () {},
        ),
      ],
    ));
    final Widget RaisedButtonDemo = Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('Flatbutton'),
          splashColor: Colors.grey,
          elevation: 0.0,
          onPressed: () {},
        ),
        SizedBox(
          width: 30,
        ),
        RaisedButton.icon(
          color: Colors.grey.withOpacity(0.3),
          icon: Icon(
            Icons.add,
          ),
          label: Text('Flatbutton Icon'),
          splashColor: Colors.grey,
          onPressed: () {},
          elevation: 3.0,
        ),
      ],
    ));
    final Widget FixedButtonDemo = Center(
      child: Container(
        width: 100.0,
        child: OutlineButton(
          onPressed: () {},
          child: Text(
            'click'.toUpperCase(),
            style: TextStyle(color: Colors.pink),
          ),
          borderSide: BorderSide(
            color: Colors.lightBlue.shade300,
          ),
        ),
      ),
    );
    final Widget ExpandedButtonDemo = Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              onPressed: () {},
              borderSide: BorderSide(color: Colors.grey),
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          SizedBox(
            width: 13,
          ),
          Expanded(
            child: OutlineButton(
              onPressed: () {},
              borderSide: BorderSide(color: Colors.grey),
              child: Text(
                'Reset',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          )
        ],
      ),
    );

    return ExpandedButtonDemo;
  }
}

class PopUpMenuDemo extends StatefulWidget {
  // final Widget child;
  // PopUpMenuDemo({Key key, this.child}) : super(key: key);
  _PopUpMenuDemoState createState() => _PopUpMenuDemoState();
}

class _PopUpMenuDemoState extends State<PopUpMenuDemo> {
  String _curValue = '电影';
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_curValue),
        PopupMenuButton(
            onSelected: (value) {
              print(value);
              setState(() {
                _curValue = value;
              });
            },
            itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Text('电影'),
                    value: '电影',
                  ),
                  PopupMenuItem(
                    child: Text('音乐'),
                    value: '音乐',
                  )
                ])
      ],
    ));
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      backgroundColor: Colors.blueGrey,
      elevation: 0.0,
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );
    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('Add'),
      backgroundColor: Theme.of(context).buttonColor,
    );
    return _floatingActionButton;
  }
}

class ButtonBarDemo extends StatelessWidget {
  // final Widget child;
  // ButtonBarDemo({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Theme(
      data: Theme.of(context).copyWith(
          buttonTheme:
              ButtonThemeData(padding: EdgeInsets.symmetric(horizontal: 32))),
      child: ButtonBar(
        children: <Widget>[ButtonDemo()],
      ),
    ));
  }
}
