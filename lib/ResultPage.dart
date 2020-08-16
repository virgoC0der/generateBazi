import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ResultPage extends StatefulWidget{
  final data;
  const ResultPage(this.data);

  @override
  _ResultPageState createState() => new _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var data;
  var jsdata;
  final url = 'https://way.jd.com/jisuapi/baziPaipan';

  getResult(params) async {
    Dio dio = new Dio();
    Response response = await dio.get(url, queryParameters: params);
    try{
      print(response.data["result"]);
    } catch(exception) {
      print("fault");
    }

    return response.data;
  }

  getWidgetInfo(params) async {
    var rawjson = await getResult(params);
    setState(() {
      jsdata = rawjson["result"]["result"];

    });
  }

  @override
  void initState() {
    super.initState();
    getWidgetInfo(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Material(
          child: Text(jsdata.toString()),
        )
    );
  }

}



