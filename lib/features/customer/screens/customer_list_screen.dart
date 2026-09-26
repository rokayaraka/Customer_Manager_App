import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../auth/providers/auth_controller.dart';
import '../../auth/providers/login_providers.dart';
import '../../auth/screens/login_screen.dart';
import '../data/model/customer_model.dart';
import '../providers/customer_list_provider.dart';
import '../widgets/build_error_view.dart';
import '../widgets/customer_card.dart';
import 'customer_details_screen.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CustomerListProvider>().getCustomerList(page: 1);
    });
  }

  void _onScroll(){
    
    if(!_scrollController.hasClients)return;
    final provider = context.read<CustomerListProvider>();
    final position= _scrollController.position;
    if(position.pixels>=position.maxScrollExtent-200){
      provider.nextPage();
    }
  }
  @override
  void dispose() {
    _scrollController.dispose();
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
        backgroundColor: AppColors.appBarColor,
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
                controller: _scrollController,
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
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refreshCustomerList,
                  child: ListView.builder(
                    controller: _scrollController,
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
                              builder: (_) => CustomerDetailsScreen(customer: customer,),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
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
