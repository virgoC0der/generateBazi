import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ResultPage extends StatelessWidget{
  final json;
  var data;
  var response;
  final url = 'https://way.jd.com/jisuapi/baziPaipan';

  Future<Response> getResult(params) async {
    Dio dio = new Dio();
    response = await dio.get(url, queryParameters: params);
    print(response);
    return response;
  }

  ResultPage(this.json) {
    data = json;
    final res = getResult(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Material(

        child: Text(response),
      )
    );
  }
}

