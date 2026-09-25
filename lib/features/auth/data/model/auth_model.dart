class AuthModel {
  final String? userName;
  final String? token;
  final int? userId;
  final int? companyId;
  final String? email;
  final String? companyName;
  final String? roleName;

  AuthModel({
    this.userName,
    this.token,
    this.userId,
    this.companyId,
    this.email,
    this.companyName,
    this.roleName,
  });

  factory AuthModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AuthModel(
      userName: json['UserName'],
      token: json['Token'],
      userId: json['UserId'],
      companyId: json['ComId'],
      email: json['Email'],
      companyName: json['CompanyName'],
      roleName: json['RoleName'],
    );
  }
}