import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/data/models/catagorie.dart';

import '../../constnats/my_colors.dart';
import '../../data/models/pretstion_de_service.dart';
import '../../data/repository/prestation_repository.dart';

class PersonneDetailScreen extends StatefulWidget {
  //final Category categorie;
   final String? id;
   late final  Category categorie;
  PersonneDetailScreen ( {Key? key,required this.categorie,this.id}) : super(key: key);

  @override
  State<PersonneDetailScreen > createState() => _PersonneDetailScreenState();
}

class _PersonneDetailScreenState extends State<PersonneDetailScreen > {
      Category? categorie;
   // late final PerstationDeService personne;
   final db=FirebaseFirestore.instance;

  //PrestationRepository personnedetail = PrestationRepository(categorie: categorie);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myGrey,
        body:new StreamBuilder<DocumentSnapshot>(
          stream: db.collection("categories").doc(categorie?.id).collection("prestation_service").doc(widget.id).snapshots(),
          builder:(context,snapshot){
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            if(snapshot.hasData){
              var  doc = snapshot.data;
              return new ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context,   index) {
                  //List item=doc  as List;
                  return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          expandedHeight: 600,
                          pinned: true,
                          stretch: true,
                          backgroundColor: MyColors.myGrey,
                          flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                            title: Text(
                              doc![index]["nom"],
                              // character.nickName,
                              // doc?[index]["nom"],

                              style: TextStyle(color: MyColors.myWhite),
                            ),
                            background: Image.network(
                              // character.image,
                              doc[index]["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        )

                      ]
                  );
                }

              );
            }
            return Container();
          }

        )
    );
  }
}
