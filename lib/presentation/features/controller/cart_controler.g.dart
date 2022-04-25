// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controler.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on CartData, Store {
  final _$cartModelAtom = Atom(name: 'CartData.cartModel');

  @override
  CartModel? get cartModel {
    _$cartModelAtom.reportRead();
    return super.cartModel;
  }

  @override
  set cartModel(CartModel? value) {
    _$cartModelAtom.reportWrite(value, super.cartModel, () {
      super.cartModel = value;
    });
  }

  final _$listCartAtom = Atom(name: 'CartData.listCart');

  @override
  List<CartModel> get listCart {
    _$listCartAtom.reportRead();
    return super.listCart;
  }

  @override
  set listCart(List<CartModel> value) {
    _$listCartAtom.reportWrite(value, super.listCart, () {
      super.listCart = value;
    });
  }

  @override
  String toString() {
    return '''
cartModel: ${cartModel},
listCart: ${listCart}
    ''';
  }
}
