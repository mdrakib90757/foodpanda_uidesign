
import 'package:flutter/material.dart';
import 'package:foodpanda_ui_project/Screen/home_screen.dart';
import 'package:foodpanda_ui_project/utlis/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:AppColor().primaryColors,
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/image/download (4).png",
                color: Colors.white.withOpacity(0.8),height: height/5.5,width: 150,
              alignment: Alignment.center,),
              Text("foodpanda",style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(height: height/2.4),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Start Ordering",style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                ],)
            ],),
        ),
      ),
    );
  }
}
