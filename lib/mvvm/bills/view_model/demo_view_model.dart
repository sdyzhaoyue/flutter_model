import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:matcher/matcher.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import '../../../util/data/login_data.dart';
import '../model/demo_model.dart';

class DemoViewModel extends ChangeNotifier {
  String resul = "";
  DemoModel _demoModel = DemoModel();

  void get(String id) async {
    //网络请求
    var result = await _demoModel.get(id);
    try{
      //数据解析
      Map<String, dynamic> date = convert.jsonDecode(result.toString());
      var _loginData = LogintData.fromJson(date); //
      print(_loginData.code);
      if (_loginData.code == 200) {
      } else {

      }
    }catch(e){

    }


    print(result.toString());
    notifyListeners();
    //Navigator.pop(context)
  }
}
