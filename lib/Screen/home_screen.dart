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
        leading: Builder(builder: (context) => IconButton(onPressed: () {
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu,color: AppColor().primaryColors,)),),
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: AppColor().primaryColors,
              //
              //   ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     CircleAvatar(
              //       maxRadius: 35,
              //       child: Image.asset("assets/image/alphabet.png",
              //         height: 30,width: 30,
              //       color: AppColor().primaryColors,),
              //     ),
              //     Text("Md Rakib",style: TextStyle(
              //       color:Colors.white,
              //       fontSize: 20,
              //     ),)
              //   ],
              // )),


              UserAccountsDrawerHeader(
                accountName: Text("Md Rakib",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),),
                accountEmail: Text("mdrakib@gmail.com",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),),
                currentAccountPicture: CircleAvatar(
                  child: Image.asset("assets/image/alphabet.png",
                    height: 40,width: 40,color: AppColor().primaryColors,),
                ),
                decoration: BoxDecoration(
                    color: AppColor().primaryColors
                ),
              ),
              ListTile(
                title:Text("Vouchers & Offers",style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ),),
                leading: Icon(Icons.local_offer_outlined,color: AppColor().primaryColors,),
              ),
              ListTile(
                title:Text("Favorite",style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),),
                leading: Icon(Icons.favorite_border,color: AppColor().primaryColors,),
              ),
              ListTile(
                title:Text("Orders & reordering",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),),
                leading: Icon(Icons.receipt_long,color: AppColor().primaryColors,),
              ),
              ListTile(
                title:Text("Addresses",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),),
                leading: Icon(Icons.local_offer_outlined,color: AppColor().primaryColors,),
              ),
              ListTile(
                title:Text("Payment methods",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),),
                leading: Icon(Icons.payment,color: AppColor().primaryColors,),
              ),
              ListTile(
                title:Text("Help center",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),),
                leading: Icon(Icons.help_center,color: AppColor().primaryColors,),
              ),
              ListTile(
                title:Text("Invite friends",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),),
                leading: Icon(Icons.group_add_outlined,color: AppColor().primaryColors,),
              ),
              Divider(),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text("Settings",style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text("Terms & Condition/Privacy",style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                ),),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text("Logout",style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                ),),
              ),
            ],
          ),
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
