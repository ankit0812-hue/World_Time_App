import 'package:flutter/material.dart';
import 'package:sample_app/services/custom_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getWorldTime()  async {
  WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
     Navigator.pushReplacementNamed(context, '/home', arguments: {
       'location': instance.location,
       'flag': instance.flag,
       'time': instance.time,
       'isDayTime': instance.isDayTime
     });
 }
  @override
  void initState() {
    super.initState();
    getWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
           color: Colors.white,
            size: 50.0,
         ),
      ),
      
    );
  }
}