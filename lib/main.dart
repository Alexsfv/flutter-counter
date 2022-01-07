// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color counterColor = Colors.white;

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Oxygen'),
      home: Scaffold(
        appBar: Header(),
        body: Body(),
      ),
    );
  }
}

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  build(context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.indigo[600],
      title: Text(
        'Counter',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class Body extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      color: Colors.deepPurple[600],
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterText(
            key: Key('tp-ct-text'),
            text: 'Tap "-" to descrement',
          ),
          Counter(),
          CounterText(
            key: Key('bt-ct-text'),
            text: 'Tap "+" to increment',
          ),
        ],
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _count = 0;

  _handleDecrement() {
    setState(() {
      _count--;
    });
  }

  _handleIncrement() {
    setState(() {
      _count++;
    });
  }

  @override
  build(contenxt) {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterButton(
            isLeftRounded: true,
            src: 'assets/icons/minus.svg',
            onPressed: _handleDecrement,
          ),
          CounterField(
            key: Key('1'),
            value: _count,
          ),
          CounterButton(
            isRightRounded: true,
            src: 'assets/icons/plus.svg',
            onPressed: _handleIncrement,
          ),
        ],
      ),
    );
  }
}

class CounterField extends StatelessWidget {
  int value = 0;

  CounterField({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      width: 40,
      height: 40,
      color: counterColor,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$value',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  final String text;

  const CounterText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      width: 170,
      padding: EdgeInsets.all(10),
      child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          )),
    );
  }
}

class CounterButton extends StatelessWidget {
  void Function()? onPressed;
  bool isRightRounded = false;
  bool isLeftRounded = false;
  String src;

  CounterButton({
    Key? key,
    required this.src,
    required this.onPressed,
    this.isRightRounded = false,
    this.isLeftRounded = false,
  }) : super(key: key);

  @override
  Widget build(context) {
    const double size = 40;
    const double radius = 6;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: counterColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isLeftRounded ? radius : 0),
            topRight: Radius.circular(isRightRounded ? radius : 0),
            bottomRight: Radius.circular(isRightRounded ? radius : 0),
            bottomLeft: Radius.circular(isLeftRounded ? radius : 0),
          )),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(src),
        splashColor: Colors.red,
        hoverColor: Colors.red,
      ),
    );
  }
}
