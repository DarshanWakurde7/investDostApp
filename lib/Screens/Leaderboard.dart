import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:investdost/Models/LeaderBoardPojo.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';






class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  // List<LeaderBoardpojo> myleaderboard=[LeaderBoardpojo("Tom Riddle", "", "120"),LeaderBoardpojo("Gorege Fred", "", "20"),LeaderBoardpojo("Ronald Wiesly", "", "12"),LeaderBoardpojo("Harry potter", "", "10"),LeaderBoardpojo("Hermione", "", "1")];
LeaderBoardPojo leaderBoardpojo=LeaderBoardPojo(myRank: MyRank(),rankList: []);
String medal="";


      @override
  void initState() {

    getApiCalls();
    // TODO: implement initState
    super.initState();

  }


  getApiCalls()async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
        leaderBoardpojo= await ApiCalls.fetchLeaderBoard(sharedPreferences.getInt("userid")??0);
        setState(() {
          leaderBoardpojo;
        });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Color.fromARGB(255, 251, 242, 215),
      appBar: AppBar(
        title:Text("Leaderboard"),
        centerTitle: true,
        
      backgroundColor: Colors.amber.shade300,
      ),
      body:  Column(
        children: [
          Flexible(
            child: ListView(
           
                 scrollDirection: Axis.vertical,
                children: [
              
                Card(
                  elevation: 6,
                  margin: EdgeInsets.all(15),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.22,
                    width: double.infinity,
                    
                    decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.amber.shade500,
                    Colors.amber.shade300,
                    Colors.amber.shade100,
            
            
                 ]),
                      borderRadius: BorderRadius.circular(11)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 50,),
                           
                                  Text("Win 10Krs",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                                  Text("Start Collecting more coins now",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)
                            ],
                          ),
                          Image.asset("assets/images/trophyimage.png",width: 130,),
                        ],
                      ),
                    ),
                  ),
                ),
              
            
                   ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: double.infinity),
                     child: ListView.builder(
                                     padding: EdgeInsets.zero,
                                     scrollDirection: Axis.vertical,
                                     physics: ScrollPhysics(),
                                     shrinkWrap: true,
                      itemBuilder: (context,ind){
                        
                                       Gradient gradient=LinearGradient(colors: [
                                      Color.fromARGB(255, 242, 241, 241),
                                       Color.fromARGB(255, 247, 247, 247),
                                       Colors.white,
                                       
                                       
                     ]);
                      if(ind==0){
                        gradient=LinearGradient(colors: [
                        Colors.amber.shade500,
                        Colors.amber.shade300,
                        Colors.amber.shade100,
                                      //  Colors.white,
                                      //  Colors.white,
                                      //  Colors.white,
                                       
                     ]);
                     medal="assets/images/meadal2.png";
                      }else if(ind==1){
                        gradient=LinearGradient(colors: [

                          // Colors.white,
                          //              Colors.white,
                          //              Colors.white,
                        Color.fromRGBO(192, 192, 192, 100),
                        Color.fromRGBO(192, 192, 192, 50),
                        Color.fromRGBO(192, 192, 192, 0),
                        
                                       
                                       
                     ]);
                     medal="assets/images/medal1.png";
                      }
                      else if(ind==2){
                        gradient=LinearGradient(colors: [

                          // Colors.white,
                          //              Colors.white,
                          //              Colors.white,
                         Color.fromRGBO(205, 127, 50, 100),
                         Color.fromRGBO(205, 127, 50, 50),
                         Color.fromRGBO(205, 127, 50, 0),
                             
                                       
                     ]);
                     medal="assets/images/medal3.png";
                      }
                                       
                                      
                     return  Container(
                     decoration: BoxDecoration(gradient: gradient,
                                       
                     borderRadius: BorderRadius.circular(12)
                     
                     ),
                        margin: EdgeInsets.fromLTRB(20,5,20,5),
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            image: DecorationImage(image:  NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${leaderBoardpojo.rankList![ind].profile_pic??"profile_pic/1712912077_IMG-20240319-WA0003.jpg"}"),fit: BoxFit.cover)
                                                        
                                          ),
                                          height: 60,
                                          width: 60,
                                        
                                        ),
                                      ),
                                    ([0,1,2].contains(ind))?Align(
                                      alignment: Alignment.topLeft,
                                    
                                      child: Image.asset(medal,width: 45,),
                                    ):  Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 3),
                                      child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Card(child: Padding(
                                              padding: EdgeInsets.fromLTRB(8,4,8,4),
                                              child: Text("${ind+1}",style: TextStyle(fontSize:12,color: Colors.white ),)),color: const Color.fromARGB(255, 255, 105, 59),),
                                          ),
                                    )
                                    ],
                                  ),
                                  SizedBox(width: 15,),
                                  Text(leaderBoardpojo.rankList![ind].username??"InvestDost",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Row(
                                  children: [
                                    Lottie.network("https://lottie.host/23487be8-ce79-4dda-89c3-149d0eaad3fd/1ZZp6TgATT.json",height: 40),
                                    Text((leaderBoardpojo.rankList![ind].currentScore??0).toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      );
                                       
                                       },
                                       
                                       itemCount: (leaderBoardpojo.rankList??[]).length,
                                       
                                       ),
                   ),
                
              
              
              
              
              
                ],
              ),
          ),
        ],
      ),
    
    );
  }
}





