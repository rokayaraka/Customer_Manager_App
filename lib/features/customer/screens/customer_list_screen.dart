import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/auth/providers/auth_controller.dart';
import 'package:flutter_assignment/features/auth/providers/login_providers.dart';
import 'package:flutter_assignment/features/auth/screens/login_screen.dart';
import 'package:flutter_assignment/features/customer/data/model/customer_model.dart';
import 'package:flutter_assignment/features/customer/providers/customer_list_provider.dart';
import 'package:flutter_assignment/features/customer/screens/customer_details_screen.dart';
import 'package:flutter_assignment/features/customer/widgets/build_error_view.dart';
import 'package:flutter_assignment/features/customer/widgets/build_pagination.dart';
import 'package:flutter_assignment/features/customer/widgets/customer_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CustomerListProvider>().getCustomerList(page: 1);
    });
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _refreshCustomerList() async {
    await context.read<CustomerListProvider>().refreshCustomerList();
    if (!mounted) return;
    Fluttertoast.showToast(msg: 'Page refreshed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Customer List',
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
        actions: [
          IconButton(
            onPressed: _logOut,
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent.shade400,
      ),
      body: Consumer<CustomerListProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.customerList.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.erroeMsg != null && provider.customerList.isEmpty) {
            return BuildErrorView(
              provider: provider,
              onRetry: () {
                provider.getCustomerList(page: provider.currentPage);
              },
            );
          }
          if (provider.customerList.isEmpty) {
            return RefreshIndicator(
              onRefresh: _refreshCustomerList,
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 250),
                  Center(
                    child: Text(
                      'No Customer Found',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Container(
                width: .infinity,
                padding: .symmetric(horizontal: 16, vertical: 12),
                color: Colors.deepPurple.shade50,
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'Total: ${provider.totalRecord}',
                      style: TextStyle(fontWeight: .w600),
                    ),

                    Text(
                      'page ${provider.currentPage} '
                      'of ${provider.totalPage}',
                      style: TextStyle(
                        fontWeight: .w600,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refreshCustomerList,
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: .all(8),
                    itemCount: provider.customerList.length,
                    itemBuilder: (context, index) {
                      final CustomerModel customer =
                          provider.customerList[index];
                      return CustomerCard(
                        customerModel: customer,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CustomerDetailsScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),

              BuildPagination(provider: provider),
            ],
          );
        },
      ),
    );
  }

  Future<void> _logOut() async {
    await AuthController().clearAuthData();
    if (!mounted) return;
    context.read<LoginProviders>().reset();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }
}
