

import 'package:flutter/widgets.dart';

import 'package:foodpanda_ui_project/Data/food_model.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier{

  final List<foodModel>_Cart = [];
  List<foodModel> get cart => _Cart;

  void toggleFoodItem(foodModel food){
    final index= _Cart.indexWhere((item)=>item.name==food.name);
    if(index!=-1){
      _Cart[index].quantity++;
      }else{
      _Cart.add(food);
    }
    notifyListeners();
  }
  void incrementQuantity(int index){
    _Cart[index].quantity++;
    notifyListeners();
  }
  void decrementQunatity(int index){
   if(_Cart[index].quantity <=1 ){
     _Cart[index].quantity--;
   }else{
     _Cart.removeAt(index);
   }
    notifyListeners();
  }

  void removeProduct(int index){
    _Cart.removeAt(index);
  }

  int get totalitem=>_Cart.fold(0, (sum,item)=>sum+item.quantity);

  double get totalPrice{
    return _Cart.fold(0.0, (sum,item)=>sum+item.price*item.quantity);
  }

  static CartProvider of(
      BuildContext context,{bool listen = true
      }) {
    return Provider.of<CartProvider>(
        context,listen:listen
    );
  }

}