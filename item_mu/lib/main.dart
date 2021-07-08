import 'package:flutter/material.dart';
import 'package:flutter_training/models/utils/config.dart';
import 'package:flutter_training/views/pages/login.dart';

// TO DO:
// -Infographic

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  
  initState() {
    super.initState();
    currentTheme.addListener((){
      print('Ganti Theme');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: LoginPage(),
    );
  }

}