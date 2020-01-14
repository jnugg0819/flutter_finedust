import 'package:flutter_test_app_finedust/model/air_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

class AirBloc{

  final _airSubject=BehaviorSubject<AirResult>();

  AirBloc(){
    fetch();
  }

  Future<AirResult> fetechData() async{
    var response= await http.get('https://api.airvisual.com/v2/nearest_city?key=a0fc6f36-cb3b-4075-be69-54cf0aecb6d2');

    AirResult result= AirResult.fromJson(json.decode(response.body));
    return result;
  }

  void fetch() async{
    print('fetch');
    var airResult= await fetechData();
    _airSubject.add(airResult);
  }

  Stream<AirResult> get airResult=> _airSubject.stream;

}