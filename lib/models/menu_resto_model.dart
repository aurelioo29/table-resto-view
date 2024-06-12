class MenuRestoModel{
  int? id;
  String? code;
  String? name;
  String? price;
  String? imageMenu;
  String? category;
  String? menuStatus;
//pengaturan // pesan makanan //keranjang
  MenuRestoModel({this.id, this.code, this.name, this.price, this.imageMenu, this.category, this.menuStatus});

  factory MenuRestoModel.fromJson(Map<String, dynamic> json){
    return MenuRestoModel(
        id: json['id'],
        code : json['code'],
        name : json['name'],
        price: json['price'],
        imageMenu: json['image_menu'],
        category: json['category'],
        menuStatus: json['menu_status']
    );
  }
}