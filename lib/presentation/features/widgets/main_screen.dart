import 'package:eccomerce/presentation/features/controller/cart_controler.dart';
import 'package:eccomerce/presentation/features/model/cart_model.dart';
import 'package:eccomerce/presentation/features/model/model_data.dart';
import 'package:eccomerce/presentation/features/widgets/cart_bottom_sheet.dart';
import 'package:eccomerce/presentation/features/widgets/cart_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    //List<ModelData>? mealData;
    final cartData = context.read<CartController>();

//    final selectModel = dummyMeal.firstWhere((meal) => meal.id == widget.idItem);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>CartDetails()));
          }, icon: const Icon(Icons.add_shopping_cart)),
        ],
        title: const Center(child: Text('Ecommerce')),
      ),
      body: GridView.builder(
          itemCount: dummyMeal.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                          child: Image.network(
                            dummyMeal[index].imageUrl,
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 20.0,
                          right: 10.0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 5.0,
                            ),
                            color: Colors.black54,
                            width: 300,
                            child: Text(
                              dummyMeal[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                              overflow: TextOverflow.fade,
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "${dummyMeal[index].price.toString()}\$",
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              cartData.cartModel = CartModel(
                                  itemName: dummyMeal[index].title,
                                  price: dummyMeal[index].price,
                                  quantity: 1,
                                  imageUrl: dummyMeal[index].imageUrl);
                              cartBottomSheet(context);
                            },
                            icon: const Icon(Icons.add_shopping_cart))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          )),
    );
  }
}
