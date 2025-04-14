import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:foodpanda_ui_project/Data/food_list.dart';
import 'package:foodpanda_ui_project/Data/food_model.dart';





import 'package:foodpanda_ui_project/Provider/cart_provider.dart';
import 'package:foodpanda_ui_project/Screen/cart_screen.dart';
import 'package:foodpanda_ui_project/Widgets/category_product.dart';
import 'package:foodpanda_ui_project/utlis/color.dart';

class DetailsScreen extends StatefulWidget {
  final foodModel food;
  const DetailsScreen({super.key, required this.food});


  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}
class _DetailsScreenState extends State<DetailsScreen> {
  int select=0;
  @override
  Widget build(BuildContext context) {
    final provider=CartProvider.of(context);
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        top: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height:height*0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 15,
                      offset: Offset(0, 5)
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.food.imagePath),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 8,),
              Expanded(
                  child: SizedBox(
                      child: CategoryProduct())),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  height:height/8.8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor().primaryColors,
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${provider.totalitem} items in cart",style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,

                            ),),
                            Text("1st vagget Bowl  1st simple salad ",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              fontSize: 10
                            ),),

                          ],
                        ),


                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IconButton(onPressed: () {
                              provider.toggleFoodItem(widget.food);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => CartScreen(),));
                            }, icon: Icon(Icons.shopping_bag_outlined,
                              color: Colors.white,size: 35,)),
                            Positioned(
                              top: 6,

                              child: CircleAvatar(
                                radius: 11,
                                backgroundColor:Colors.white ,
                                child: Center(child: Text("${provider.totalitem}",
                                  style: TextStyle(color: AppColor().primaryColors,
                                    fontSize: 14
                                  ),)),
                              ),
                            )

                          ],
                        )
                      ],
                    ),
                  )




                ),
              ),

            ]
          )
      ),
    );
  }
}



