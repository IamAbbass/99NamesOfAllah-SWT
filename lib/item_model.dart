class Item {
  final int id;
  final String nameAr;
  final String nameEn;
  final String meaning;

  Item({required this.id, required this.nameAr, required this.nameEn, required this.meaning});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] ?? 0,
      nameAr: json['name_ar'] ?? "",
      nameEn: json['name_en'] ?? "",
      meaning: json['meaning'] ?? "",
    );
  }
}
