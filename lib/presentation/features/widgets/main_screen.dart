import 'package:eccomerce/presentation/features/model/model_data.dart';
import 'package:eccomerce/presentation/features/widgets/items_detail.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    //List<ModelData>? mealData;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Ecommerce')),
      ),
      body: GridView.builder(
          itemCount: dummyMeal.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ItemDetails(dummyMeal[index].id)));
              },
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
                     // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text("${dummyMeal[index].price.toString()}\$",style: const TextStyle(fontSize: 20.0),),
                        ),
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
