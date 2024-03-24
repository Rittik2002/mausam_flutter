import 'dart:convert';
import 'package:http/http.dart' as http;

class Worker {
  String? location;
  Worker({required this.location}) {
    location = this.location;
  }
  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String?icon;
  Future<void> getData() async {
    try {
      Uri url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=0cdda4c44545a0ea8766c733a73f8a19");
      http.Response response = await http.get(url);
      Map data = jsonDecode(response.body);

      //getting temp,humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp']-273.15;

      //getting air speed
      Map wind = data['wind'];
      double getAirspeed = wind['speed']*3.6;

      //getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];
      
      
      //Assigning values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAirspeed.toString();
      description = getDesc;
      main = getMain_des;
      icon=weather_main_data['icon'].toString();
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "No data found";
      main = "No data found";
      icon="03n";
    }
  }
}
