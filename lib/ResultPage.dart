import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

const kQianzaoLength = 4;

class ResultPage extends StatefulWidget {
  final data;

  const ResultPage(this.data);

  @override
  _ResultPageState createState() => new _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var data;
  var jsdata;
  final url = 'https://way.jd.com/jisuapi/baziPaipan';
  var bazi;
  var birthday;
  var name;
  var time;
  var lunarBirthday;
  var gapTime;
  var qianzao;
  var nayin;
  var baziFirst;
  var baziSecond;

  getResult(params) async {
    Dio dio = new Dio();
    Response response = await dio.get(url, queryParameters: params);
    try {
      print(response.data["result"]);
    } catch (exception) {
      print("fault");
    }

    return response.data;
  }

  getWidgetInfo(params) async {
//    var rawjson = await getResult(params);
    var json =
        "{\n  \"code\": \"10000\",\n  \"charge\": false,\n  \"remain\": 0,\n  \"msg\": \"查询成功\",\n  \"result\": {\n    \"status\": 0,\n    \"msg\": \"ok\",\n    \"result\": {\n      \"year\": \"1717\",\n      \"month\": \"01\",\n      \"day\": \"01\",\n      \"hour\": \"01\",\n      \"minute\": \"01\",\n      \"name\": \"张三\",\n      \"city\": \"北京\",\n      \"sex\": 1,\n      \"istaiyang\": 0,\n      \"lunaryear\": 1717,\n      \"lunarmonth\": \"腊月\",\n      \"lunarday\": \"初四\",\n      \"lunarhour\": \"丑时\",\n      \"animal\": \"猴\",\n      \"yearganzhi\": \"丙申\",\n      \"jieqiprev\": {\n        \"jieqiname\": \"大雪\",\n        \"date\": \"1717-17-07 00:41:05\"\n      },\n      \"jieqinext\": {\n        \"jieqiname\": \"小寒\",\n        \"date\": \"1717-01-05 11:55:42\"\n      },\n      \"bazi\": [\n        \"丙申\",\n        \"庚子\",\n        \"戊子\",\n        \"癸丑\"\n      ],\n      \"taiyuan\": \"辛卯\",\n      \"minggong\": \"甲辰\",\n      \"xunkong\": [\n        \"辰巳\",\n        \"辰巳\",\n        \"午未\",\n        \"寅卯\"\n      ],\n      \"qiyun\": {\n        \"year\": 1,\n        \"month\": 5,\n        \"day\": 24,\n        \"hour\": 17\n      },\n      \"jiaoyun\": {\n        \"year\": \"1718\",\n        \"month\": \"6\",\n        \"day\": \"25\",\n        \"hour\": \"13\"\n      },\n      \"qiankunzao\": [\n        [\n          \"偏印\",\n          \"食神\",\n          \"日元\",\n          \"正财\"\n        ],\n        [\n          \"丙申\",\n          \"庚子\",\n          \"戊子\",\n          \"癸丑\",\n          \"(午未空)\"\n        ],\n        [\n          [\n            \"戊比肩\",\n            \"癸正财\",\n            \"癸正财\",\n            \"癸正财\"\n          ],\n          [\n            \"庚食神\",\n            \"\",\n            \"\",\n            \"辛伤官\"\n          ],\n          [\n            \"壬偏财\",\n            \"\",\n            \"\",\n            \"己劫财\"\n          ]\n        ]\n      ],\n      \"nayin\": [\n        \"山下火\",\n        \"壁上土\",\n        \"霹雳火\",\n        \"桑柘木\"\n      ],\n      \"shensha\": [\n        [\n          \"文昌贵人\",\n          \"文昌贵人\",\n          \"十恶大败\"\n        ],\n        [\n          \"将星\",\n          \"将星\"\n        ],\n        [\n          \"将星\",\n          \"将星\"\n        ],\n        [\n          \"国印贵人\",\n          \"天喜\",\n          \"﻿天乙贵人\",\n          \"太极贵人\",\n          \"国印贵人\"\n        ]\n      ],\n      \"dayun\": {\n        \"nayin\": [\n          \"壁上土\",\n          \"壁上土\",\n          \"金箔金\",\n          \"金箔金\",\n          \"覆灯火\",\n          \"覆灯火\",\n          \"天河水\",\n          \"天河水\",\n          \"大驿土\",\n          \"大驿土\"\n        ],\n        \"shishen\": [\n          \"食神\",\n          \"伤官\",\n          \"偏财\",\n          \"正财\",\n          \"七杀\",\n          \"正官\",\n          \"偏印\",\n          \"正印\",\n          \"比肩\",\n          \"劫财\"\n        ],\n        \"ganzhi\": [\n          \"庚子\",\n          \"辛丑\",\n          \"壬寅\",\n          \"癸卯\",\n          \"甲辰\",\n          \"乙巳\",\n          \"丙午\",\n          \"丁未\",\n          \"戊申\",\n          \"己酉\"\n        ],\n        \"sui\": [\n          \"1-0岁\",\n          \"1岁\",\n          \"11岁\",\n          \"21岁\",\n          \"31岁\",\n          \"41岁\",\n          \"51岁\",\n          \"61岁\",\n          \"71岁\",\n          \"81岁\"\n        ],\n        \"year\": [\n          \"1717\",\n          1718,\n          1728,\n          1738,\n          1748,\n          1758,\n          1768,\n          1778,\n          1788,\n          1798\n        ]\n      },\n      \"liunian\": [\n        [\n          \"丙申\",\n          \"戊戌\",\n          \"戊申\",\n          \"戊午\",\n          \"戊辰\",\n          \"戊寅\",\n          \"戊子\",\n          \"戊戌\",\n          \"戊申\",\n          \"戊午\",\n          \"戊辰\",\n          \"戊寅\"\n        ],\n        [\n          \" \",\n          \"己亥\",\n          \"己酉\",\n          \"己未\",\n          \"己巳\",\n          \"己卯\",\n          \"己丑\",\n          \"己亥\",\n          \"己酉\",\n          \"己未\",\n          \"己巳\",\n          \"己卯\"\n        ],\n        [\n          \" \",\n          \"庚子\",\n          \"庚戌\",\n          \"庚申\",\n          \"庚午\",\n          \"庚辰\",\n          \"庚寅\",\n          \"庚子\",\n          \"庚戌\",\n          \"庚申\",\n          \"庚午\",\n          \"庚辰\"\n        ],\n        [\n          \" \",\n          \"辛丑\",\n          \"辛亥\",\n          \"辛酉\",\n          \"辛未\",\n          \"辛巳\",\n          \"辛卯\",\n          \"辛丑\",\n          \"辛亥\",\n          \"辛酉\",\n          \"辛未\",\n          \"辛巳\"\n        ],\n        [\n          \" \",\n          \"壬寅\",\n          \"壬子\",\n          \"壬戌\",\n          \"壬申\",\n          \"壬午\",\n          \"壬辰\",\n          \"壬寅\",\n          \"壬子\",\n          \"壬戌\",\n          \"壬申\",\n          \"壬午\"\n        ],\n        [\n          \" \",\n          \"癸卯\",\n          \"癸丑\",\n          \"癸亥\",\n          \"癸酉\",\n          \"癸未\",\n          \"癸巳\",\n          \"癸卯\",\n          \"癸丑\",\n          \"癸亥\",\n          \"癸酉\",\n          \"癸未\"\n        ],\n        [\n          \" \",\n          \"甲辰\",\n          \"甲寅\",\n          \"甲子\",\n          \"甲戌\",\n          \"甲申\",\n          \"甲午\",\n          \"甲辰\",\n          \"甲寅\",\n          \"甲子\",\n          \"甲戌\",\n          \"甲申\"\n        ],\n        [\n          \" \",\n          \"乙巳\",\n          \"乙卯\",\n          \"乙丑\",\n          \"乙亥\",\n          \"乙酉\",\n          \"乙未\",\n          \"乙巳\",\n          \"乙卯\",\n          \"乙丑\",\n          \"乙亥\",\n          \"乙酉\"\n        ],\n        [\n          \" \",\n          \"丙午\",\n          \"丙辰\",\n          \"丙寅\",\n          \"丙子\",\n          \"丙戌\",\n          \"丙申\",\n          \"丙午\",\n          \"丙辰\",\n          \"丙寅\",\n          \"丙子\",\n          \"丙戌\"\n        ],\n        [\n          \" \",\n          \"丁未\",\n          \"丁巳\",\n          \"丁卯\",\n          \"丁丑\",\n          \"丁亥\",\n          \"丁酉\",\n          \"丁未\",\n          \"丁巳\",\n          \"丁卯\",\n          \"丁丑\",\n          \"丁亥\"\n        ]\n      ]\n    }\n  }\n}";
    var rawjson = jsonDecode(json);
    print(rawjson);
    setState(() {
      jsdata = rawjson["result"]["result"];
      birthday =
          jsdata["year"] + "年" + jsdata["month"] + "月" + jsdata["day"] + "日";
      time = jsdata["hour"] + "时" + jsdata["minute"] + "分";
      bazi = jsdata["bazi"][0];
      name = jsdata["name"];
      lunarBirthday = jsdata["lunaryear"].toString() +
          "年" +
          jsdata["lunarmonth"] +
          "月" +
          jsdata["lunarday"] +
          "，" +
          jsdata["lunarhour"];

      var jieqiDate = DateTime.parse(jsdata["jieqiprev"]["date"]);
      var birthDate = DateTime(int.parse(jsdata["year"]),
          int.parse(jsdata["month"]), int.parse(jsdata["day"]));
      gapTime = birthDate.difference(jieqiDate).inDays.toString();
    });
  }

