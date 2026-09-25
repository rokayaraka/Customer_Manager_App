class Urls {
  static const String baseLink =
      'https://www.hisabplus.com/Values/';

  static const String imageBaseLink =
      'https://www.hisabplus.com/';

  static const String loginUrl = '${baseLink}LogIn';

  static const String customerListUrl =
      '${baseLink}GetCustomerList';

  static const String username =
      'admin@gmail.com';

  static const String password =
      'admin1234';

  static const int companyId = 1;

  static const int pageSize = 20;

  static const String customerSortBy='Balance';

  static String customerList(int page){
    return '${customerListUrl}'
    '?searchquery='
    '&pageNo=$page'
    '&pageSize=$pageSize'
    '&sortyBy=$customerSortBy';
  }
}
