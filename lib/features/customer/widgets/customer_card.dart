import 'package:flutter/material.dart';

import '../data/model/customer_model.dart';
import 'customer_image.dart';


class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key, required this.customerModel, required this.onTap});
  final CustomerModel customerModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: .circular(8),
      child: Card(
        child: Row(
          children: [
            Padding(padding: .all(8),
            child: CustomerImage(customerModel: customerModel),
            ),
            Expanded(child: Padding(padding: .all(8),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(customerModel.name,
                maxLines: 1,
                overflow: .ellipsis,
                style: TextStyle(fontSize: 16,
                fontWeight: .w900,
                color: Colors.deepPurple,
                ),
                ),
                const SizedBox(height: 4,),
                Text(customerModel.primaryAddress??'No Location',
                maxLines: 1,
                overflow: .ellipsis,
                ),
                 const SizedBox(height: 4,),
                 Text('Total Due : ${customerModel.totalDue.toStringAsFixed(2)}',
                 style: TextStyle(
                  fontWeight: .w600,
                  color: customerModel.totalDue>0 ?Colors.red :Colors.green,
                 ),
                 ),
              ],
            ),
            )),

            const Icon(Icons.arrow_forward_ios_outlined,size: 18,),
            const SizedBox(width: 10,),
          ],
        ),
      ),

    );
  }

  
}