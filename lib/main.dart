import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newsapp/home_page.dart';

import 'package:newsapp/services/themechenge.dart';
import 'package:newsapp/utills/class.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx News app',
      
      // theme: MyThemes.lightTheme,
      // darkTheme: MyThemes.darklight,
      
      theme: DisplayFunction.isDark.value
          ? ThemeData(
            useMaterial3: true,
            
              fontFamily: "custom",
              brightness: Brightness.dark,
            )
          : ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              
              fontFamily: "custom"
            ),
      
      home: HomePage());
  }
}
