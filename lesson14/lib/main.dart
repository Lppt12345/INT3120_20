import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Lesson 14 - 19021262'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key ? key, required this.title}) : super(key: key);
  final String title;
  static const platform =
  MethodChannel('flutterapp.tutorialspoint.com/browser');

  Future<void> _openBrowser() async {
    try {
      final int result = await platform.invokeMethod(
          'openBrowser', <String, String>{'url': "https://flutter.dev"});
    } on PlatformException catch (e) {
// Unable to open the browser print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open Browser'),
          onPressed: _openBrowser,
        ),
      ),
    );
  }
}
