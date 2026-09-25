class LoginParams {
  final String email;
  final String password;
  final int companyId;

  LoginParams({
    required this.email,
    required this.password,
    required this.companyId,
  });

  Map<String,String>toQueryParameters(){
    return{
      'UserName':email,
      'Password':password,
      'ComId':companyId.toString(),
    };
  }
}
