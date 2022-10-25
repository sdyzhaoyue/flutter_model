import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  var list = [];
  ScrollController _controller = ScrollController();
  int _page = 1; //加载的页数
  bool isLoading = false; //是否正在加载数据
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      //print(_scrollController.position.pixels); //当前距离值
      //print(_scrollController.position.maxScrollExtent); //最大距离值
      //当 当前距离值>最大距离值-20的时候 进行上拉加载数据并分页
      print('11');
      if (_controller.position.pixels >
          _controller.position.maxScrollExtent - 20) {
        print('滑动到了最底部');
        _getMore();
      }
    });

    for (var i = 0; i < 100; i++) {
      list.add(i);
    }
  }

  /**
   * 上拉加载更多
   */
  Future _getMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        print('加载更多');
        setState(() {
          list.addAll(List.generate(5, (i) => '第$_page次上拉来的数据'));
          _page++;
          isLoading = false;
        });
      });
    }
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index < list.length) {
      return ListTile(
        title: Text(list[index].toString()),
      );
    }
    return _getMoreWidget();
  }

  /**
   * 加载更多时显示的组件,给用户提示
   */
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
              color: Colors.red
            )
          ],
        ),
      ),
    );
  }


  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('32123');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list"),
      ),
      body: Scrollbar(
          child: RefreshIndicator(
            child: ListView.builder(
              itemBuilder: _renderRow,
              itemCount: list.length + 1,
              controller: _controller,
            ),
            onRefresh: _onRefresh,
            color: Colors.red,
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
