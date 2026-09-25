import 'package:flutter_assignment/core/service/network/network_caller.dart';
import 'package:flutter_assignment/features/auth/providers/auth_controller.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(headers: () {
   return{
     'Content-Type':'application/json',
    'Authorization': 'Bearer ${AuthController.token??''}',
   };
  }, onUnauthorized: () {
    AuthController().clearAuthData();
  });
}
