import 'package:eccomerce/presentation/features/model/model_data.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  String id;
  CartScreen(this.id);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {

   final selectCart=dummyMeal.firstWhere((meal) => meal.id == widget.id);
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Cart')),),
      body: ListTile(
        title: Text(selectCart.title),
      ),
    );
  }
}
