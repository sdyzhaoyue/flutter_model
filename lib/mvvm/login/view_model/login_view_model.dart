import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/util/http/http_state.dart';
import 'package:matcher/matcher.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import '../../../util/LoadingPage.dart';
import '../../../util/base_view_model.dart';
import '../../../util/data/login_data.dart';
import '../model/login_model.dart';

class LoginViewModel extends BaseViewModel {
  late BuildContext _context;

  String resul = "";
  LoginModel _demoModel = LoginModel();

  void get(String id) async {
    httpState.value = HttpState.ing;
    var result = await _demoModel.get(id);
    this.resul = result.toString();
    print(result.toString());
    try {
      //数据解析
      Map<String, dynamic> date = convert.jsonDecode(result.toString());
      var _loginData = LogintData.fromJson(date); //
      print(_loginData.code);
      if (_loginData.code == 200) {
        httpState.value = HttpState.success;
      } else {
     //   httpState.value = HttpState.fail;
        httpErrorMsg = _loginData.message;
      }
    } catch (e) {
    } finally {
   //   httpState.value = HttpState.fail;
      notifyListeners();
    }

    //Navigator.pop(context)
  }
}
