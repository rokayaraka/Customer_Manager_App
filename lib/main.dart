import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/customer_manager_app.dart';
import 'features/auth/providers/auth_controller.dart';
import 'features/auth/providers/login_providers.dart';
import 'features/customer/providers/customer_list_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AuthController().loadAuthData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LoginProviders(),),
        ChangeNotifierProvider(create: (_)=>CustomerListProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: CustomerManagerApp(),
      ),
    );
  }
}
