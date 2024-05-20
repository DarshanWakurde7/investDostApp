import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investdost/Controller/QuizDataController.dart';
import 'package:investdost/Models/QuizPojo.dart';
import 'package:investdost/Screens/SubmitQuiz.dart';
import 'package:lottie/lottie.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.id});
    final int id;
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
         bool isSelected =false;

  int initPage=0;
QuizController quizController=Get.put(QuizController());
PageController pageController=PageController(initialPage:0 );
int? _selectedindex;
int points=0;
int correctAns=0;

@override
  void initState() {
   getQuizData();
    // TODO: implement initState
    super.initState();
  }

getQuizData()async{
  await  quizController.getQuizData(widget.id);
  setState(() {
    quizController.quizdata;
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 247, 222),
     

appBar: AppBar(title: Text("Testing",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
backgroundColor:   Color.fromARGB(255, 255, 247, 222),

centerTitle: true,),
        body:  Obx(
        (){
          if(quizController.isloading.value){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return  Container(
            
              child: PageView.builder(
                
                onPageChanged: (val){
                                setState(() {
                   isSelected=false;
                 });
                },
                controller: pageController,
                    physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
              itemCount: quizController.quizdata.length,
                 itemBuilder: (context, index) {
        
                   return Padding(
                    padding: EdgeInsets.fromLTRB(10,0,10,20),
                     child:  GestureDetector(
                      onHorizontalDragEnd: (details){
                
                          if(details.primaryVelocity!.compareTo(0)==-1){
              
                         pageController.animateToPage(index+1, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            
                  }
                      },
                 child: Container(
                      margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                   
                      borderRadius: BorderRadius.circular(25)
                 
                    ),
                     
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                 
                 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                     Text("Q${index+1}.",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                                     Row(
                                       children: [
                                         Lottie.network("https://lottie.host/23487be8-ce79-4dda-89c3-149d0eaad3fd/1ZZp6TgATT.json",height: 40),
                                         Text("${quizController.quizdata[index].points}",style: const TextStyle(fontSize: 21,fontWeight: FontWeight.w400),),
                                       ],
                                     ),
                                     
                                 
                          ],
                        ),
                      ),
                       SizedBox(height: 5,),
                 
                 Card(
                  color: Colors.white,
              
                  
                   child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11)),
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(quizController.quizdata[index].questionText??"option unavailable",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                    )),
                 ),
                      SizedBox(height: 0,),
                 ListView.builder(
                  
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: quizController.quizdata[index].options!.length,
                  itemBuilder: (context,ind){
                    
                      return Option(options: quizController.quizdata[index].options![ind], selectedOption:_selectedindex??-1,optionind: ind,myselectedindex: (ind){
                        if(!isSelected){
                          print(isSelected);
                 
                          (quizController.quizdata[index].options![ind].isCorrectOption==1)?
                          
                          setState(() {
                                                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Correct Answer",style: TextStyle(color: Colors.white),),backgroundColor: Colors.greenAccent,duration: Duration(milliseconds: 700),));
                                        isSelected=true;
                                       _selectedindex=ind;
                                       correctAns++;
                                       points+=int.parse(quizController.quizdata[index].points??"0");
                                      
                          }):setState(() {
                 
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Answer",style: TextStyle(color: Colors.white),),backgroundColor: Colors.redAccent,duration: Duration(milliseconds: 800),));
                             isSelected=true;
                          });
                                   
                        }
                        },);
                      
                 }),
                  
                              
                    Align(
                    heightFactor: 3,
                    alignment: Alignment.bottomRight,
                    child:   InkWell(
                  onTap: (){
                 
                        if(index+1==quizController.quizdata.length){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SubmitQuiz(id: widget.id,correctAns: correctAns,points: points,total: quizController.quizdata.length,)));
                        }else{
                             pageController.animateToPage(index+1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                        }
                 
                  },child: Container(
                    color: Colors.amber.shade300,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text( (index+1==quizController.quizdata.length)?" Submit ":"  Next question..",style: TextStyle(color: Colors.white,fontSize: 15),),
                    ))),
                   ),
                 
                 
                    ],
                  ),
                 ),
               ),
                     
                   );
                 }
               ),
            );
          }
        }
        )
        
    );
  }
}


class Option extends StatefulWidget {
  const Option({super.key,required this.options,required this.optionind,required this.selectedOption,required this.myselectedindex, });
 final int selectedOption;
final Options options;

final int optionind;

final Function (int) myselectedindex;




  @override
  State<Option> createState() => _OptionsState();
}

class _OptionsState extends State<Option> {
 

  Color bgColor=Colors.white;
  @override
  Widget build(BuildContext context) {
    return InkWell(
                      onTap: (){
                   widget.myselectedindex(widget.optionind);

         
              


                          if(widget.options.isCorrectOption==1){

                      bgColor=Colors.greenAccent;
                     
                    }
                    else{
              
                     setState(() {
                         bgColor=Colors.redAccent;
                     });
                    }

                
                   

                      },
                      child: Card(
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            
                            color: bgColor,
                          ),
                          width: MediaQuery.of(context).size.width,
                          
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(widget.options.optionText??"option unavailable",textAlign: TextAlign.center,style: TextStyle(fontSize: 18),)),
                        ),
                      ),
                    );
  }
}

