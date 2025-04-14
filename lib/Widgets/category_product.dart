
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_ui_project/Provider/cart_provider.dart';
import 'package:foodpanda_ui_project/Screen/cart_screen.dart';
import 'package:foodpanda_ui_project/utlis/color.dart';

import '../Data/food_model.dart';

class CategoryProduct extends StatefulWidget {

  const CategoryProduct({super.key});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct>

with SingleTickerProviderStateMixin{
  late TabController _tabControllar;

  List<category>categories=[
    category(categoryname: "Salads",
        items: [
          foodModel(
              id: 0,
              name: "Simple pro Salad",
              imagePath: "imagePath",
              image:"assets/image/salad1.png",
              category: "category",
              Description: "All healthy veggies including some healthy sauce",
              price: 50,
            oldPrice: 50,
            isFavorit: false, quantity: 0, count: 0,
          ),
          foodModel(
            id: 1,
            name: "All veggies Bowl",
            imagePath: "imagePath",
            image:"assets/image/salad2.png",
            category: "category",
            Description: "ATasty yet healthy",
            price: 50,
            oldPrice: 50,
            isFavorit: false, quantity: 0, count: 0,
          ),
          foodModel(
            id: 2,
            name: "Best Healthy",
            imagePath: "imagePath",
            image:"assets/image/salad4.png",
            category: "category",
            Description: "All healthy veggies including some healthy sauce",
            price: 50,
            oldPrice: 50,
            isFavorit: false, quantity: 0, count: 0,
          ),
          foodModel(
            id: 3,
            name: "Best Healthy",
            imagePath: "imagePath",
            image:"assets/image/Starters1.png",
            category: "category",
            Description: "All healthy veggies including some healthy sauce",
            price: 50,
            oldPrice: 50,
            isFavorit: false, quantity: 0, count: 0,
          ),
          foodModel(
            id: 4,
            name: "Best Healthy",
            imagePath: "imagePath",
            image:"assets/image/images.jpeg",
            category: "category",
            Description: "All healthy veggies including some healthy sauce",
            price: 50,
            oldPrice: 50,
            isFavorit: false, quantity: 0, count: 0,
          ),

        ]
    ),
    category(categoryname: "Starters", items: [
      foodModel(
        id: 0,
        name: "Best Healthy",
        imagePath: "imagePath",
        image:"assets/image/Starters1.png",
        category: "category",
        Description: "All healthy veggies including some healthy sauce",
        price: 50,
        oldPrice: 50,
        isFavorit: false, quantity: 0, count: 0,
      ),
      foodModel(
        id: 1,
        name: "Best Healthy",
        imagePath: "imagePath",
        image:"assets/image/images.jpeg",
        category: "category",
        Description: "All healthy veggies including some healthy sauce",
        price: 50,
        oldPrice: 50,
        isFavorit: false, quantity: 0, count: 0,
      ),

    ]),
    category(categoryname: "MainCourse", items: []),
    category(categoryname: "Dressert", items: []),
    category(categoryname: "off manu", items: []),

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabControllar=TabController(length: categories.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final provider=CartProvider.of(context);
    return  DefaultTabController(
        length: categories.length,
        child: Column(
          children: [
        Material(
          child: TabBar(
          labelPadding: EdgeInsets.zero,
          //isScrollable: true,
          indicatorColor: AppColor().primaryColors,
          unselectedLabelColor: Colors.black,
          labelColor: AppColor().primaryColors,
            //physics: ScrollPhysics(),
         //padding: EdgeInsets.zero,
          controller: _tabControllar,
          tabs: categories.map((cat){
            return Tab(
              text: cat.categoryname,
            );
          }).toList()),
        ),
            Expanded(
              child: TabBarView(
                  controller: _tabControllar,
                  children: categories.map((catlable){
                    return ListView.builder(
                      padding: EdgeInsets.all(8),
                      shrinkWrap: true,
                      itemCount: catlable.items.length,
                      itemBuilder: (context, index) {
                        final item=catlable.items[index];
                        return GestureDetector(
                          onTap: () {
                            provider.toggleFoodItem(item);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>CartScreen() ,
                            ));},
                          child: Card(
                            child: ListTile(
                              leading: Image.asset(item.image,height: 50,width: 50,),
                              title: Text(item.name,style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),),
                              subtitle: Text(item.Description,style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),),
                              trailing: Column(
                                children: [
                                  Text("\$${item.price}",style: TextStyle(
                                      color: AppColor().primaryColors,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                  ),),
                                  Text("\$${item.oldPrice}",style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        );
                        },
                    );
                  }).toList()
              ),
            )
          ],
        )
    );

  }
}
