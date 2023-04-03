class UserModel{
  String? uid;
  String? email;
  String? firstName;
  String? lastName;

  UserModel({this.uid,this.email,this.firstName,this.lastName});

  // fetching data from server
  factory UserModel.fromJson(json){
    return UserModel(
      uid: json["uid"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }

  // sending data to server
  Map<String,dynamic> toJson(){
    return {
      "uid":uid,
      "email":email,
      "firstName":firstName,
      "lastName":lastName,
    };
  }

}