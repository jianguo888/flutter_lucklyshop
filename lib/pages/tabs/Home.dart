

import 'package:flutter/material.dart';
import '../../service/ScreenAdapter.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import '../../config/Config.dart';
import 'package:dio/dio.dart';
//轮播图类模型
import '../../model/FocusModel.dart';
import '../../model/ProductModel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List _focusData = [];
  List _hotProductList = [];
  List _bestProductList = [];
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  //初始化f
  @override
  void initState() {
    super.initState();
    _getFocusData();
    _getHotProductData();
    _getBestProductData();
  }

//获取轮播图数据
  _getFocusData() async {
    var api = '${Config.domain}api/focus'; //api接口拼接

    var result = await Dio().get(api);

    // print( focusData.data is Map );

    var focusList = FocusModel.fromJson(result.data);

    print(focusList.result);

    // focusList.result.forEach((value) {
    // print(value.title);
    // print(value.pic);
    // });

    setState(() {
      this._focusData = focusList.result;
    });
  }
//获取猜你喜欢数据

  _getHotProductData() async {
    var api = '${Config.domain}api/plist?is_hot=1';
    var result = await Dio().get(api);
    var hotProductList = ProductModel.fromJson(result.data);
    setState(() {
      this._hotProductList = hotProductList.result;
    });
  }

  //获取热门推荐的数据
  _getBestProductData() async {
    var api = '${Config.domain}api/plist?is_best=1';
    var result = await Dio().get(api);
    var bestProductList = ProductModel.fromJson(result.data);
    setState(() {
      this._bestProductList = bestProductList.result;
    });
  }

  //轮播图
  Widget _swiperWidget() {
    if (this._focusData.length > 0) {
      return Container(
        child: AspectRatio(
          //配置宽高比
          aspectRatio: 2 / 1,
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              String pic = this._focusData[index].pic;
              pic = Config.domain + pic.replaceAll('\\', '/');
              return new Image.network(
                // "${Config.domain}${pic.replaceAll('\\', '/')}",
                "${pic}",
                fit: BoxFit.fill,
              );
            },
            itemCount: this._focusData.length,
            pagination: new SwiperPagination(), //分页器
            autoplay: true, //自动轮播
          ),
        ),
      );
    } else {
      return Text("加载中............");
    }
  }

//标题组件 猜你喜欢以及热门推荐
  Widget _titleWidget(value) {
    return Container(
      height: ScreenAdapter.height(32),
      // height:32.w,
      margin: EdgeInsets.only(
        left: ScreenAdapter.width(10),
      ), //距离左侧尺寸
      padding: EdgeInsets.only(left: ScreenAdapter.width(10)),
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(
          color: Colors.red,
          width: ScreenAdapter.width(1),
        )),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }

//    猜你喜欢
  Widget _hotProductListWidget() {
    if (this._hotProductList.length > 0) {
      return Container(
        height: ScreenAdapter.height(260),
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (contxt, index) {
            //处理图片
            String sPic = this._hotProductList[index].sPic;
            sPic = Config.domain + sPic.replaceAll("\\", "/");
            return Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: ScreenAdapter.height(140),
                    width: ScreenAdapter.width(140),
                    margin: EdgeInsets.only(right: ScreenAdapter.width(21)),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(sPic,
                          //  "${sPic}",
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
                  height: ScreenAdapter.height(46),
                  child: Text(
                    "￥${this._hotProductList[index].price}",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            );
          },
          itemCount: this._hotProductList.length,
        ),
      );
    } else {
      return Text("加载中111111111");
    }
  }

  //推荐商品
  Widget _recProducListWidget() {
    var itemWidth = (ScreenAdapter.getScreenWidth() - 30) / 2;
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: this._bestProductList.map((value) {
          //图片
          String sPic = value.sPic;
          sPic = Config.domain + sPic.replaceAll('\\', '/');

          return InkWell(
            
            onTap: (){
Navigator.pushNamed(context, "/productContent",arguments: {

  "id": value.sId
});

            },
            
            
            child: Container(
            padding: EdgeInsets.all(10),
            width: itemWidth,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: AspectRatio(
                    //防止服务器返回的图片大小不一致导致高度不一致问题
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      "${sPic}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                  child: Text(
                    "${value.title}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "¥${value.price}",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("¥${value.oldPrice}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    return ListView(
      children: [
        _swiperWidget(),
        SizedBox(height: ScreenAdapter.height(20)),
        _titleWidget("猜你喜欢"),
        SizedBox(height: ScreenAdapter.height(10)),
        _hotProductListWidget(),
        _titleWidget("热门推荐"),
        _recProducListWidget(),
      ],
    );
  }
}
