class SalesWithCustomerAndUser {
  final int salesCustomerId;
  final String customerName;
  final int salesUserId;
  final String userName;
  final String date;
  final int salesId;
  final String salesInvoiceId;
  final double discount;
  final double price;

  SalesWithCustomerAndUser({
    required this.salesId,
    required this.salesCustomerId,
    required this.customerName,
    required this.salesUserId,
    required this.userName,
    required this.date,
    required this.salesInvoiceId,
    required this.discount,
    required this.price,
  });

  factory SalesWithCustomerAndUser.fromMap(Map<String, dynamic> map) {
    return SalesWithCustomerAndUser(
      salesId: map['sales_id'],
      salesCustomerId: map['sales_customer_id'],
      customerName: map['customer_name'],
      salesUserId: map['sales_user_id'],
      userName: map['user_name'],
      date: map['sales_date'],
      salesInvoiceId: map['sales_invoice_id'],
      discount: map['sales_discount'],
      price: map['sales_price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sales_id': salesId,
      'sales_customer_id': salesCustomerId,
      'customer_name': customerName,
      'sales_user_id': salesUserId,
      'user_name': userName,
      'sales_date': date,
      'sales_invoice_id': salesInvoiceId,
      'sales_discount': discount,
      'sales_price': price,
    };
  }
}
