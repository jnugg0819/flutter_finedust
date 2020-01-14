

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app_finedust/model/air_result.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_test_app_finedust/main.dart';
import 'dart:convert';


void main() {
  test('http 통신 테스트',() async{
    var response= await http.get('https://api.airvisual.com/v2/nearest_city?key=a0fc6f36-cb3b-4075-be69-54cf0aecb6d2');

    expect(response.statusCode,200);

    AirResult result= AirResult.fromJson(json.decode(response.body));
    expect(result.status, 'success');

  });
}
