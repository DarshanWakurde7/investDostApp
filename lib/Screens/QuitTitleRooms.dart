
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investdost/Models/QuizCaregories.dart';
import 'package:investdost/Screens/QuizPage.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/notification.dart';

class StartQuizTitleRoom extends StatefulWidget {
  const StartQuizTitleRoom({super.key, required this.id});
 final int id;

  @override
  State<StartQuizTitleRoom> createState() => _StartQuizTitleState();
}

class _StartQuizTitleState extends State<StartQuizTitleRoom> {

List<QuizTitle> myQuizrooms=[];


    @override
  void initState() {

getQuizCategories();

    super.initState();
  }



  void getQuizCategories() async{
    myQuizrooms=await ApiCalls.getQuizCategoriesTitle(widget.id);
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
             
            Get.to(QuizPage(id: myQuizrooms[ind].id??0));
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
                             myQuizrooms[ind].title??"Invest Dost",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),);
                })
          ],
        ),
      ),
    );
  }
}