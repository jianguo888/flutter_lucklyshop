import 'package:flutter/material.dart';







class dragWidragPage
    extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FloatBtn(),
    );
  }
}

class FloatBtn extends StatefulWidget {
  FloatBtn({Key key}) : super(key: key);

  @override
  _FloatBtnState createState() => _FloatBtnState();
}

class _FloatBtnState extends State<FloatBtn> {

  Offset offsetA = Offset(20, kToolbarHeight + 100);//按钮的初始位置

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body:  CustomScrollView(
        ///视窗
        slivers: <Widget>[
          //转接器

          SliverToBoxAdapter(
            child: Text("表头"),
          ),
          SliverToBoxAdapter(
            child: Text("表头2"),
          ),
          SliverToBoxAdapter(
            child: FlutterLogo(),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((con, index) {
            return Container(
              height: 200,
              color: Colors.accents[index % 200],
            );
          }))
        ],
      )
      ,
    );
  }
}