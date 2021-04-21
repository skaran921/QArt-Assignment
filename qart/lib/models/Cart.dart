class Cart {
  final String qrCode;
  final double mrp;
  double totalItems;
  double totalAmt;
  int itemIndex;
  Cart(this.qrCode, this.mrp, this.itemIndex,
      {this.totalItems = 1, this.totalAmt = 0});
}
