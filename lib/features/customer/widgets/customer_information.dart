import 'package:flutter/material.dart';

import '../data/model/customer_model.dart';

class customerInformation extends StatelessWidget {
  const customerInformation({
    super.key, required this.customer,
  });

  final CustomerModel customer;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: .circular(12),
           color: Colors.deepPurple.shade100,
        ),
         height: 250,
         width: .infinity, 
        
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text("Customer Information",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: .bold,
                  color: Colors.deepPurple.shade700,
                ),),
              Text('Email : ${customer.email}',
              style: TextStyle(
          fontSize: 16,
          fontWeight: .w400,
          color: Colors.black,
        ),
              ),
                Text("Phone: ${customer.phone}",style: TextStyle(
          fontSize: 16,
          fontWeight: .w400,
          color: Colors.black,
        ),),
              Text("Primary Address: ${customer.primaryAddress}",style: TextStyle(
          fontSize: 16,
          fontWeight: .w400,
          color: Colors.black,
        ),),
                Text("Secondary Address: ${customer.secondaryAddress}",style: TextStyle(
          fontSize: 16,
          fontWeight: .w400,
          color: Colors.black,
        ),),
          
            ],
          ),
        ),
      ),
    );
  }
}
