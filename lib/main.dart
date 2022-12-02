import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app_flutter/layout/news_layout.dart';

void main() {
  runApp(const MyApp());
}

//t
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          //من غير type لونه هيبقى ابيض
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black, size: 35.0),
          titleTextStyle: TextStyle(
              fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
      home: const NewsLayout(),
    );
  }
}
