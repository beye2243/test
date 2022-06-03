// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/data/models/pretstion_de_service.dart';
import 'package:test/presentation/screens/personneDetail_Screen.dart';

import '../../constnats/my_colors.dart';
import '../../constnats/strings.dart';
import '../../data/models/catagorie.dart';
import '../../data/repository/catagorie_repository.dart';

class PersonneScreen extends StatefulWidget {
  final doc;
  final Category categorie;
  const PersonneScreen({Key? key , required this.categorie, this.doc,}) : super(key: key);

  @override
  _PersonneScreenState createState() => _PersonneScreenState(categorie);
}

class _PersonneScreenState extends State<PersonneScreen> {
 late  Category categorie;
  final db=FirebaseFirestore.instance;




  _PersonneScreenState(this.categorie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child:
          RichText(
            text: TextSpan(
              text: 'Liste de persone de ',
              style: const TextStyle(color: Colors.white, fontSize: 18, height: 1.4),
              children: <TextSpan>[
                TextSpan(
                  text: '${categorie.name}',
                  style: const TextStyle(color: Colors.black38),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: MyColors.myYellow,
      ),
      body: new StreamBuilder<QuerySnapshot>(
        stream: db.collection("categories").doc(categorie.id).collection("prestation_service").snapshots(),
        builder: (context,snapshot) {
          if(snapshot.hasData){
            var  doc = snapshot.data?.docs;
            return Container(
              color: Colors.white,
              child: new ListView.builder(
                itemCount: doc?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,  index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Container(
                      color: Colors.grey[300],
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 55.0,
                                height: 55.0,
                                child:  CircleAvatar(
                                  //backgroundColor: Colors.green,
                                  //foregroundColor: Colors.green,
                                  backgroundImage: NetworkImage(
                                    doc?[index]['image']
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                               doc?[index]['nom'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(
                                    doc?[index]['type_service']
                                    ,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],

                              ),

                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child: FlatButton(
                              onPressed: (){

                                 Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                 builder:(context)=>
                                PersonneDetailScreen(id: doc?[index].id,categorie: categorie)
                                 )
                                 );

                              },
                              color: Colors.teal[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text("Information",style: TextStyle(color: Colors.white)),
                            ),
                          ),

                        ],
                      ),

                    ),

                  ),
                ),


              ),

            );

          }
          return Container();
        },
        // child: Container(
        //   color: MyColors.myGrey,
        //   child:
        // ),
      ),
    );

  }
}
