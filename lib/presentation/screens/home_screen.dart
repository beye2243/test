// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:test/constnats/strings.dart';
import 'package:test/presentation/screens/animaterRouter.dart';
import 'package:test/presentation/screens/prestation_Screen.dart';
import 'package:test/presentation/screens/solisitaire_screen.dart';

import '../../business_logic/cubit/categorie/categories_cubit.dart';
import '../../data/repository/catagorie_repository.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen> {

  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: SafeArea(
        child:


            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(

                      children: <Widget>[
                        Text("Bienvenue",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        ),
                        SizedBox(height: 20,),
                        Text("Vos demandes sont concernées et nous cherchons à nous rencontrer",style:
                        TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                        ),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/serv.png"),
                            fit:BoxFit.contain,
                          )
                      ),

                    ),
                    Column(
                      children: <Widget>[
                        // MaterialButton(
                        //   minWidth: double.infinity,
                        //   height: 60,
                        //   onPressed: (){
                        //     Navigator.of(context).pushNamed(solisitaire_Screen);
                        //   },
                        //   shape: RoundedRectangleBorder(
                        //       side: BorderSide(
                        //           color: Colors.black
                        //       ),
                        //       borderRadius: BorderRadius.circular(50)
                        //   ),
                        //   child: Text("solisitaire de service",
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.w600,
                        //       fontSize: 18
                        //     ),
                        //
                        //   ),
                        // ),
                        SizedBox(height: 20,),
                        ElevatedButton.icon(

                          onPressed: () {
                          // await phoneAuthCubit.logOut();
                          Navigator.of(context).pushNamed(prestation_Screen);

                          },
                          label: const Text(
                          'perstation de service',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                          minimumSize: const Size(450, 60),
                          primary: Colors.white,

                          shape: RoundedRectangleBorder(
                            side:  BorderSide(
                                        color: Colors.black
                                   ),

                          borderRadius: BorderRadius.circular(50),
                          ),

                          ),
                          icon:Icon(Icons.people_sharp,color: Colors.black,) ,
                             ),
                    SizedBox(height: 20,),
                        ElevatedButton.icon(

                        onPressed: () {
                        // await phoneAuthCubit.logOut();
                         Navigator.of(context).push(SlideRight(page: SolisitaireScreen()));

                        },
                          label: const Text(
                         'solisitaire de service',
                         style: TextStyle(color: Colors.white, fontSize: 16),
                         ),
                          icon:Icon(Icons.work,color: Colors.white,) ,
                      style: ElevatedButton.styleFrom(
                      minimumSize: const Size(450, 60),
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                        side:  BorderSide(
                            color: Colors.black
                        ),
                      borderRadius: BorderRadius.circular(50),
                      ),

                        ),
                        ),
                      ],

                    )

                  ],
                ),

            ),






)
    );

  }
}


//
// Stack(
// children: [
//
// Container(
// width: double.infinity,
// height: double.infinity,
//
//
// decoration:  BoxDecoration(
//
// image: DecorationImage(
// colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
//
// image: AssetImage("assets/images/service2.jpg"),
// fit: BoxFit.cover
//
// ),
//
// ),
//
// child:  Padding(
// padding: const EdgeInsets.only(top: 600),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
//
// Container(
//
// child: BlocProvider<CategoryCubit>(
// create: (context) => CategoryCubit(CategoryRepository()),
//
// child: ElevatedButton(
//
// onPressed: () {
// // await phoneAuthCubit.logOut();
// Navigator.of(context).push(SlideRight(page: SolisitaireScreen()));
//
// },
// child: const Text(
// 'solisitaire de service',
// style: TextStyle(color: Colors.white, fontSize: 16),
// ),
// style: ElevatedButton.styleFrom(
// minimumSize: const Size(110, 50),
// primary: Colors.grey[600],
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20),
// ),
//
// ),
// ),
// ),
//
// ),
// //Icon(Icons.work),
// SizedBox(width: 10,),
// Center(
//
// child: BlocProvider<CategoryCubit>(
// create: (context) => CategoryCubit(CategoryRepository()),
//
// child: ElevatedButton(
//
// onPressed: () {
// // await phoneAuthCubit.logOut();
// Navigator.of(context).pushNamed(prestation_Screen);
//
// },
// child: const Text(
// 'perstation de service',
// style: TextStyle(color: Colors.white, fontSize: 16),
// ),
// style: ElevatedButton.styleFrom(
// minimumSize: const Size(110, 50),
// primary: Colors.blueAccent[100],
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20),
// ),
//
// ),
// ),
// ),
// )
// ],
// ),
// ),
//
// ),
//
// Padding(
// padding: EdgeInsets.only(top: 160),
// child:Padding(
// padding: EdgeInsets.only(left: 160),
// child:RichText(
// text: TextSpan(
// text: 'Bienvenue           ',
// style: const TextStyle(color: Colors.black, fontSize: 28, height: 1.4),
// children: <TextSpan>[
// // SizedBox(height: 20),
//
// TextSpan(
// text: 'Application',
// style: const TextStyle(color: Colors.grey,fontSize: 30,
// height: 1.5,
// fontWeight: FontWeight.bold,
// fontStyle: FontStyle.italic),
// ),
// ],
// ),
// ),
// )
//
//
//
// )
//
// ],
// )



