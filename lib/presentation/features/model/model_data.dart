class ModelData {
  final String id;
  final String title;
  final int price;
  final String imageUrl;
  final String description;

  ModelData(
      {required this.id,
      required this.title,
        required this.price,
      required this.imageUrl,
      required this.description});
}

List<ModelData> dummyMeal =<ModelData> [

  ModelData(
      id: "c1",
      title: "Spaghetti with Tomato Sauce",
      price: 12,
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg",
      description:
          "Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes"),
  ModelData(
      id: 'c2',
      title: 'Toast Hawaii',
      price: 14,
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
      description: 'Layer ham, the pineapple and cheese on the white bread'),
  ModelData(
      id: 'c3',
      title: 'Classic Hamburger',
      price: 17,
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
      description: 'Fry the patties for c. 4 minutes on each side'),
  ModelData(
      id: 'c4',
      title: 'Wiener Schnitzel',
      price: 19,
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
      description: 'Fry the patties for c. 4 minutes on each side'),
  ModelData(
      id: 'c5',
      title: 'Salad with Smoked Salmon',
      price: 11,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
      description: 'Fry the patties for c. 4 minutes on each side'),
];
