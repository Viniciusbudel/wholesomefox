import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  StaggerAnimation({this.controller})
      : buttonSqueeze = Tween(begin: 320.0, end: 60.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.150),
          ),
        ),
        buttonZoomOut = Tween(begin: 60.0, end: 1000.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1, curve: Curves.easeInOutCirc),
          ),
        );

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: buttonZoomOut.value == 60
            ? Container(
                width: buttonSqueeze.value,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(151, 23, 23, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: _buildInside(context),
              )
            : Container(
                width: buttonZoomOut.value,
                height: buttonZoomOut.value,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(151, 23, 23, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(100.0))),
              ),
      ),
    );
  }

  Widget _buildInside(context) {
    if (buttonSqueeze.value > 75) {
      return Text(
        "Sign in",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 20,
            letterSpacing: 0.3),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
