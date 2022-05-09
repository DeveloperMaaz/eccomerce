import 'package:eccomerce/presentation/features/controller/cart_controler.dart';
import 'package:eccomerce/presentation/features/controller/data_controller.dart';
import 'package:eccomerce/presentation/features/model/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/src/provider.dart';

 void cartBottomSheet(BuildContext context){
  showBottomSheet(context: context,
      builder: (BuildContext context) {
        final cartData = context.read<CartController>();
        final fetchData = context.read<EcommerceData>();

        return SizedBox(
          width: double.infinity,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: Row(
                    children: [
                      Image.network(
                        cartData.cartModel!.imageUrl.toString(),
                        width: 70,
                        height: 50,
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
                      icon: const Text(
                        '-',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        fetchData.decrement();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Observer(
                    builder:(_)=> Text(
                      fetchData.value.toString(),
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Observer(
                    builder: (_) => IconButton(
                      icon: const Text(
                        '+',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        fetchData.increment();
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    cartData.listCart.add(CartModel(
                        itemName: cartData.cartModel!.itemName,
                        price: cartData.cartModel!.price,
                        quantity: cartData.cartModel!.quantity,
                        imageUrl: cartData.cartModel!.imageUrl));
                  },
                  child: const Text(
                    "Add to Cart",
                  )),
            ],
          ),
        );
      });
}