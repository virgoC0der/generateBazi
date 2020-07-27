import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ResultPage.dart';

class InputInfoPage extends StatefulWidget {
  @override
  _inputInfoPageState createState() => _inputInfoPageState();
}

class _inputInfoPageState extends State<InputInfoPage> {
  FocusNode _focusNodeName = new FocusNode();
  FocusNode _focusNodeBirthday = new FocusNode();

  TextEditingController _nameController = new TextEditingController();

  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  String _name;
  String _gender;
  int _isLunar;
  var _nameColor;

  @override
  void initState() {
    // TODO: implement initState
    _nameColor = Colors.grey;
    _name = '';
    _gender = 'male';
    _isLunar = 1;
    super.initState();
  }

  _pickDate() {
    DatePicker.showDatePicker(context,
        pickerTheme: DateTimePickerTheme(
            confirm: Text(
              '确定',
              style: TextStyle(color: Colors.blue),
            ),
            cancel: Text(
              '取消',
              style: TextStyle(color: Colors.grey),
            )),
        initialDateTime: _date,
        dateFormat: 'yyyy-MM-dd',
        pickerMode: DateTimePickerMode.date,
        locale: DateTimePickerLocale.zh_cn, onConfirm: (date, List<int> list) {
      setState(() {
        _date = date;
        print(_date);
      });
    }, onCancel: () {
      print('date cancel');
    });
  }

  _pickTime() {
    DatePicker.showDatePicker(context,
        pickerTheme: DateTimePickerTheme(
            confirm: Text(
              '确定',
              style: TextStyle(color: Colors.blue),
            ),
            cancel: Text(
              '取消',
              style: TextStyle(color: Colors.grey),
            )),
        pickerMode: DateTimePickerMode.time,
        initialDateTime: _time,
        locale: DateTimePickerLocale.zh_cn,
        dateFormat: 'HH:mm分', onCancel: () {
      print('time cancel');
    }, onConfirm: (time, List<int> list) {
      setState(() {
        _time = time;
        print(_time);
      });
    });
  }

  getResult() {
    //TODO: Update info and return result.
  }

  @override
  Widget build(BuildContext Context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  onTap: () {
                    setState(() {
                      _nameColor = Colors.blue;
                    });
                  },
                  controller: _nameController,
                  focusNode: _focusNodeName,
                  decoration: InputDecoration(
                    labelText: '姓名',
                    hintText: '请输入姓名',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _nameColor,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  onChanged: (String value) {
                    _name = value;
                    print(_name);
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "性别",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    new Center(
                      child: new DropdownButton(
                          onTap: () {
                            _focusNodeName.unfocus();
                            setState(() {
                              _nameColor = Colors.grey;
                            });
                          },
                          value: _gender,
                          hint: Text('请选择'),
                          items: [
                            DropdownMenuItem(
                              child: Text('男'),
                              value: 'male',
                            ),
                            DropdownMenuItem(
                              child: Text('女'),
                              value: 'female',
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                              print(_gender);
                            });
                          }),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CupertinoSegmentedControl(
//                        padding: EdgeInsets.all(20),
                        groupValue: _isLunar,
                        children: {
                          1: Padding(
                            padding: EdgeInsets.only(left: 60.0, right: 60.0),
                            child: Text('阳历'),
                          ),
                          2: Text('阴历')
                        },
                        onValueChanged: (value) {
                          _focusNodeName.unfocus();
                          setState(() {
                            _nameColor = Colors.grey;
                            _isLunar = value;
                            print(_isLunar);
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '请选择日期',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      onTap: _pickDate,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "${_date.year}-${_date.month}-${_date.day}",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '请选择时间',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      onTap: _pickTime,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "${_time.hour}:${_time.minute}",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
//                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 40,
                  child: new Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.blueAccent,
                      color: Colors.blue,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          _focusNodeName.unfocus();

                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => ResultPage()));
                        },
                        child: Center(
                          child: Text(
                            '八字排盘',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
