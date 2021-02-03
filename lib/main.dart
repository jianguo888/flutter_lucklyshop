import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';

import 'routers/router.dart';

// 引入provider
import 'package:provider/provider.dart';
import 'provider/Cart.dart';

import 'provider/CheckOut.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          /*
         provider3.x的配置方法
            ChangeNotifierProvider(builder: (_) => Cart()),
            ChangeNotifierProvider(builder: (_) => CheckOut())   
        */

          //provider4.x的配置方法
          ChangeNotifierProvider(create: (_) => Cart()),
          ChangeNotifierProvider(create: (_) => CheckOut())
        ],
        child: ScreenUtilInit(
          designSize: Size(750, 1334),
          allowFontScaling: false,
          child: MaterialApp(
            // home: Tabs(),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: onGenerateRoute,
            theme: ThemeData(
                // primaryColor: Colors.yellow
                primaryColor: Colors.white),
          ),
        ));
  }
}
