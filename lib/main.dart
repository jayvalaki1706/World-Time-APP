import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  // home: Home(),
  // which ever the page we want to see first we use initialRoute key word
  initialRoute: '/',
  routes: {
      // main widget
    '/':(context)=> Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));