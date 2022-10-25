import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/mvvm/bills/view/demo_view.dart';
import 'package:flutter_module/mvvm/login/view/login_view.dart';
import 'package:flutter_module/mvvm/login/view_model/login_view_model.dart';
import 'package:flutter_module/splash_page.dart';
import 'package:flutter_module/simple_page_widgets.dart';
import 'package:flutter_module/util/ColorsUtil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'mvvm/bills/view_model/demo_view_model.dart';


void main() {
  PageVisibilityBinding.instance
      .addGlobalObserver(AppGlobalPageVisibilityObserver());
  CustomFlutterBinding();
  //runApp(MyApp());

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DemoViewModel()),
      ChangeNotifierProvider(create: (context) => LoginViewModel()),
      //多个界面请在下方添加多个viewmodel
    ],
    child: MyApp(),
  ));

}

class AppGlobalPageVisibilityObserver extends GlobalPageVisibilityObserver {
  @override
  void onPagePush(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageCreate route:${route.settings.name}');
  }

  @override
  void onPageShow(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageShow route:${route.settings.name}');
  }

  @override
  void onPageHide(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageHide route:${route.settings.name}');
  }

  @override
  void onPagePop(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageDestroy route:${route.settings.name}');
  }

  @override
  void onForeground(Route route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onForeground route:${route.settings.name}');
  }

  @override
  void onBackground(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onBackground route:${route.settings.name}');
  }
}

class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    'splash': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => LoginView());
    },
    'flutterPage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => LoginView());
    },
  };


  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? func = routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }
  @override
  void initState() {
    super.initState();
  }

  Widget appBuilder(Widget home) {


    return MaterialApp(
      home: home,
      // 不显示右上角的 debug
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.amber),
      ///必须加上builder参数，否则showDialog等会出问题
      builder: (_, __) {
        return home;
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
      initialRoute: "splash",
    );
  }
}

