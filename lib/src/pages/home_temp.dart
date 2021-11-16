import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> options = [
    'Uno',
    'Dos',
    'Tres',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home temo'),
        ),
        body: ListView(
          children: _createItems(),
        ),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Column> widgets = options.map((item) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text(item),
            subtitle: Text('Buyed'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              
            },
          ),
          Divider(),
        ],
      );
    }).toList();

    return widgets;
  }
}
