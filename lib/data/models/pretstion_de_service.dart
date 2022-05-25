import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PerstationDeService  extends Equatable{
  final String id;
  final String nom;
  final String email;
  final String image;
  final String type_service;
  final String telephone;
  final String localisation;

  const PerstationDeService({required this.id,required this.nom,required this.email,required this.image,
    required this.type_service,required this.telephone,required this.localisation});

  @override

  List<Object?> get props => [
    id,
    nom,
    email,
    image,
    type_service,
    telephone,
    localisation,
  ];

  // static PerstationDeService fromSnapshot(DocumentSnapshot snap) {
  //   PerstationDeService perstation = PerstationDeService(
  //     nom: snap['nom'],
  //     email: snap['email'],
  //     image: snap['image'],
  //     type_service: snap['type_service'],
  //     telephone: snap['telephone'],
  //     localisation: snap['localisation'],
  //
  //   );
  //   return perstation;
  // }
}
