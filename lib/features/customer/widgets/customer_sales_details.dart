import 'package:flutter/material.dart';

import '../data/model/customer_model.dart';


class customerSalesDetails extends StatelessWidget {
  const customerSalesDetails({
    super.key, required this.customer,
  });

  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: .infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade50,
          borderRadius: .circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
             spacing: 4,
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Sales details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: .bold,
                  color: Colors.deepPurple.shade700,
                ),
              ),
              Text(
                'Total Due : ${customer.totalDue}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "Total Sales value: ${customer.totalSalesValue}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "Total Sales Return Value: ${customer.totalSalesReturnValue}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "LastSalesDate: ${customer.lastSalesDate} ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "LastSoldProduct: ${customer.lastSoldProduct} ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "LastInvoiceNo: ${customer.lastInvoiceNo} ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "Total Collection: ${customer.totalCollection} ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
