import 'package:eccomerce/presentation/features/model/cart_model.dart';
import 'package:mobx/mobx.dart';

part 'cart_controler.g.dart';

class CartController = CartData with _$CartController;

abstract class CartData with Store {

  @observable
  CartModel? cartModel;
  @observable
  List<CartModel> listCart = [];

}
