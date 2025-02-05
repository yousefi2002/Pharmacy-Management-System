class PurchaseWithSupplier {
  final int purchaseId;
  final int supplierId;
  final String supplierName;
  final String date;
  final double totalPrice;
  final String createdAt;
  final String updatedAt;

  PurchaseWithSupplier({
    required this.purchaseId,
    required this.supplierId,
    required this.supplierName,
    required this.date,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt
  });

  factory PurchaseWithSupplier.fromMap(Map<String, dynamic> map) {
    return PurchaseWithSupplier(
      purchaseId: map['purchase_id'],
      supplierId: map['purchase_supplier_id'],
      supplierName: map['supplier_name'],
      date: map['purchase_date'],
      totalPrice: map['purchase_total_price'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'purchase_id': purchaseId,
      'purchase_supplier_id': supplierId,
      'supplier_name': supplierName,
      'purchase_date': date,
      'purchase_total_price': totalPrice,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
