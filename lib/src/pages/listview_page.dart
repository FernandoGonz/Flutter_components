import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _numberList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addTen();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _createList(),
            _createLoading(),
          ],
        ),
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _refreshing,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: this._numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numberList[index];
          return FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300?image=$image'),
          );
        },
      ),
    );
  }

  Future<void> _refreshing() async {
    Timer(const Duration(seconds: 2), () {
      _numberList.clear();
      _lastItem++;
      _addTen();
    });
    return Future.delayed(const Duration(seconds: 2));
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      );
    }
    return Container();
  }

  void _addTen() {
    for (int i = 0; i < 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    Timer(const Duration(seconds: 2), httpResp);
  }

  void httpResp() {
    setState(() {
      _isLoading = false;

      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 250),
      );

      _addTen();
    });
  }
}
