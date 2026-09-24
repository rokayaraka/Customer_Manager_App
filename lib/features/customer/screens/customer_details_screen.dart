import 'package:flutter/material.dart';

import '../widgets/customer_information.dart';
import '../widgets/customer_sales_details.dart';

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
        title: Text("Customer Details", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(
              height: 200,
              width: .infinity,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4-zYvL5zbZabbf_azNCPeDzMZjo9DBFiaKx6wZS1T0w&s=10",
              ),
            ),
            Center(
              child: Text(
                "Customer Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: .bold,
                  color: Colors.deepPurple.shade700,
                ),
              ),
            ),
            customerInformation(),
            customerSalesDetails(),
          ],
        ),
      ),
    );
  }
}

