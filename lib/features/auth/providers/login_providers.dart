import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/app/get_network_caller.dart';
import 'package:flutter_assignment/core/constants/urls.dart';
import 'package:flutter_assignment/core/service/network/network_caller.dart';
import 'package:flutter_assignment/features/auth/data/model/auth_model.dart';
import 'package:flutter_assignment/features/auth/data/model/login_params.dart';
import 'package:flutter_assignment/features/auth/providers/auth_controller.dart';

class LoginProviders extends ChangeNotifier {
  bool _loginInProgress = false;
  bool get loginInProgress => _loginInProgress;
  String? _errorMsg;
  String? get errorMsg => _errorMsg;
  AuthModel? _authModel;
  AuthModel? get authModel => _authModel;

  void reset(){
    _loginInProgress=false;
    _errorMsg=null;
    _authModel=null;

    notifyListeners();
  }

  Future<bool> login(LoginParams params) async {
    bool isSuccess = false;
    _loginInProgress = true;
    _errorMsg = null;
    notifyListeners();

    final String url =
        '${Urls.loginUrl}'
        '?UserName=${Uri.encodeQueryComponent(params.email)}'
        '&Password=${Uri.encodeQueryComponent(params.password)}'
        '&ComId=${params.companyId}';

    final NetworkResponse response = await getNetworkCaller().getRequest(url);
    if (response.isSuccess) {
      isSuccess = true;
      _errorMsg = null;
      _authModel = AuthModel.fromJson(response.body);
      await AuthController().saveAuthData(
        token: _authModel!.token ?? '',
        userName: _authModel!.userName??'',
        email: _authModel!.email??'',
        companyId: int.tryParse(_authModel!.companyId?.toString() ?? '') ?? 0,
      );
    }
    else{
      _errorMsg=response.errorMessage;
    }
    _loginInProgress=false;
    notifyListeners();
    return isSuccess;
  }
}
