import 'package:flutter/material.dart';
import 'package:wholesomefoxapp/screens/home/widgets/home_top.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        padding: EdgeInsets.zero,
        children: [
          HomeTop()
        ],
      ),
    );
  }
}
