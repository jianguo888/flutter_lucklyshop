import 'package:flutter/material.dart';

class Cart with ChangeNotifier{

  List _cartList=[];  //状态
 
  List get cartList=>this._cartList;


}