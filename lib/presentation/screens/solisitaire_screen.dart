
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/data/models/catagorie.dart';
import 'package:test/presentation/screens/Button_widget.dart';

import '../../constnats/strings.dart';
import '../../helpers/showSnackBar.dart';
import '../../helpers/theme_helper.dart';
import '../widgets/header_widget.dart';

class SolisitaireScreen extends StatefulWidget {
  const SolisitaireScreen({Key? key}) : super(key: key);

  @override
  State<SolisitaireScreen> createState() => _SolisitaireScreenState();
}

class _SolisitaireScreenState extends State<SolisitaireScreen> {
  late File _imagefile;
  bool _islog=false;
  final _formKey = GlobalKey<FormState>();
  //final items = ["Electricity","plumber","professor"];
  String? value ;
  String? Nom;
  String? Email;
  String? teleohone;
  String? localisation;
  String? type_service;
  String? url;
  late Category _category = type_service as Category;
  bool checkedValue = false;
  bool checkboxValue = false;

  final ImagePicker? _picker=ImagePicker();

 String _idCategorie(){
   if(_category !=null){
     if(_category.name =="plombier"){
       return _category.id;
     }
     if(_category.name=="sécurité"){
       return _category.id;
     }
     if(_category.name=="professeur"){
       return _category.id;
     }
     if(_category.name=="restaurent"){
       return _category.id;
     }
     if(_category.name=="nettoyage_de_la_maison"){
       return _category.id;
     }
     if(_category.name=="Electricien"){
       return _category.id;
     }

   }
     return "pas id ";

 }

  void _onSubmitFrom() async {
   try {
     final isvalid = _formKey.currentState?.validate();
     FocusScope.of(context).unfocus();
     if (_imagefile == null) {
       await FirebaseFirestore.instance
           .collection("categories")
           .doc(_idCategorie()).collection("prestation_service").doc(
           type_service).set(
           {
             'nom': Nom,
             'email': Email,
             'image': '',
             'localisation': localisation,
             'telephone': teleohone,
             'type_service': type_service
           });
       this.setState(() {
         Navigator.pop(context);
       });
     } else {
       final ref = FirebaseStorage.instance
           .ref()
           .child("utilisateurImage")
           .child(Nom! + ".jpg");
       await ref.putFile(_imagefile);
       url = await ref.getDownloadURL();
       await FirebaseFirestore.instance
           .collection("categories")
           .doc(_idCategorie()).collection("prestation_service").doc(
           type_service).set(
           {
             'nom': Nom,
             'email': Email,
             'image': url,
             'localisation': localisation,
             'telephone': teleohone,
             'type_service': type_service
           });
       this.setState(() {
         Navigator.pop(context);
       });
     }
   }catch(e){

     showNotification(context, " error ");

   }

  }
  Widget bottomsheet(){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget> [
          Text(
            "choiser profile photo",
           style: TextStyle(
             fontSize: 20.0,
           ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: (){
                    imageFromCamera();
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.camera),
                  label: Text("Camera"),
              ),
              FlatButton.icon(
                onPressed: (){
                  imageFromGallery();
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.image),
                label: Text("Gallery"),
              ),
            ],
          )

        ],
      ),
    );
  }
 void imageFromCamera() async {
   XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
  if(image != null){
    setState(() {
      _imagefile=File(image.path);
      _islog=true;
    });
  }
 }

  void imageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        _imagefile=File(image.path);
        _islog=true;

      });
    }
  }

    late final  fileName ="hello";


        @override
  Widget build(BuildContext context) {
   //final fileName = file != null ? basename(file!.path) : 'No fichier selectioner';
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded)
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 80.0,
                                  //backgroundColor: Colors.grey,
                                  backgroundImage: _islog==true ?

                                      FileImage(_imagefile):null,

                                    // Image.file(_imagefile.path):
                                    // AssetImage("assets/images/logo.jpg")
                                )
                              ),
                              Positioned(
                                bottom: 20.0,
                                right: 20.0,
                                child: IconButton(
                                  padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                  onPressed: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder:( (builder)=>bottomsheet()),
                                    );
                                  },

                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.grey.shade700,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Nom', 'Entrez votre nom '),
                            validator: (value)=>value!.isEmpty? 'Entre votre nom':null,
                            onChanged: (value)=>Nom=value,

                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20,),

                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(" address E-mail", "Entrez votre Email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                return "entrez un adresse email valider ";
                              }
                              return null;
                            },
                            onChanged: (value)=>Email=value,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Telephone",
                                "Entrez votre numro de telephone"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                return "entrez un numero de telephone email valider";
                              }
                              return null;
                            },
                            onChanged: (value)=>teleohone=value,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('localisation', 'Entrez votre localisation '),
                            validator: (value)=>value!.isEmpty? 'Entre votre localisation':null,
                            onChanged: (value)=>localisation=value,
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('type de service', 'Entrez votre type de service'),
                          validator: (value)=>value!.isEmpty? 'Entre votre type de service':null,
                            onChanged: (value)=>type_service=value,
                          ),
                          //key: type_service,

                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                         child: Column(
                           children: [
                             ElevatedButton.icon(

                                 onPressed: (){
                                   selectFile;
                                  // Fluttertoast.showToast();
                                 },

                                 label: Text('Selectioné votre photo de NNI'),
                               icon: Icon(Icons.web_outlined),
                               style:  ElevatedButton.styleFrom(
                                 minimumSize: const Size(450, 50),
                                 primary: Colors.white,
                                 shape: RoundedRectangleBorder(
                                   side:  BorderSide(
                                       color: Colors.grey
                                   ),
                                   borderRadius: BorderRadius.circular(50),
                                 ),

                               ),

                             ),

                             //Text(pickedfile!.name),
                             SizedBox(height: 8,),
                             if (pickedfile != null)
                              MaterialButton(
                                minWidth: double.infinity,
                                height: 50,
                                onPressed: (){
                                  //Navigator.of(context).pushNamed(solisitaire_Screen);
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black
                                    ),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child:Text(pickedfile!.name,
                                  style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                              ),

                             )

                           ],
                         ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: Column(
                            children: [
                              ElevatedButton.icon(

                                onPressed: (){
                                  selectFile;
                                  // Fluttertoast.showToast();
                                },

                                label: Text('Selectioné votre diplom'),
                                icon: Icon(Icons.attach_file),
                                style:  ElevatedButton.styleFrom(
                                  minimumSize: const Size(450, 50),
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side:  BorderSide(
                                        color: Colors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),

                                ),

                              ),

                              //Text(pickedfile!.name),
                              SizedBox(height: 8,),
                              if (pickedfile != null)
                                MaterialButton(
                                  minWidth: double.infinity,
                                  height: 50,
                                  onPressed: (){
                                    //Navigator.of(context).pushNamed(solisitaire_Screen);
                                  },
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black
                                      ),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child:Text(pickedfile!.name,
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),

                                )

                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              minimumSize: const Size(110, 50),
                              primary: Colors.teal[800],
                              shape: RoundedRectangleBorder(
                                side:  BorderSide(
                                    color: Colors.black
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Ajouter".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                               if (_formKey.currentState!.validate()) {
                                 _onSubmitFrom();
                               }

                              }



                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );




  }
    File? file;
    PlatformFile? pickedfile;
  Future selectFile() async{
   final result = await FilePicker.platform.pickFiles(allowMultiple: false);
   if(result == null) return;
   //final path = result.files.single.path;
   setState(() {
     pickedfile=result.files.first;
   });

  }
}
