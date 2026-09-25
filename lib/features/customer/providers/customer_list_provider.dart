import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/app/get_network_caller.dart';
import 'package:flutter_assignment/core/constants/urls.dart';
import 'package:flutter_assignment/core/service/network/network_caller.dart';
import 'package:flutter_assignment/features/customer/data/model/customer_model.dart';

class CustomerListProvider extends ChangeNotifier {
  bool _customerListInProgress = false;
  String? _errormsg;
  bool _loadMoreInprogress = false;

  bool get customerListInProgress => _customerListInProgress;
  String? get erroeMsg => _errormsg;
  bool get loadMoreInProgress => _loadMoreInprogress;

  List<CustomerModel> _customerList = [];
  List<CustomerModel> get customerList => _customerList;

  int _currentPage = 1;
  int _totalPage = 1;
  int _totalRecord = 1;

  int get currentPage => _currentPage;
  int get totalPage => _totalPage;
  int get totalRecord => _totalRecord;

  bool get hasMore => _currentPage < _totalPage;

  Future<bool> getCustomerList() async {
    bool isSuccess = false;
    _customerListInProgress = true;
    _errormsg = null;
    _currentPage = 1;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.customerList(1)
    );

    if(response.isSuccess){
      _customerList.clear();

      final List<dynamic>customerData= response.body['CustomerList']??[];

      for(final item in customerData){
        _customerList.add(CustomerModel.fromJson(item as Map<String,dynamic>));

      }
       _updatePageInfo(response.body['PageInfo']);
       _customerListInProgress=false;
       notifyListeners();
       return true;
       
    }

    _errormsg = response.errorMessage;
    _customerListInProgress=false;
    notifyListeners();
    return false;
  }

  Future<void> loadMoreCustomer () async{
    if(_loadMoreInprogress|| hasMore){
      return;
    }
    _loadMoreInprogress=true;
    notifyListeners();
    final int nextPage = _currentPage+1;
    final NetworkResponse response = await getNetworkCaller().getRequest(Urls.customerList(nextPage));
    if(response.isSuccess){
      final List<dynamic>customerData =response.body['CustomerList']??[];

      for(final item in customerData){
        _customerList.add(CustomerModel.fromJson(item as Map<String,dynamic>));

      }
      _updatePageInfo(response.body['PageInfo']);
      _errormsg=null;

    }
    else{
      _errormsg=response.errorMessage;
    }
    _loadMoreInprogress=false;
    notifyListeners();
  }

  Future<void> refreshCustomerList()async{
    await getCustomerList();
  }


  void _updatePageInfo(dynamic pageInfo) {
    if(pageInfo==null){
      return;
    }
    _currentPage=pageInfo['PageNo']??_currentPage;
    _totalPage = pageInfo['PageCount']??_totalPage;
    _totalRecord =pageInfo['TotalRecordCount']??_totalRecord;

  }

  
}
