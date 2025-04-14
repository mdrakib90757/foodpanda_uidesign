import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpanda_ui_project/Data/food_list.dart';
import 'package:foodpanda_ui_project/Data/food_model.dart';
import 'package:foodpanda_ui_project/Screen/details_screen.dart';
import 'package:foodpanda_ui_project/Widgets/custom_ratingbar.dart';
import 'package:foodpanda_ui_project/utlis/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,
          color: AppColor().primaryColors,
          size: 30,
        ),
        title: RichText(text: TextSpan(
          children: [
            TextSpan(
                text: "Deliver to :",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                )
            ),
            TextSpan(
                text: " Hobskin Road CA",
                style: TextStyle(
                    fontSize: 22,
                    color: AppColor().primaryColors,
                    fontWeight: FontWeight.w500
                )
            ),
          ]
        ),
        )
      ),
    
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.1))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: "search",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Image.asset("assets/image/adjust.png",
                      color: AppColor().primaryColors,)
                  ),
                ),
                SizedBox(height: 20,),
                ClipRRect(
                    child: Image.asset("assets/image/foodsdiscountBanar.png"),
                borderRadius: BorderRadius.circular(10),
                ),
                SizedBox(height: 20,),
                RichText(text: TextSpan(
                  children:[
                    TextSpan(
                      text: "Now ",style: TextStyle(
                      color: Colors.black,
                      fontSize: 22
                    )
                    ),
                    TextSpan(text: "open ",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                    )),
                    TextSpan(text: "for Order",style: TextStyle(
                        color: Colors.black,
                        fontSize: 22
                    )),
                  ]
                )),
                SizedBox(height: 20,),
                ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: foods.length,
                    itemBuilder: (context,index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DetailsScreen(food: foods[index]),));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(foods[index].imagePath),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(foods[index].name,style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),),
                                RatingBar.builder(
                                  glowColor: AppColor().primaryColors,
                                  initialRating:1,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 4,
                                  itemSize: 20,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 4),
                                  itemBuilder: (context, index) => Icon(Icons.star,
                                    color: AppColor().primaryColors,),
                                  onRatingUpdate: (rating) {
                                  },

                                )
                              ],
                            ),

                            Text(foods[index].Description,style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 15
                            ),),
                            SizedBox(height: 20,)
                          ],
                        ),
                      );
                    },
                )
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
