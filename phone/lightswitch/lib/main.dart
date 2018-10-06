import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'device_search.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: new DeviceSearch()
    );
  }
}
