import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/users_models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserAuthService
{
  final firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<bool> signUp (UserModel user) async
  {
    try {
      final UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: user.mail, password: user.password);
      if (userCredential.user != null)
      {
        user.userId = userCredential.user!.uid;
          await _firestore.collection('users').add({
        'gender': user.gender,
        'name': user.name,
        'birthDate': user.birthDate,
        'mail': user.mail,
        'surname': user.surname,
        'password': user.password,
        'phoneNumber': user.phoneNumber,
        'userId': user.userId
      });
        return (true);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
    }
    return (false);
  }

  Future <bool> signIn (UserModel user) async
  {
    try {
     
      final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: user.mail, password: user.password);
      
      if (userCredential.user != null)
      {
        user.userId = userCredential.user!.uid;
        QuerySnapshot query = await _firestore.collection('users').where('userId',isEqualTo: user.userId).limit(1).get();
        var userDoc = query.docs.first;
        var userData = userDoc.data()  as Map<String, dynamic>;
        
        user.name = userData['name'] ?? "";
        user.surname = userData['surname'] ?? "";
        user.phoneNumber = userData['phoneNumber'] ?? "";
        user.userId = userData['userId'] ?? "";
        user.birthDate = userData['birthDate'] ?? "";
        user.gender = userData['gender'] ?? "";
        return (true);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
    }
    return (false);
  }
}