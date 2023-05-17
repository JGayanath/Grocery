class Product_Model {
  String id;
  String productName;
  String productDesc;
  String price;
  String image;

  Product_Model(
      {required this.id,
      required this.productName,
      required this.productDesc,
      required this.price,
      required this.image});

  //--------------- bind user data our model
  Product_Model.fronJson(Map<String, dynamic> json)
      : id = json["id"],
        productName = json["productName"],
        productDesc = json["productDesc"],
        price = json["price"],
        image = json["image"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "productDesc": productDesc,
        "price": price,
        "image": image,
      };
}
