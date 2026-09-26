
import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/customer/providers/customer_list_provider.dart';

class BuildPagination extends StatelessWidget {
  const BuildPagination({super.key, required this.provider});
  final CustomerListProvider provider;
  
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      top: false,
      child: Container(
        padding: .symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(8),
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: provider.isLoading || !provider.hasPreviousPage
                    ? null
                    : ()async{
                      await provider.previousPage();
                      if(!context.mounted)return;
                     // Fluttertoast.showToast(msg: 'Page ${provider.currentPage} Loaded');
                    },
                icon: Icon(Icons.arrow_back, size: 18),
                label: Text('Previous'),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: .symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: .circular(8),
              ),
              child: Text(
                '${provider.currentPage}/'
                '${provider.totalPage}',
                style: TextStyle(fontWeight: .bold, color: Colors.deepPurple),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: provider.isLoading || !provider.hasNextpage
                    ? null
                    :()async{
                      await provider.nextPage();
                      if(!context.mounted)return;
                     // Fluttertoast.showToast(msg: 'Page ${provider.currentPage} Loaded');

                    },
                icon: Icon(Icons.arrow_forward),
                label: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
