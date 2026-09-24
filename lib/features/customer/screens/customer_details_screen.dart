import 'package:flutter/material.dart';

class CustomerDetailsScreen extends StatefulWidget {
  const CustomerDetailsScreen({super.key});

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Details",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4-zYvL5zbZabbf_azNCPeDzMZjo9DBFiaKx6wZS1T0w&s=10"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}