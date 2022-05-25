import 'package:flutter/material.dart';
import 'package:test/data/models/catagorie.dart';

import '../../data/models/pretstion_de_service.dart';
import '../../data/repository/prestation_repository.dart';

class PersonneDetailScreen extends StatefulWidget {
  final Category categorie;
  const PersonneDetailScreen ({Key? key,required this.categorie}) : super(key: key);

  @override
  State<PersonneDetailScreen > createState() => _PersonneDetailScreenState();
}

class _PersonneDetailScreenState extends State<PersonneDetailScreen > {
   static late Category categorie;
   late final PerstationDeService personne;

  //PrestationRepository personnedetail = PrestationRepository(categorie: categorie);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
              child: Text("hello"),
          ),
        )
    );
  }
}
