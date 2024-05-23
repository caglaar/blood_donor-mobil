import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood_donor/models/users_models/user_model.dart';

Future<void> updateUserData(UserModel user) async {
  try {
    // Firestore referansını alın
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    
    QuerySnapshot querySnapshot = await firestore.collection('users').where("userId", isEqualTo: user.userId).limit(1).get();

    // Belge varsa güncelleme işlemini gerçekleştirin
    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userSnapshot = querySnapshot.docs.first;

      // Belge referansının alınması
      DocumentReference userRef = firestore.collection('users').doc(userSnapshot.id);

      // Belge güncelleme işlemi
      await userRef.update({
        'birthDate': user.birthDate,
        'gender': user.gender,
        'mail': user.mail,
        'name': user.name,
        'password': user.password,
        'phoneNumber': user.phoneNumber,
        'surname': user.surname,
      });
      print('Belge başarıyla güncellendi.');
    } else {
      print('Güncellenmek istenen personel bulunamadı.');
    }
  } catch (e) {
    print('Personel bilgilerini güncelleme sırasında hata oluştu: $e');
    // Hata durumunda istenilen işlemler yapılabilir, örneğin kullanıcıya bildirim gösterilebilir.
  }
}
