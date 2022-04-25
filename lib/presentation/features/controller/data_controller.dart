import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'data_controller.g.dart';

class EcommerceData = EcommerceController with _$EcommerceData;

abstract class EcommerceController with Store {
  @observable
  int value = 1;


  @action
  increment() {
    value++;
  }

  @action
  decrement() {
    value--;
  }
}
