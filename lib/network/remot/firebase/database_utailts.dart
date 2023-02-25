import 'package:chat_app/models/userAccount.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DataBaseUtils{
  static CollectionReference<MYUser>  getCollection(){

        return  FirebaseFirestore.instance.collection(MYUser.myUser).withConverter<MYUser>(
            fromFirestore: (snapshot, options) {
              return  MYUser.fromJson(snapshot.data()!);

            },
            toFirestore: (value, options) {
              return value.toJson();
            },);

}
  static Future<void> addUserToDataBase(MYUser user){
  return   getCollection().doc(user.id).set(user);
 }
  static MYUser? getUerFromDataBase(String id){
   DocumentSnapshot<MYUser> user= getCollection().doc(id).get() as DocumentSnapshot<MYUser>;
   return user.data();



 }

}