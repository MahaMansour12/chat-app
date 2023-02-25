class MYUser{
static const String myUser='myUser';
  String? id;
  String FName;
  String LName;
  String email;

  MYUser({ required this.id, required this.FName,required this.LName,  required this.email});

  MYUser.fromJson(Map<String ,dynamic>dataUser):this(
     id:dataUser["id"],
    FName:dataUser["FName"],
    LName:dataUser["LName"],
    email:dataUser["email"],

  );

  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "FName":FName,
      "LName":LName,
      "email":email
    };
  }
}