  String makeQianzao() {
    var result = "";
    for (int i = 0; i < kQianzaoLength; i++) {
      result += jsdata["qiankunzao"][0][i] + "       ";
    }

    return result;
  }

  String makeNayin() {
    var result = "";
    for (int i = 0; i < kQianzaoLength; i++) {
      result += jsdata["nayin"][i] + "    ";
    }

    return result;
  }

  String makeBaziFirst() {
    var result = "";
    var item = "";
    for (int i = 0; i < kQianzaoLength; i++) {
      item = jsdata["qiankunzao"][1][i][0];
      result += item.padRight(8);
    }

    return result;
  }

  String makeBaziSecond() {
    var result = "";
    var item = "";
    for (int i = 0; i < kQianzaoLength; i++) {
      item = jsdata["qiankunzao"][1][i][1];
      result += item.padRight(8);
    }

    return result;
  }

  @override
  void initState() {
    super.initState();
    getWidgetInfo(widget.data);
    qianzao = makeQianzao();
    nayin = makeNayin();
    baziFirst = makeBaziFirst();
    baziSecond = makeBaziSecond();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("结果"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Text("姓名：" + name, style: TextStyle(fontSize: 17)),
            height: 45,
          ),
          Container(
            child:
                Text("出生时间：" + birthday + time, style: TextStyle(fontSize: 17)),
            height: 45,
          ),
          Container(
            child:
                Text("农历时间：农历" + lunarBirthday, style: TextStyle(fontSize: 17)),
            height: 45,
          ),
          Container(
            child: Text(
                "出生于" + jsdata["jieqiprev"]["jieqiname"] + "后" + gapTime + "天",
                style: TextStyle(fontSize: 17)),
            height: 45,
          ),
          Container(
            child: Text("乾造：" + nayin + "\n" + "".padRight(10) + qianzao,
                style: TextStyle(fontSize: 17)),
            height: 50,
          ),
          Container(
            child: Text(
              "".padRight(10) + baziFirst + "\n" + "".padRight(10) + baziSecond,
              style: TextStyle(fontSize: 23, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
