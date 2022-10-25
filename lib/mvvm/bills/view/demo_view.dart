import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/mvvm/bills/model/demo_model.dart';
import 'package:flutter_module/mvvm/login/view_model/login_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../view_model/demo_view_model.dart';

class DemoView extends StatefulWidget {
  @override
  _DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334),
        splitScreenMode: false,
        minTextAdapt: false);

    return Scaffold(
        appBar: AppBar(
          title: Text("MVVM"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            BackButton(
              onPressed: () async {
                context.read<LoginViewModel>().get("ID");
              },
            ),
            Consumer<DemoViewModel>(
              builder: (context, counter, child) => Text(
                '登录数据返回信息:${counter.resul}',
              ),
            ),
          ],
        ));
  }
}
