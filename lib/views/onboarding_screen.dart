import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login_signup.dart';

class OnBoardingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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

            SizedBox(
              height: 5,
            ),

            // Text("Event Management System",style: TextStyle(fontSize: 16),),

            SizedBox(
              height: 100,
            ),

            Padding(
              // padding: EdgeInsets.only(left: 15,right: 15),
              // child: Image.asset('assets/onboardIcon.png'),
              padding: EdgeInsets.only(left: 150,right: 150),
              child: Image.asset('assets/plurk.png'),
            ),

            SizedBox(
              height: 150,
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
                      child: Text("Build great memories!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),),
                    ),



                    Padding(
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Text("Planitect is an app where users can collaborate with friends to gather travel itineraries, plans for party, and more.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,

                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: 15,
                          right: 15
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Colors.white,
                        elevation: 2,
                        onPressed: (){
                          Get.to(()=> LoginView());
                        },

                        child: Text("Get Started",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff274560),
                              fontWeight: FontWeight.w500
                          ),),),
                    )

                  ],
                ),
              ),
            ),

          ],

        ),
      ),
    ));
  }
}