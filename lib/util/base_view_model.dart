import 'package:flutter/foundation.dart';
import 'package:flutter_module/util/http/http_state.dart';

class BaseViewModel extends ChangeNotifier{
  late ValueNotifier<HttpState> httpState;
  late String httpErrorMsg;
  BaseViewModel(){
    httpState = ValueNotifier(HttpState.init);
    httpErrorMsg= "";
  }
}