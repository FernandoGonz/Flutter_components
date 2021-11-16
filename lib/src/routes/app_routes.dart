import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/animated_container.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/input_page.dart';
import 'package:components/src/pages/listview_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    '/': (context) => const HomePage(),
    'alert_page': (context) => const AlertPage(),
    'avatar_page': (context) => const AvatarPage(),
    'card_page': (context) => const CardPage(),
    'animated_container_page': (context) => const AnimatedContainerPage(),
    'input_page': (context) => const InputPage(),
    'list_view': (context) => const ListViewPage(),
  };
}
