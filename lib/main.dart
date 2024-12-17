import 'package:flutter/material.dart';
import 'login.dart';
import 'feed.dart';
void main() {
  runApp(DevConnectApp());
}

class DevConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/feed': (context) => FeedScreen(),

      },
    );
  }
}