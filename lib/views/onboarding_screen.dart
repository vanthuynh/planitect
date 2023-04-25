import 'package:flutter/material.dart';
class OnBoardingScreen extends StatelessWidget {
  // const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext) {
    return SafeArea(child: Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(
              height: 50,
            ),
            Text("Welcome to Planitect!",style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.w700,

            ),),
            Text("Welcome to EMS!",style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.w700,
            ),),

            SizedBox(
              height: 5,
            ),

            Text("Event Management System",style: TextStyle(fontSize: 16),),

            SizedBox(
              height: 50,
            ),

            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Image.asset('assets/onboardIcon.png'),
            ),

            SizedBox(
              height: 50,
            ),


            Expanded(
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 2
                      )
                    ],
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [



                    Padding(
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Text("The social media platform designed to get you offline",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),),
                    ),



                    Padding(
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Text("EMS is an app where users can leverage their social network to create, discover, share, and monetize events or services.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,

                        ),),
                    ),

                  ],
                ),
              ),
            ),
          ],
        )
      ),
    ));
  }
}