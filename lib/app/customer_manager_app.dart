import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/auth/providers/auth_controller.dart';
import 'package:flutter_assignment/features/auth/screens/login_screen.dart';
import 'package:flutter_assignment/features/customer/screens/customer_list_screen.dart';

class CustomerManagerApp extends StatefulWidget {
  const CustomerManagerApp({super.key});

  @override
  State<CustomerManagerApp> createState() => _CustomerManagerAppState();
}

class _CustomerManagerAppState extends State<CustomerManagerApp> {

  bool _checking = true;
  bool _loggedIn=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLogin();
  }

  Future<void>_checkLogin()async{
    final bool loggedIn = await AuthController().isLoggedIn();

    if(!mounted){
      return;
      }
      setState(() {
        _loggedIn=loggedIn;
        _checking=false;
      });

    
  }

  void showLoginScreen(){
    setState(() {
      _loggedIn=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(_checking){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if(_loggedIn){
      return const CustomerListScreen(
    
      );
    }
    return const LoginScreen();
  }
}