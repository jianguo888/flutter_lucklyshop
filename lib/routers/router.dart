import 'package:flutter/material.dart';
import 'package:flutter_jdshop/pages/test/common_widgetpage.dart';
import 'package:flutter_jdshop/pages/test/drag.dart';
import 'package:flutter_jdshop/pages/test/listview_test.dart';
import 'package:flutter_jdshop/pages/test/scrollerpage.dart';

import '../pages/Address/AddressAdd.dart';
import '../pages/Address/AddressEdit.dart';
import '../pages/Address/AddressList.dart';
import '../pages/CheckOut.dart';
import '../pages/Login.dart';
import '../pages/Order.dart';
import '../pages/OrderInfo.dart';
import '../pages/Pay.dart';
import '../pages/ProductContent.dart';
import '../pages/ProductList.dart';
import '../pages/RegisterFirst.dart';
import '../pages/RegisterSecond.dart';
import '../pages/RegisterThird.dart';
import '../pages/Search.dart';
import '../pages/tabs/Cart.dart';
import '../pages/tabs/Tabs.dart';

//配置路由
final routes = {
  '/': (context) => Tabs(),
  '/search': (context) => SearchPage(),
  '/cart': (context) => CartPage(),
  '/login': (context) => LoginPage(),
  '/registerFirst': (context) => RegisterFirstPage(),
  '/registerSecond': (context, {arguments}) =>
      RegisterSecondPage(arguments: arguments),
  '/registerThird': (context, {arguments}) =>
      RegisterThirdPage(arguments: arguments),
  '/productList': (context, {arguments}) =>
      ProductListPage(arguments: arguments),
  '/productContent': (context, {arguments}) =>
      ProductContentPage(arguments: arguments),
  '/checkOut': (context) => CheckOutPage(),
  '/addressAdd': (context) => AddressAddPage(),
  '/addressEdit': (context, {arguments}) =>
      AddressEditPage(arguments: arguments),
  '/addressList': (context) => AddressListPage(),
  '/pay': (context) => PayPage(),
  '/order': (context) => OrderPage(),
  '/orderinfo': (context) => OrderInfoPage(),
  '/listview': (context) => HomePage(),
  '/srollcontroller': (context) => ScrollControllerTestRoute(),
  '/commonwidget': (context) => CommonWidgetPage(),

  '/dragWidragPage': (context) => dragWidragPage(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
