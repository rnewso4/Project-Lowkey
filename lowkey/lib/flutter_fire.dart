import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class flutter_fire {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadString() async {
    String infoToUpload = "ping";
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/hello-world.text')
          .putString(infoToUpload,
              format: firebase_storage.PutStringFormat.raw);
    } catch (e) {
      print("error uploading");
    }
  }
}
