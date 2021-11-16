import 'package:components/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home temo'),
        ),
        body: _list(withContext: context),
    );
  }

  Widget _list({required BuildContext withContext}) {
    MenuProvider menuPro = MenuProvider();
    return FutureBuilder(
      future: menuPro.cargarData(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.data != null) {
          return ListView(
            children: _createItems(withData: snapshot.data!, context: withContext),
          );
        }
        return Container();
      },
    );
  }

  List<Widget> _createItems({required List<dynamic> withData, required BuildContext context}) {
    
    final List<Widget> opciones = [];

    withData.forEach((element) { 
      final widgetTemp = ListTile(
        leading: const Icon(Icons.account_circle),
        title: Text(element['texto']),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          // Navigator.pushNamed(context, 'card_page');
          // Navigator.pushNamed(context, 'avatar_page');
          // Navigator.pushNamed(context, 'alert_page');
          // Navigator.pushNamed(context, 'animated_container_page');
          // Navigator.pushNamed(context, 'input_page');
          Navigator.pushNamed(context, 'list_view');
        },
      );
      opciones.add(widgetTemp);
      opciones.add(const Divider());
    });

    return opciones;

  }
}
