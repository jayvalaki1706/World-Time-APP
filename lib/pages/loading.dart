import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  void setupWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png',url : 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime
    });
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }
  // void getData() async {
    // // simulate network request for a username
    // String username = await Future.delayed(Duration(seconds: 3),(){
    //   return 'yoshi';
    // });
    //
    // // simulate network to get bio of username
    // String bio = await Future.delayed(Duration(seconds: 2),(){
    //   return'vega, musian and edd collecotor';
    // });
    //
    // print('$username - $bio');

    // http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // // it is not a simple string , it is a JsonString , so we have to decode it and save it into Map so we can access them
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);
  // }



  @override
  void initState(){
    super.initState();
    print('initState function run');
    // getData();
    setupWorldTime();
    // the below code will not wait for the function
    // print('Hey....');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0
        ),
      ),
    );
  }
}

