import '../../../util/http/Global.dart';
class LoginModel{
  dynamic get(String id)async{
    return  await  Global.getInstance()?.dio.post(
        'user/login',
        data: {
          'username':'18640141839',
          'code':'1',
          'group':'android',
          'parent_invite_code':'',
        }
    );
  }
}