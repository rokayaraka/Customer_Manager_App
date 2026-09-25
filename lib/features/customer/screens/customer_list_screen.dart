import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/auth/providers/auth_controller.dart';
import 'package:flutter_assignment/features/auth/providers/login_providers.dart';
import 'package:flutter_assignment/features/auth/screens/login_screen.dart';
import 'package:flutter_assignment/features/customer/screens/customer_details_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final List<String> list = [
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
    "apple",
    "banana",
    "cherry",
  ];
  final List<String> newList = ["apple", "banana", "cherry"];

  final TextEditingController _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setUpPagination();
  }

  void setUpPagination() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        Fluttertoast.showToast(
          msg: "Loading more...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16,
        );
        setState(() {
          list.addAll(newList);
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "search customer",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: .circular(12),
                  borderSide: .none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerDetailsScreen(),
                        ),
                      );
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  list[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: .w900,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                Text('phn no'),
                                Text('Location'),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
