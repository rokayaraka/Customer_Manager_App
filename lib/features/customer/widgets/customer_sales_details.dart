import 'package:flutter/material.dart';

class customerSalesDetails extends StatelessWidget {
  const customerSalesDetails({
    super.key,
  });

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
                'Total Due : 37390.00',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "Total Sales value: 0.00",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "Total Sales Return Value: 0.00",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "LastSalesDate: 0.00 ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "LastSoldProduct: 0.00 ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "LastInvoiceNo: 0.00 ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Colors.black,
                ),
              ),
              Text(
                "Total Collection: 0.00 ",
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
