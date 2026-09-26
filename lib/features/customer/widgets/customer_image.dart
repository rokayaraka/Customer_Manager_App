import 'package:flutter/material.dart';
import '../../../core/constants/urls.dart';
import '../data/model/customer_model.dart';

class CustomerImage extends StatelessWidget {
  const CustomerImage({super.key, required this.customerModel});
  final CustomerModel customerModel;

  @override
  Widget build(BuildContext context) {
    final String? imagePath = customerModel.imagePath;
    if (imagePath == null || imagePath.isEmpty) {
      return CircleAvatar(
        radius: 30,
        backgroundColor: Colors.deepPurple.shade50,
        child: Icon(Icons.person, size: 30, color: Colors.deepPurple),
      );
    }

    final String imageUrl = '${Urls.imageBaseLink}$imagePath';

    return CircleAvatar(
      radius: 30,
      child: ClipOval(
        child: Image.network(imageUrl,
        width: 60,
        height: 60,
        fit: .cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress==null){
            return child;
          }
          return const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2,),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.person,size: 30,color: Colors.deepPurple,);
        },
        ),
      ),
    
    );
  }
}
