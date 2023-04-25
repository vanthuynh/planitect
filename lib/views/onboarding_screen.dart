import 'package:flutter/material.dart';
class OnBoardingScreen extends StatelessWidget {
  // const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Text("Welcome to EMS!",style: TextStyle(
            color: Colors.black,
            fontSize: 27,
            fontWeight: FontWeight.w700,

          ),)
        ],
      ),
    ));
  }
}