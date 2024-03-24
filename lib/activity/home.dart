import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = new TextEditingController();
  //String username = "aaaaaaa";
  // void timer(){
  //   //future delay will exicute the function after some time
  //   //flutter will exicute other operations and after given time
  //   //this function will be exicuted
  //   Future.delayed(Duration(seconds: 3),(){
  //     print("Alarm is ringing");
  //   });
  //   print("you can do other stuff too");
  // }

  //Async-> function start but return some after some delay
  //future.delayed->function start after some delay

  // getData() async {
  //   await Future.delayed(
  //     Duration(seconds: 2),
  //     () {
  //       username = "Rittik";
  //     },
  //   );
  // }

  // void showdata() async {
  //   await getData();
  //   print("$username");
  // }

  @override
  void initState() {
    super.initState();
    //timer();
    //showdata();
    // getData();
    print("init state");
  } //it is called when stateful widget is first created

  @override
  void dispose() {
    super.dispose();
    print("Widget Destroyed");
  }

  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    // Check if the route has arguments and if it's of the expected type
    Map<String, dynamic>? info =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String temp = info?['temp_value'];
    String icon = info?['icon_value'];
    String getcity = info?['city_value'];
    String hum = info?['hum_value'];
    String air = info?['air_value'];
    String des = info?['des_value'];
    if (temp == "NA") {
      print("NA");
    } else {
      temp = ((info?['temp_value']).toString()).substring(0, 4);
      air = ((info?['air_value']).toString()).substring(0, 4);
    }
    if (info != null) {
      // Arguments are not null, proceed with accessing values
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.blue,
          ),
          preferredSize: const Size.fromHeight(0),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 108, 182, 244),
                      Color.fromARGB(255, 7, 132, 235),
                    ]),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 232, 222, 222),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if ((searchcontroller.text).replaceAll(" ", "") ==
                                "") {
                              print("Blank Search");
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, "/loading",
                                  arguments: {
                                    "searchtext": searchcontroller.text,
                                  });
                            }
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search $city",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          padding: EdgeInsets.all(25),
                          child: Row(
                            children: [
                              Image.network(
                                  "https://openweathermap.org/img/wn/$icon@2x.png"),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "$des",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "in $getcity",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          padding: const EdgeInsets.all(26),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.thermometer),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "$temp",
                                    style: TextStyle(fontSize: 90),
                                  ),
                                  Text(
                                    "°C",
                                    style: TextStyle(fontSize: 60),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          height: 250,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 2, 0, 50),
                        padding: EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("$air "),
                            Text("Km/hr"),
                          ],
                        ),
                        height: 150,
                        width: 150,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 2, 0, 50),
                        padding: EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("$hum "),
                            Text("%"),
                          ],
                        ),
                        height: 150,
                        width: 140,
                      ),
                    ],
                  ),
                  const Text("Data Provided By Openweathermap.org",
                      style: TextStyle(color: Colors.black87)),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      // Arguments are null, handle this case (e.g., show an error message)
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 160, 160, 242),
                Color.fromARGB(255, 189, 93, 241),
              ],
            ),
          ),
          child: Column(
            children: const [
              SpinKitWave(
                color: Color.fromARGB(255, 234, 104, 104),
                size: 50.0,
              )
            ],
          ),
        ),
      );
    }
  }
}
