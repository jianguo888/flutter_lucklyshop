import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static getScreenHeight() {
    //屏幕的高度  物理高度
    return ScreenUtil().screenHeight;
  }

  static getScreenWidth() {
    //屏幕的宽度  物理宽度
    return ScreenUtil().screenWidth;
  }

  static size(double value) {
    return ScreenUtil().setSp(value);
  }
}

// ScreenAdaper
