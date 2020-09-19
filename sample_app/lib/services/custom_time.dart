import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI
  String time; // time for that location
  String flag; // url for an asset holding flag icon
  String url;
  bool isDayTime;
  
  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = json.decode(response.body);
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
   // print(dateTime);
   // print(offset);
   // creating a DateTime object
   DateTime now = DateTime.parse(dateTime);
   now = now.add(Duration(hours: int.parse(offset))); // adding the offset to the actual time
   isDayTime = now.hour>6 && now.hour<20 ? true:false;
   time = DateFormat.jm().format(now);


  }
}