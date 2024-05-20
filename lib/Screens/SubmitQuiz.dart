import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investdost/Screens/Leaderboard.dart';

import 'package:investdost/Models/QuizCaregories.dart';
import 'package:investdost/Screens/notification.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:lottie/lottie.dart';

class SubmitQuiz extends StatefulWidget {
  const SubmitQuiz({super.key,required this.id ,required this.correctAns,required this.points,required this.total});

  final int id,correctAns,points,total;

  @override
  State<SubmitQuiz> createState() => _SubmitQuizState();
}

class _SubmitQuizState extends State<SubmitQuiz> {


  @override
  void initState() {
    // TODO: implement initState
    Addpoints();
    super.initState();
  }

void Addpoints()async{
 await ApiCalls.AddRewardPoints(widget.points);
 
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
children: [
   SizedBox(height: 40,),
      fields(context, "Result"),


Container(
  margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
  height: MediaQuery.of(context).size.height*0.4,
  width:  MediaQuery.of(context).size.width,
  decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage("assets/images/trophygif.gif"),
    fit: BoxFit.fill
    ),
  ),

  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image(image: AssetImage("assets/images/trophy-Photoroom.png-Photoroom.png"),height: 170,),
Chip(
  avatar:  Lottie.network("https://lottie.host/23487be8-ce79-4dda-89c3-149d0eaad3fd/1ZZp6TgATT.json",height: 50),

  label: Padding(
    padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
    child: Text("${widget.points}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500))),
  backgroundColor:Colors.transparent ,

)
    
  ],),
),


   SizedBox(height: 45,),
Table(

   children: [

          TableRow(
            children: [
              Text("Correct",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
              Text("Incorrect",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
            ]
          ),
          TableRow(
            children: [
              Text("${widget.correctAns}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
              Text("${widget.total - widget.correctAns}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
            ]
          ),

   ],
    ),


   SizedBox(height: 25,),
Padding(
  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
  child: TextButton(
    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
    onPressed: (){
 Navigator.pop(context);
  Navigator.pop(context);
      Get.to(QuizTitle(id: widget.id));
           
  }, child: Row(
    
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    
    Icon(Icons.refresh,color: Colors.black,),
    SizedBox(width: 10,),
    Text("Try Again",style: TextStyle(color: Colors.black,fontSize: 18),)
  
  ],)),
),




   SizedBox(height: 40,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(Leaderboard(),transition: Transition.upToDown);
          },
          child: Chip(label:Text("Leaderboard",style: TextStyle(color: Colors.black),),avatar: Icon(Icons.bar_chart,color: Colors.amber,),)),
        Chip(label:Text("Rewards",style: TextStyle(color: Colors.black),),avatar: Icon(Icons.money,color: Colors.amber,),),

      ],
    )

],
    ),

    );
  }
}