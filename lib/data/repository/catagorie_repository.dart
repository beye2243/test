import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/data/models/catagorie.dart';
import 'package:test/data/repository/base_categorie_repository.dart';

import '../models/pretstion_de_service.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection("categories")
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return Category(
              id: doc.id,
              name: doc.get('name'),
              imageUrl: doc.get('imageUrl'),
            );
          }).toList();

    });
  }


}
