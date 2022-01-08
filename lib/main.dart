// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

Color mainColor = Colors.red.shade400;
Color textColor = Colors.white;
Color textColorLite = Colors.white70;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: mainColor,
        appBar: _appBar(),
        body: _appBody(),
      ),
    );
  }
}

AppBar _appBar() => AppBar(
      backgroundColor: mainColor,
      centerTitle: true,
      elevation: 0,
      title: Text(
        'Weather Forecast',
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget _appBody() => SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Finder(),
          Position(),
          _weekDay(),
          WeatherStatus(),
          _weatherParameters(),
          _weatherForecast(),
        ],
      ),
    );

Widget _weekDay() => Container(
      margin: EdgeInsets.only(top: 12),
      child: Text(
        'Friday, Mar 20, 2022',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColorLite,
          fontSize: 18,
        ),
      ),
    );

Widget _weatherParameters() => Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WeatherParameter(
            icon: Icons.ac_unit,
            value: '5',
            parameter: 'km/h',
          ),
          WeatherParameter(
            icon: Icons.ac_unit,
            value: '3',
            parameter: '%',
          ),
          WeatherParameter(
            icon: Icons.ac_unit,
            value: '20',
            parameter: '%',
          ),
        ],
      ),
    );

Widget _weatherForecast() => Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              '7-day weather forecast'.toUpperCase(),
              style: TextStyle(
                color: textColorLite,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              padding: EdgeInsets.only(right: 100),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return ForecastItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 1,
                );
              },
            ),
          )
        ],
      ),
    );

class Finder extends StatelessWidget {
  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(
          Icons.search_outlined,
          color: textColor,
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Enter City Name',
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class Position extends StatelessWidget {
  @override
  Widget build(context) {
    double horizontalPadding = 30;

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 30),
      padding:
          EdgeInsets.only(left: horizontalPadding, right: horizontalPadding),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          'Kurganskaya Oblast, RU',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class WeatherStatus extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.wb_sunny,
              color: textColor,
              size: 90,
            ),
          ),
          Column(
            children: [
              Text(
                '14 °F',
                style: TextStyle(
                  color: textColorLite,
                  fontSize: 64,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Text(
                'Light snow'.toUpperCase(),
                style: TextStyle(
                  color: textColorLite,
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class WeatherParameter extends StatelessWidget {
  IconData icon;
  String parameter;
  String value;

  WeatherParameter({
    Key? key,
    required this.icon,
    required this.parameter,
    required this.value,
  });

  @override
  Widget build(context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Icon(
            icon,
            color: textColor,
            size: 30,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: textColorLite,
            fontSize: 22,
          ),
        ),
        Text(
          parameter,
          style: TextStyle(
            color: textColorLite,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class ForecastItem extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      color: Colors.white30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Friday',
            style: TextStyle(
              color: textColor,
              fontSize: 24,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '6 °F',
                style: TextStyle(
                  color: textColor,
                  fontSize: 26,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.ac_unit,
                  size: 30,
                  color: textColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
