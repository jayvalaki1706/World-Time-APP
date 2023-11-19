import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'berlin.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'Cairo.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'Nairobi.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'Chicago.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'New_York.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'Seoul.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'Jakarta.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'India.png'),
    WorldTime(url: 'Europe/Jersey', location: 'Jersey', flag: 'Jersey.png'),
    WorldTime(url: 'Europe/Malta', location: 'Malta', flag: 'Malta.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'Paris.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'Sydney.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bankok', flag: 'Bangkok.png'),
    WorldTime(url: 'Asia/Macao', location: 'Macao', flag: 'Macao.png'),
    WorldTime(url: 'America/Denver', location: 'Denver', flag: 'Denver.png'),
    WorldTime(url: 'Asia/Toronto', location: 'Toronto', flag: 'Toronto.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    print('initState function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding : EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    // print(locations[index].location);
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
