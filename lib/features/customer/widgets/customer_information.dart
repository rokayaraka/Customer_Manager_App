import 'package:flutter/material.dart';

class customerInformation extends StatelessWidget {
  const customerInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: .circular(12),
           color: Colors.deepPurple.shade100,
        ),
         height: 150,
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
              Text("Email: Customer1@gmail.com",
              style: TextStyle(
          fontSize: 16,
          fontWeight: .w400,
          color: Colors.black,
        ),
              ),
                Text("Phn no: 01717717171",style: TextStyle(
          fontSize: 16,
          fontWeight: .w400,
          color: Colors.black,
        ),),
              Text("Parmanent Address: palas,narsingdi",style: TextStyle(
          fontSize: 16,
          fontWeight: .w400,
          color: Colors.black,
        ),),
                Text("Secondary Address: Dhaka,dhaka",style: TextStyle(
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
