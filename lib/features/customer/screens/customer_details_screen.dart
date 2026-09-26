import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_colors.dart';
import '../data/model/customer_model.dart';
import '../widgets/customer_details_header.dart';
import '../widgets/customer_information.dart';
import '../widgets/customer_sales_details.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key, required this.customer});
   final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Details", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CustomerDetailsHeader(customer: customer),
            customerInformation(customer: customer,),
            customerSalesDetails(customer: customer,),
          ],
        ),
      ),
    );
  }
}

