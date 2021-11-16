import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class MenuProvider {
  List<dynamic> _opciones = [];

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map<String, dynamic> dataMap = jsonDecode(resp);
    _opciones = dataMap['rutas'];

    return this._opciones;
  }
}
