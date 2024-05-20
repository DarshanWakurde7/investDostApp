
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investdost/Screens/ChatsForum.dart';


import 'package:investdost/Controller/getxController.dart';
import 'package:investdost/Models/ResponseofRegister.dart';
import 'package:investdost/Models/UserPojo.dart';

import 'package:investdost/Screens/notification.dart';
import 'package:investdost/Screens/roomsPage.dart';

class RoomTopicPage extends StatefulWidget {
  RoomTopicPage({required this.profileImage});
  String profileImage;
  @override
  State<RoomTopicPage> createState() => _RoomTopicPageState();
}

class _RoomTopicPageState extends State<RoomTopicPage> {

myController controller =Get.put(myController());

bool myanimation=true;

@override
  void initState() {

  Timer(Duration(milliseconds: 200), () { 
     setState(() {
       if(!controller.topicroom.isEmpty){
         myanimation=false;
       }
      });
  });
     
  

   
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 35, 0, 5),
            child: fields(context, "Hot Topics")),
         
Container(
              height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
  child:Obx(() {
    if(controller.LoadingContent.value){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    else{
      return ListView.builder(
        itemCount: controller.topicroom.length,
        itemBuilder: (context,ind){
  return InkWell(
   onTap: ()async{
    // ApiCalls.GetCommentByTOpics();
    Get.to(ChatsForum(roomname:controller.topicroom[ind].topic ?? "InvestDost" ,profileImage: widget.profileImage,));
   }, 
    child:Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: AnimatedContainer(
           
        height: MediaQuery.of(context).size.height*0.2,
        transform: Matrix4.translationValues((myanimation)?-500:0, 0, 0),
        duration: Duration(milliseconds: 200 + (ind*100)),
        curve: Curves.linear,
        
                         
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0,2,8,2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage("https://img.freepik.com/free-vector/flat-design-crypto-mining-logo_23-2149389190.jpg?t=st=1713855096~exp=1713858696~hmac=e8e6a94f740e2e2e4dc959f3564c6cc45b4d4cf50c2d979cfcce08aaf5ac47cc&w=740"),
                                  radius: 28,
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10,),
                                      Text(
                                        controller.topicroom[ind].topic ?? "InvestDost",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        '''Your Gateway to the Crypto Universe
Crypto Crew: Chat, Learn, Earn! Join us for juicy crypto gossip and savvy investment tips. Let's ride the digital wave together!''',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      Container(
                                        height: 50,
                                       
                                        child: ListView.builder(
                                          itemCount: data.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context,ind){
                                            
                                          return Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CircleAvatar(backgroundImage: NetworkImage(data[ind]),radius: 15,),
                                          );
                                        }),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
    )
  );
    
      });
    }
  })
)
        ],
      ) ,
    );
  }
}