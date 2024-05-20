
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:investdost/Models/RewardPojo.dart';
import 'package:investdost/Models/UserPojo.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rewards extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
return RewardsState();
  }




}


class RewardsState extends State<Rewards>{
String name="";
int points=0;
int currentrank=0;
String profilepic="";
List<RewardsPojo> rewardspo=[];

@override
  void initState() {


getRewards();


    // TODO: implement initState
    super.initState();
  }


getRewards() async{

SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
UserDetailsPojo usersProfile=await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
rewardspo=await ApiCalls.getRewards();
setState(() {
  name=usersProfile.fullname??"InvestDost";
  points=usersProfile.currentScore??0;
  currentrank=usersProfile.currentRank??-1;
  profilepic=usersProfile.profilePic??"";
  rewardspo;
});

}

  @override
  Widget build(BuildContext context) {
return  Scaffold(

      body:Column(

          children: [
             Padding(
            padding: EdgeInsets.fromLTRB(0, 35, 0, 5),
            child: fields(context,"Rewards")
            ),
  SizedBox(
    
    height: MediaQuery.of(context).size.height*0.02,),

//            Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
// Chip(
//                         padding: EdgeInsets.all(5),
//                           label: Text("Current Rank",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 11),),backgroundColor: Colors.white,),

//                           Chip(
//                         padding: EdgeInsets.fromLTRB(15,5,15,5),
//                           label: Text("My Points",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 11),),backgroundColor: Colors.amber,),
//                   ],
//                 ),
//               ),
                                                               SizedBox(height: MediaQuery.of(context).size.height*0.02,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: CircleAvatar(radius: 50,
                  backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${profilepic}",
                  scale: 88
                 
                  ),
                  )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                            Padding(
                      padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                                                 SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                            Padding(
                      padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: Text("${points} Points",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                                                
                     
                    ],
                  ),
                )
              ],
            ),

        
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

     Container(
                        height: MediaQuery.of(context).size.height*0.05,
                        child: Chip(
                        padding: EdgeInsets.fromLTRB(25,10,25,10),
                          label: Text("Current Rank ${currentrank}",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 13),),backgroundColor: Colors.amber,),
                      ),



                                                 
   SizedBox(height: MediaQuery.of(context).size.height*0.022,),


   Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
     child: Table(
   
      columnWidths: {
        0:FractionColumnWidth(0.355),
        1:FixedColumnWidth(140),
        2:FractionColumnWidth(0.2),
      },
      children: [
        TableRow(
        
          children: [
            Text("Activities",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
            Text("Dates",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
            Text("Points",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
            ]

            
        ),
      ],
     ),
   ),


   Container(
    height: MediaQuery.of(context).size.height*0.6,

     child: ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: rewardspo.length,
      itemBuilder: (context,ind){
      
      return Padding(
        padding: const EdgeInsets.fromLTRB(20.0,5,15,5),
        child: Table(
          children: [
                  TableRow(
              children: [
                Text(rewardspo[ind].activity??"Investdost",style: TextStyle(fontSize: 15,color: Colors.amber,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
                Text(rewardspo[ind].date??"Investdost",style: TextStyle(fontSize:13),textAlign: TextAlign.left,),
                Text('${rewardspo[ind].pointsEarned??0}',style: TextStyle(fontSize:14),textAlign: TextAlign.center,),
                ]
            ),
          ],
        ),
      );
     }),
   )
             


          ],

      ),

    );  
    
    }




}