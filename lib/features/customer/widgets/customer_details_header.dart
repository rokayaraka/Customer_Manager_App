import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/urls.dart';
import 'package:flutter_assignment/features/customer/data/model/customer_model.dart';

class CustomerDetailsHeader extends StatelessWidget {
  const CustomerDetailsHeader({super.key, required this.customer});

  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {

    final String? imagePath = customer.imagePath;

    return Column(
      children: [
        Container(
          width: .infinity,
          height: 200,
          color: Colors.deepPurple.shade50,
          child: imagePath!=null && imagePath.isNotEmpty
          ?Image.network('${Urls.imageBaseLink}$imagePath',
          fit: .cover,
          errorBuilder: (context, error, stackTrace) {
            return CircleAvatar();
          },
          )
          :CircleAvatar(),
          
        ),
        const SizedBox(height: 12,),
        Text(customer.name,
        textAlign: .center,
        style: TextStyle(
          fontSize: 14,
          fontWeight: .bold,
          color: Colors.deepPurple.shade700,
        ),
        ),
        const SizedBox(height: 4,),
      ],
    );
  }
}