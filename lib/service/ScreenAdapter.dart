import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static init(context) {
    // ScreenUtil.init(context, designSize: Size(750, 1334));
  }

  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static getScreenHeight() {
    // return ScreenUtil().screenHeight;
  }

  static getScreenWidth() {
    // return ScreenUtil().screenWidth;
  }

  static size(double value) {
    return ScreenUtil().setSp(value);
  }

  // ScreenUtil.screenHeight

}
//ScreenUtil().screenWidth   (sdk>=2.6 : 1.sw)    //Device width
// ScreenUtil().screenHeight  (sdk>=2.6 : 1.sh)    //Device height
