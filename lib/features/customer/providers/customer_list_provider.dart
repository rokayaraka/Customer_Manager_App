import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/app/get_network_caller.dart';
import 'package:flutter_assignment/core/constants/urls.dart';
import 'package:flutter_assignment/core/service/network/network_caller.dart';
import 'package:flutter_assignment/features/customer/data/model/customer_model.dart';

class CustomerListProvider extends ChangeNotifier {

  bool _isLoading = false;
  bool _isLoadingMore = false;

  bool get isLoading =>_isLoading;
  bool get isLoadingMore=>_isLoadingMore;


  String? _errormsg;
  String? get erroeMsg => _errormsg;



 final List<CustomerModel> _customerList = [];
  List<CustomerModel> get customerList => List.unmodifiable(_customerList);

  int _currentPage = 1;
  int _totalPage = 1;
  int _totalRecord = 1;

  int get currentPage => _currentPage;
  int get totalPage => _totalPage;
  int get totalRecord => _totalRecord;
  bool get hasPreviousPage => _currentPage>1;
  bool get hasNextpage=>_currentPage<_totalPage;


  bool get hasMore => _currentPage < _totalPage;

  Future<void> getCustomerList({
    int page =1
  }) async {
    if(_isLoading) return;
    _isLoading=true;
    _errormsg=null;
   await _fetchCustomers(page: page);
    _isLoading = false;
    notifyListeners();



  }

  Future<void> _fetchCustomers({
    required int page,
  })async{
    final String url = Urls.customerList(page);
    final NetworkResponse response = await getNetworkCaller().getRequest(url);
    if(!response.isSuccess){
      _errormsg=response.errorMessage;
      return;
    }

    final dynamic body=response.body;
    if(body is! Map<String,dynamic>){
      _errormsg="Invalid server response";
      return;
    }

    final List<dynamic>customerData = body['CustomerList']??[];

    for (final item in customerData) {
      if (item is Map<String, dynamic>) {
        _customerList.add(
          CustomerModel.fromJson(item),
        );
      }
    }

    final dynamic pageInfo = body['PageInfo'];
    if(pageInfo is Map<String,dynamic>){
    _currentPage=_toInt(pageInfo['PageNo'])??_currentPage;
    _totalPage = _toInt(pageInfo['PageCount'])??_totalPage;
    _totalRecord =_toInt(pageInfo['TotalRecordCount'])??_totalRecord;
    }
    else{
      _currentPage=page;
    }
    _errormsg=null;

  }

    Future<void>nextPage()async{
      if(!hasNextpage|| _isLoading){
        return;
      }
      await getCustomerList(page: _currentPage+1);
    }

    Future<void> previousPage()async{
      if(!hasPreviousPage|| _isLoading){
        return;
      }
      await getCustomerList(page: _currentPage-1);
    }

  Future<void> refreshCustomerList()async{
    await getCustomerList(
      page: _currentPage,
    );
  }


  int?_toInt(dynamic value){
    if(value==null) return null;
    if(value is int){
      return value;
    }
    return int.tryParse(value.toString());
  }


}
