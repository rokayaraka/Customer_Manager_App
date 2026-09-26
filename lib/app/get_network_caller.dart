

import '../core/service/network/network_caller.dart';
import '../features/auth/providers/auth_controller.dart';

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
