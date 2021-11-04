import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class flutter_fire {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> uploadString() async {
    String infoToUpload = "ping";
    try {} catch (e) {
      print("error uploading");
    }
  }
}
