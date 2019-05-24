import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

//输入组件
class InputWidgetDemo extends StatefulWidget {
  // final Widget child;
  // DateTimeDemo({Key key, this.child}) : super(key: key);
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckBoxDemo'),
        ),
        body: Column(
          children: <Widget>[
            CheckBoxDemo(),
            RadioWidgetDemo(),
            DateTimeWidget(),
            SliderDemo(),
            SwitchDemo()
          ],
        ));
  }
}

class CheckBoxDemo extends StatefulWidget {
  // final Widget child;
  // CheckBoxDemo({Key key, this.child}) : super(key: key);
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkBoxItemA = true;
  @override
  Widget build(BuildContext context) {
    final Widget checkBoxDemo = Checkbox(
      onChanged: (value) {
        setState(() {
          _checkBoxItemA = value;
        });
      },
      value: _checkBoxItemA,
      activeColor: Colors.pink,
    );
    final Widget checkBoxListTitle = CheckboxListTile(
      value: _checkBoxItemA,
      title: Text('推送开关'),
      selected: _checkBoxItemA,
      subtitle: Text('是否接收推送'),
      secondary: Icon(Icons.send),
      onChanged: (value) {
        setState(() {
          _checkBoxItemA = value;
        });
      },
    );
    return Center(child: checkBoxListTitle);
  }
}

class RadioWidgetDemo extends StatefulWidget {
  // final Widget child;

  // RadioWidgetDemo({Key key, this.child}) : super(key: key);

  _RadioWidgetDemoState createState() => _RadioWidgetDemoState();
}

class _RadioWidgetDemoState extends State<RadioWidgetDemo> {
  int _radioGroupA = 0;
  @override
  Widget build(BuildContext context) {
    final Widget _radio = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('性别:'),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: <Widget>[
              Text('男:'),
              Radio(
                onChanged: (value) {
                  setState(() {
                    _radioGroupA = value;
                  });
                },
                groupValue: _radioGroupA,
                value: 0,
                activeColor: Colors.pink,
              ),
              Text('女:'),
              Radio(
                onChanged: (value) {
                  setState(() {
                    _radioGroupA = value;
                  });
                },
                groupValue: _radioGroupA,
                value: 1,
                activeColor: Colors.pink,
              )
            ],
          ),
        )
      ],
    );
    final Widget _radioListTitle = Column(
      children: <Widget>[
        Text('性别:$_radioGroupA'),
        RadioListTile(
          groupValue: _radioGroupA,
          onChanged: (value) {
            setState(() {
              _radioGroupA = value;
            });
          },
          value: 0,
          title: Text('男'),
          subtitle: Text('北京'),
          secondary: Icon(Icons.people),
          selected: _radioGroupA == 0,
        ),
        RadioListTile(
          groupValue: _radioGroupA,
          onChanged: (value) {
            setState(() {
              _radioGroupA = value;
            });
          },
          value: 1,
          title: Text('女'),
          subtitle: Text('天津'),
          secondary: Icon(Icons.featured_video),
          selected: _radioGroupA == 1,
        )
      ],
    );
    return Center(
      child: _radioListTitle,
    );
  }
}

class DateTimeWidget extends StatefulWidget {
  // final Widget child;

  // DateTimeWidget({Key key, this.child}) : super(key: key);

  _DateTimeWidgetState createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  _showDatePicker() async {
    final DateTime dateTme = await showDatePicker(
        initialDate: selectedDate,
        context: context,
        firstDate: DateTime(1990),
        lastDate: DateTime(2045));
    if (dateTme == null) return;
    setState(() {
      selectedDate = dateTme;
    });
  }

  _showTimePicker() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );
    if (selectedTime == null) return;

    setState(() {
      timeOfDay = selectedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            _showDatePicker();
          },
          child: Row(
            children: <Widget>[
              Text(DateFormat.yMMMMd().format(selectedDate)),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
        InkWell(
          onTap: () {
            _showTimePicker();
          },
          child: Row(
            children: <Widget>[
              Text(timeOfDay.format(context)),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ],
    ));
  }
}

class SliderDemo extends StatefulWidget {
  // final Widget child;

  // SliderDemo({Key key, this.child}) : super(key: key);

  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double sValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Slider(
          value: sValue,
          onChanged: (value) {
            setState(() {
              sValue = value;
            });
          },
          activeColor: Theme.of(context).accentColor,
          inactiveColor: Theme.of(context).accentColor.withOpacity(0.6),
          min: 0.0,
          max: 10.0,
          divisions: 10, //等分
          label: '${sValue.toInt()}',
        ),
        SizedBox(
          height: 20,
        ),
        Text('Slider value: $sValue')
      ],
    );
  }
}

class SwitchDemo extends StatefulWidget {
  // finchDemo({Key keal Widget child;

  // Swity, this.child}) : super(key: key);

  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchState = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _switchState ? '开启' : '关闭',
            ),
            Switch(
              onChanged: (value) {
                setState(() {
                  _switchState = value;
                });
              },
              value: _switchState,
            )
          ],
        ),
        SwitchListTile(
          onChanged: (value) {
            setState(() {
              _switchState = value;
            });
          },
          title: Text('是否开启推送'),
          subtitle: Text(_switchState?'开启':'关闭'),
          value: _switchState,
          secondary:
              Icon(_switchState ? Icons.visibility : Icons.visibility_off),
          selected: _switchState,
        )
      ],
    );
  }
}
