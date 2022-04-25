import 'package:eccomerce/presentation/features/controller/cart_controler.dart';
import 'package:eccomerce/presentation/features/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/src/provider.dart';

class CartDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = context.read<CartController>();

    final fetchData = context.read<EcommerceData>();

    return Scaffold(
      body: Observer(
        builder: (_) => ListView.builder(
            itemCount: cartData.listCart.length,
            itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Row(
                          children: [
                            Image.network(
                              cartData.listCart[index].imageUrl!,
                              width: 70,
                              height: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cartData.listCart[index].itemName!),
                                  const SizedBox(
                                    height: 3.0,
                                  ),
                                  Text(
                                    "${cartData.listCart[index].price!}\$",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Observer(
                                        builder: (_) => IconButton(
                                          icon: const Text(
                                            '-',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            fetchData.decrement();
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "${fetchData.value}\$",
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Observer(
                                        builder: (_) => IconButton(
                                          icon: const Text(
                                            '+',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            fetchData.increment();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}
