import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for the UI
  String time = ""; // the time in that location
  String flag; // url to an asset to the flag
  String url; // location url for api endpoint
  bool isDaytime = true; // true or false if daytime or not
  // lets create a instance of class
  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async {

    try{
      // make the request
      http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      // create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);
      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught error : $e');
      time = 'could not get the time data';
    }

  }
}