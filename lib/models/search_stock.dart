class SearchStock {
  final String medicineName;
  final double unitPrice;
  final int quantity;

  SearchStock({
    required this.medicineName,
    required this.unitPrice,
    required this.quantity,
  });

  // Factory method to create a Stock object from a Map (database result)
  factory SearchStock.fromMap(Map<String, dynamic> map) {
    return SearchStock(
      medicineName: map['medicine_name'],  // Medicine name from medicine table
      unitPrice: map['stock_unit_price'].toDouble(),  // Convert to double
      quantity: map['stock_quantity'],  // Quantity
    );
  }
}
