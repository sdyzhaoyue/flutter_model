import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/mvvm/login/model/login_model.dart';
import 'package:flutter_module/mvvm/login/view_model/login_view_model.dart';
import 'package:flutter_module/util/http/http_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../util/LoadingPage.dart';
import '../../bills/view_model/demo_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _email, _password;
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;
  late LoadingPage loadingPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingPage = LoadingPage(context);
    ///监听登陆状态展示loading路由
    context.read<LoginViewModel>().httpState.addListener(() async {
      ///登陆中展示loading
      if (context.read<LoginViewModel>().httpState.value == HttpState.ing) {
        loadingPage.show();
      } else {
        loadingPage.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334),
        splitScreenMode: false,
        minTextAdapt: false);
    return Scaffold(
      body: Form(
          // 设置globalKey，用于后面获取FormStat
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
                buildTitle(), // Login
                const SizedBox(height: 50),
                buildPhoneTextField(context), // 输入手机号
                const SizedBox(height: 30),
                buildPasswordTextField(context),
                buildForgetPasswordText(context), // 忘记密码
                const SizedBox(height: 60),
                buildLoginButton(context), // 登录按钮
              ])),
    );
  }

  // 设置电池栏颜色-透明
  static appUIStyle() {
    SystemChrome.setSystemUIOverlayStyle(uiStyle);
  }

  // 设置电池栏颜色-透明
  static SystemUiOverlayStyle uiStyle = const SystemUiOverlayStyle(
    systemNavigationBarColor: const Color(0x00000000),
    systemNavigationBarDividerColor: null,
    statusBarColor: const Color(0x00000000),
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  );

  //登录
  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          '登录',
          style: TextStyle(fontSize: 42),
        ));
  }

  //登录下边的线
  Widget buildTitleLine() {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 4.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.black,
            width: 40,
            height: 2,
          ),
        ));
  }

  // 输入手机号
  Widget buildPhoneTextField(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: '手机号'),
      validator: (v) {
        if (v != null && v.length != null && v.length > 11) {
          return '请输入正确手机号';
        }
      },
      onSaved: (v) => _email = v!,
    );
  }

// 输入密码
  Widget buildPasswordTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure, // 是否显示文字
        onSaved: (v) => _password = v!,
        validator: (v) {
          if (v!.isEmpty) {
            return '请输入正确密码';
          }
        },
        decoration: InputDecoration(
            labelText: "密码",
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

  // 忘记密码
  Widget buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            // Navigator.pop(context);
            print("忘记密码");
          },
          child: const Text("忘记密码？",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child:
              Text('登录', style: Theme.of(context).primaryTextTheme.headline5),
          onPressed: () {
            // 表单校验通过才会继续执行
            if ((_formKey.currentState as FormState).validate()) {
              (_formKey.currentState as FormState).save();
              //TODO 执行登录方法
              print('email: $_email, password: $_password');

              context.read<LoginViewModel>().get("ID");
            }
          },
        ),
      ),
    );
  }
}
