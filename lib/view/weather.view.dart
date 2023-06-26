import 'package:flutter/material.dart';
import 'package:sehatin/utils/global.colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather extends StatefulWidget {
  const Weather({Key? key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var location;
  var temp;
  var description;
  var currently;
  var humidity;
  var windspeed;

  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=d9bf068efe4e4fbab6a104342232305&q=london'));

    var result = jsonDecode(response.body);

    setState(() {
      this.location = result['location']['name'];
      this.temp = result['current']['temp_c'];
      this.description = result['current']['condition']['text'];
      this.currently = result['location']['name'];
      this.humidity = result['current']['humidity'].toString();
      this.windspeed = result['current']['wind_mph'].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: GlobalColors.mainColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    temp != null ? location.toString() + "" : "loading",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  temp != null ? temp.toString() + "\u00B0" : "loading",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    description != null ? description.toString() : "loading",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  // ignore: deprecated_member_use
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  iconColor: GlobalColors.buttonColor,
                  title: Text("Temperature"),
                  trailing: Text(
                      temp != null ? temp.toString() + "\u00B0" : "loading"),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  iconColor: GlobalColors.buttonColor,
                  title: Text("Weather"),
                  trailing: Text(
                      description != null ? description.toString() : "loading"),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.sun),
                  iconColor: GlobalColors.buttonColor,
                  title: Text("TemperatureHumidity"),
                  trailing:
                      Text(humidity != null ? humidity.toString() : "loading"),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.wind),
                  iconColor: GlobalColors.buttonColor,
                  title: Text("WindSpeed"),
                  trailing: Text(
                      windspeed != null ? windspeed.toString() : "loading"),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
