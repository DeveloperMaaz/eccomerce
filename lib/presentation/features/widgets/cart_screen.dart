import 'package:eccomerce/presentation/features/controller/cart_controler.dart';
import 'package:eccomerce/presentation/features/controller/data_controller.dart';
import 'package:eccomerce/presentation/features/model/cart_model.dart';
import 'package:eccomerce/presentation/features/model/model_data.dart';
import 'package:eccomerce/presentation/features/widgets/cart_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/src/provider.dart';

class CartScreen extends StatefulWidget {


  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
   // final selectModel = dummyMeal.firstWhere((meal) => meal.id == widget.idItem);

    final cartData= context.read<CartController>();

    final fetchData = context.read<EcommerceData>();

   // final selectCart = dummyMeal.firstWhere((meal) => meal.id );
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Cart'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartDetails()));
            },
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                height: 140,
                child: Row(
                  children: [
                    Image.network(
                      cartData.cartModel!.imageUrl.toString(),
                      width: 70,
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartData.cartModel!.itemName.toString()),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            "${cartData.cartModel!.price}\$",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) => IconButton(
                    icon: const Text('-',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    onPressed: () {
                      fetchData.decrement();
                    },
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(fetchData.value.toString(),style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                Observer(
                  builder: (_) => IconButton(
                    icon: const Text('+',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    onPressed: () {
                      fetchData.increment();
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(onPressed: () {
              cartData.listCart.add(CartModel(itemName: cartData.cartModel!.itemName,
                  price: cartData.cartModel!.price,
                  quantity:cartData.cartModel!.quantity,imageUrl: cartData.cartModel!.imageUrl

              ));

            }, child: const Text("Add to Cart",)),
          ],
        ),
      ),
    );
  }
}
