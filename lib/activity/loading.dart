import 'package:flutter/material.dart';
import 'package:mausam/activity/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String? icon;
  String city="Indore";
  void startApp(String city) async {
    Worker instance = Worker(location: "$city");
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon=instance.icon;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {
          "temp_value": temp,
          "hum_value": hum,
          "air_speed_value": air_speed,
          "des_value": des,
          "main_value": main,
          "icon_value":icon,
          "city_value":city,
          "hum_value":hum,
          "air_value":air_speed,
          "des_value":des,
        },
      );
    });
  }

  @override
  void initState() {
    //startApp();yahan agar call karenge to class upar se call ho jayega or phir city default value indore le lega

    super.initState();
  }

  Widget build(BuildContext context) {
    Map<String, dynamic>? search =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if(search?.isNotEmpty??false){

      city=search?['searchtext'];
    } 
    startApp(city);   
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 250,),
              Image.asset(
                'assets/images/wicon.png',
                width: 200,
              ),
              Text(
                "Mausam",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Made by Rittik"),
              SizedBox(
                height: 20,
              ),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              )
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 78, 132, 225),
    );
  }
}
