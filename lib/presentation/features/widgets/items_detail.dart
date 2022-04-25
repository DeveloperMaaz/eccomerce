import 'package:eccomerce/presentation/features/controller/cart_controler.dart';
import 'package:eccomerce/presentation/features/model/cart_model.dart';
import 'package:eccomerce/presentation/features/model/model_data.dart';
import 'package:eccomerce/presentation/features/widgets/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ItemDetails extends StatefulWidget {
  String idItem;

  ItemDetails(this.idItem, {Key? key}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    final cartData= context.read<CartController>();

    final selectModel = dummyMeal.firstWhere((meal) => meal.id == widget.idItem);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detailed screen"),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: Image.network(
              selectModel.imageUrl,
              height: 250,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Title",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Text(selectModel.title),
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Price",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Text("${selectModel.price}\$"),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 5.0),
            child: Text(selectModel.description),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          cartData.cartModel= CartModel(itemName: selectModel.title,
              price: selectModel.price,quantity:1,imageUrl:selectModel.imageUrl);

          Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen()));
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
