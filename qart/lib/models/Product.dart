class Product {
  final String season;
  final String brand;
  final String mood;
  final String gender;
  final String theme;
  final String category;
  final String name;
  final String color;
  final String option;
  final double mrp;
  final String subCategory;
  final String collection;
  final String fit;
  final String description;
  final String qRCode;
  final String looks;
  final String looksImageUrl;
  final String looksImage;
  final String fabric;
  final Map<String, dynamic> ean;
  final List availableSizes;
  final String sizeWiseStock;
  final List offerMonths;
  final String imageUrl;
  final String material;
  final double likeabilty;
  Product(
      this.season,
      this.brand,
      this.mood,
      this.gender,
      this.theme,
      this.category,
      this.name,
      this.color,
      this.option,
      this.mrp,
      this.subCategory,
      this.collection,
      this.fit,
      this.description,
      this.qRCode,
      this.looks,
      this.looksImageUrl,
      this.looksImage,
      this.fabric,
      this.ean,
      this.availableSizes,
      this.sizeWiseStock,
      this.offerMonths,
      this.imageUrl,
      this.material,
      this.likeabilty);

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
        jsonData["Season"] ?? "",
        jsonData["Brand"] ?? "",
        jsonData["Mood"] ?? "",
        jsonData["Gender"] ?? "",
        jsonData["Theme"] ?? "",
        jsonData["Category"] ?? "",
        jsonData["Name"] ?? "",
        jsonData["Color"] ?? "",
        jsonData["Option"] ?? "",
        jsonData["MRP"] ?? 0.0,
        jsonData["SubCategory"] ?? "",
        jsonData["Collection"] ?? "",
        jsonData["Fit"] ?? "",
        jsonData["Description"] ?? "",
        jsonData["QRCode"] ?? "",
        jsonData["Looks"] ?? "",
        jsonData["LooksImageUrl"] ?? "",
        jsonData["LooksImage"] ?? "",
        jsonData["Fabric"] ?? "",
        jsonData["Ean"] ?? {},
        jsonData["AvailableSizes"] ?? [],
        jsonData["SizeWiseStock"] ?? "",
        jsonData["OfferMonths"] ?? [],
        jsonData["ImageUrl"] ?? "",
        jsonData["Material"] ?? "",
        jsonData["Likeabilty"] ?? 0.0);
  }
}
