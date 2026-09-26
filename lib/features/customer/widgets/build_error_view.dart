import 'package:flutter/material.dart';

import '../providers/customer_list_provider.dart';


class BuildErrorView extends StatelessWidget {
  const BuildErrorView({super.key, required this.provider, required this.onRetry});

  final CustomerListProvider provider;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 50, color: Colors.red),
            const SizedBox(height: 12),
            Text(
              provider.erroeMsg ?? 'Something went wrong',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: provider.getCustomerList,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}