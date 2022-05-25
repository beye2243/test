

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/data/models/catagorie.dart';

import '../models/pretstion_de_service.dart';
import 'base_prestation_repository.dart';

class PrestationRepository extends BasePrestationRepository {
  final Category categorie;
  final PerstationDeService perstationDeService;
  final FirebaseFirestore _firebaseFirestore;

  PrestationRepository({FirebaseFirestore? firebaseFirestore , required this.categorie,required this.perstationDeService})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;



  @override
  Stream<List<PerstationDeService>> getAllPersonnes() {
    return _firebaseFirestore
        .collection("categories")
        .doc(categorie.id)
        .collection("prestation_service")
        //.doc(perstationDeService.id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return PerstationDeService(
          id: doc.id,
          nom: doc.get('nom'),
          email: doc.get('email'),
          telephone: doc.get('telephone'),
          image: doc.get('image'),
          type_service: doc.get('type_service'),
          localisation: doc.get('localisation'),

        );
      }).toList();

    });
  }
}
