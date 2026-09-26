import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/features/customer/data/model/customer_model.dart';

class CustomerDetailsScreenProvider extends ChangeNotifier {
  CustomerModel? _customer;
  CustomerModel? get customer=>_customer;

  void setCustomer(CustomerModel customer){
    _customer=customer;
    notifyListeners();
  }

  void clearCustomer(){
    _customer=null;
    notifyListeners();
  }
}