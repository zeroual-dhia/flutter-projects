import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //Location name for the UI
  String? time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //Lcation url for api endpoint
  bool? isDayTime;
  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      Uri Url = Uri.parse("https://worldtimeapi.org/api/timezone/$url");
      Response resp = await get(Url);
      Map info = jsonDecode(resp.body);

      String dateTime = info['datetime'],
          offset = info['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20  ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("caught error : $e");
      time = 'could not get time data';
    }
  }
}
