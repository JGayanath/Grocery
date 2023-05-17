

class User_Model{
  String email;
  String image;
  String name;
  String uid;

  User_Model(this.email,this.image,this.name,this.uid);

  //--------------- bind user data our model
  User_Model.fronJson(Map<String , dynamic> json)
      : email = json["email"],
        image = json["image"],
        name = json["name"],
        uid = json["userid"];


  Map<String,dynamic> toJson() =>{
   "userid" : uid,
    "email" : email,
    "name" : name,
    "image" : image,
  };

}