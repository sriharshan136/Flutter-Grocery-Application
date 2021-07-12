import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('foods');

  DatabaseService(this.uid);

  Future<void> updateUserData(String email, String password, String name,
      String phone, String address) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'address': address,
    });
  }

  Stream<QuerySnapshot> get userData {
    return userCollection.snapshots();
  }

  Future<void> updateFoodData(String id, String name, String image,
      double price, bool userLiked, int discount) async {
    return await foodCollection.doc(id).set({
      'name': name,
      'image': image,
      'price': price,
      'userLiked': userLiked,
      'discount': discount,
    });
  }

  // Stream<List<FoodProduct>> foodData() {
  //   Stream<QuerySnapshot> stream =
  //       FirebaseFirestore.instance.collection('foods').snapshots();

  //   return stream.map((qShot) => qShot.docs
  //       .map((document) => FoodProduct(
  //             name: document['name'] ?? '',
  //             image: document['image'] ?? '',
  //             price: document['price'] ?? 0.0,
  //             userLiked: document['userLiked'] ?? false,
  //             discount: document['discount'] ?? 0.0,
  //           ))
  //       .toList());
  // }
}
