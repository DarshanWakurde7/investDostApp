import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investdost/Models/QuizCaregories.dart';
import 'package:investdost/Screens/QuitTitleRooms.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/notification.dart';

class StartQuizRoom extends StatefulWidget {
  const StartQuizRoom({super.key});

  @override
  State<StartQuizRoom> createState() => _StartQuizRoomState();
}

class _StartQuizRoomState extends State<StartQuizRoom> {

List<QuizData> myQuizrooms=[];
    @override
  void initState() {

getQuizCategories();

    super.initState();
  }



  void getQuizCategories() async{
    myQuizrooms=await ApiCalls.getQuizCategories();
    setState(() {
      myQuizrooms;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        
          children: [
            SizedBox(height: 40,),
            fields(context,"Quiz"),
        
             SizedBox(height: 20,),
        
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: myQuizrooms.length,
                  itemBuilder: (context,ind){
                  return   InkWell(
           onTap: ()async{
             
            Get.to(StartQuizTitleRoom(id: myQuizrooms[ind].id??0));
           }, 
            child: Container(
        width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          decoration: BoxDecoration(
                            color: Colors.amber,
               
                            border:
                                Border.all(color: Colors.black, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                             myQuizrooms[ind].categoryName??"Invest Dost",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        
                        );
                })
          ],
        ),
      ),
    );
  }
}