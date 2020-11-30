import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:wholesomefoxapp/screens/home/home_screen.dart';
import 'package:wholesomefoxapp/screens/login/widgets/form_container.dart';
import 'package:wholesomefoxapp/screens/login/widgets/sign_up_button.dart';
import 'package:wholesomefoxapp/screens/login/widgets/stagger_animation.dart';
import 'package:wholesomefoxapp/utils/nav.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        push(context, HomeScreen(), replace: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.2;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(151, 23, 23, 1.0),
              Color.fromRGBO(232, 235, 234, 1.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          //color: Color(0xFF134980),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 32),
                      child: Image.asset(
                        "images/fox_256.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(),
                    SignUpButton()
                  ],
                ),
                StaggerAnimation(controller: _animationController.view)
              ],
            )
          ],
        ),
      ),
    );
  }
}
