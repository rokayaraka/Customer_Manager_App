import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/urls.dart';

import '../data/model/customer_model.dart';

class CustomerImage extends StatelessWidget {
  const CustomerImage({super.key, required this.customerModel});
    final CustomerModel customerModel;

  @override
  Widget build(BuildContext context) {
    if(customerModel.imagePath==null || customerModel.imagePath!.isEmpty){
      return CircleAvatar(
        radius: 30,
        backgroundColor: Colors.deepPurple.shade50,
        child: Icon(Icons.person,
        size: 30,
        color: Colors.deepPurple,
        ),
      );
    }

    return CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage('${Urls.imageBaseLink}${customerModel.imagePath}',
      
      ),
      onBackgroundImageError: (_,_){},
    );
  }
}