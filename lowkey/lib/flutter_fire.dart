import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class flutter_fire {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference businesses =
      FirebaseFirestore.instance.collection('Businesses');

  Future<void> uploadString() async {
    String infoToUpload = "ping";
    try {} catch (e) {
      print("error uploading");
    }
  }

  Future<void> updateBusiness(String docName) {
    return businesses
        .doc(docName)
        .update({'Name': 'this is a name'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
