import 'package:flutter/material.dart';
import 'package:foodpanda_ui_project/Provider/cart_provider.dart';
import 'package:foodpanda_ui_project/utlis/color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finallist = provider.cart;
    _productQuantity(IconData icon, int index,Color color) {
      return GestureDetector(
        onTap: () {
          setState(() {
            if(icon==Icons.add){
              provider.incrementQuantity(index);
            }else if(icon==Icons.remove){
              provider.decrementQunatity(index);
            }else if(icon==Icons.delete){
              provider.removeProduct(index);
            };
          });
        },
        child: Icon(icon,color: Colors.black,),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        centerTitle: true,
        title: Text("My Cart",style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: AppColor().primaryColors,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: finallist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                          Image.asset(finallist[index].image,
                            height: 60,width: 60,fit: BoxFit.cover,),
                            SizedBox(width: 5,),
                            Text(finallist[index].name,style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        _productQuantity(Icons.add, index, Colors.black),
                                        Text(finallist[index].quantity.toString()),
                                        _productQuantity(Icons.remove, index, Colors.black),
                                        SizedBox(width: 20,),
                                        _productQuantity(Icons.delete, index, Colors.black)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,)
                            ],),),

                      ],),);

                },),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Subtotal",style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 20
                ),),
                Text("\$${0}",style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 20,
                ),)
              ],),),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery charge",style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 20
                  ),),
                  Text("\$${0}",style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 20,
                  ),)
                ],),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total amount",style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("\$${provider.totalPrice}",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),)
                ],),),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor().primaryColors
                ),
                child: Center(
                  child: Text("Review payment and address",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            )


          ],),),

    );
  }
}
