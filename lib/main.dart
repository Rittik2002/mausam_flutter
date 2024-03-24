

import 'package:flutter/material.dart';
import 'package:mausam/activity/home.dart';
import 'package:mausam/activity/loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Home(),
      //dicsnary or map
      routes: {
        "/":(context) => loading(),
        "/home":(context) => Home(),
        "/loading":(context)=>loading(),
      },
    ),
  );
}
