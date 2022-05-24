import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String imageUrl;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  // @override
  // List<Object?> get props => [
  //       id,
  //       name,
  //       imageUrl,
  //     ];
  // static Category fromSnapshot(DocumentSnapshot snap) {
  //   Category category = Category(
  //     id: snap['id'],
  //     name: snap['name'],
  //     imageUrl: snap['imageUrl'],
  //   );
  //   return category;
  // }
}
