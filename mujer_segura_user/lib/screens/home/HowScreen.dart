import 'package:flutter/material.dart';

class HowScreen extends StatefulWidget {
  HowScreen({Key key}) : super(key: key);
  @override
  State createState() {
    return _HowScreenState();
  }
}

class _HowScreenState extends State<HowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0, bottom: 40.0),
        scrollDirection: Axis.vertical,
        children: [
          Image.asset('assets/onboarding/on1.png'),
          Image.asset('assets/onboarding/on2.png'),
          Image.asset('assets/onboarding/on3.png')
        ],
      ),
    );
  }
}
