class CustomerModel {
  final int id;
  final String name;
  final String? email;
  final String? primaryAddress;
  final String? secondaryAddress;
  final String? notes;
  final String? phone;
  final String? custType;
  final String? parentCustomer;
  final String? imagePath;
  final bool isInActive;
  final double totalDue;
  final String? lastSalesDate;
  final String? lastInvoiceNo;
  final String? lastSoldProduct;
  final double totalSalesValue;
  final double totalSalesReturnValue;
  final double totalAmountBack;
  final double totalCollection;
  final String? lastTransactionDate;
  final String? clientCompanyName;

  CustomerModel({
    required this.id,
    required this.name,
    this.email,
    this.primaryAddress,
    this.secondaryAddress,
    this.notes,
    this.phone,
    this.custType,
    this.parentCustomer,
    this.imagePath,
    required this.isInActive,
    required this.totalDue,
    this.lastSalesDate,
    this.lastInvoiceNo,
    this.lastSoldProduct,
    required this.totalSalesValue,
    required this.totalSalesReturnValue,
    required this.totalAmountBack,
    required this.totalCollection,
    this.lastTransactionDate,
    this.clientCompanyName,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['Id'] ?? 0,
      name: json['Name'] ?? '',
      email: json['Email'],
      primaryAddress: json['PrimaryAddress'],
      secondaryAddress: json['SecoundaryAddress'],
      notes: json['Notes'],
      phone: json['Phone'],
      custType: json['CustType'],
      parentCustomer: json['ParentCustomer'],
      imagePath: json['ImagePath'],
      isInActive: json['IsInActive'] ?? false,
      totalDue: (json['TotalDue'] ?? 0).toDouble(),
      lastSalesDate: json['LastSalesDate'],
      lastInvoiceNo: json['LastInvoiceNo'],
      lastSoldProduct: json['LastSoldProduct'],
      totalSalesValue:
          (json['TotalSalesValue'] ?? 0).toDouble(),
      totalSalesReturnValue:
          (json['TotalSalesReturnValue'] ?? 0).toDouble(),
      totalAmountBack:
          (json['TotalAmountBack'] ?? 0).toDouble(),
      totalCollection:
          (json['TotalCollection'] ?? 0).toDouble(),
      lastTransactionDate: json['LastTransactionDate'],
      clientCompanyName: json['ClinetCompanyName'],
    );
  }
}