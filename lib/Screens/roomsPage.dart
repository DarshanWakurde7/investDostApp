
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investdost/Controller/getxController.dart';
import 'package:investdost/Models/UserPojo.dart';
import 'package:investdost/Screens/RoomsTopic.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';

import 'package:investdost/Screens/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';
List<String> data=["https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA","https://res.cloudinary.com/upwork-cloud/image/upload/c_scale,w_1000/v1687701392/catalog/1672966104321150976/k4uo8rqbwzj1tllmlpim.jpg","https://miro.medium.com/v2/resize:fit:1020/1*jZ9v-2QShwnfCwHlEZCmDw.png","https://freeaiavatargenerator.pro/wp-content/uploads/2023/03/ai-generated-gce3534016_1920-1-1024x1024.jpg","https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/299241809/original/e4b4e5b63e4d4cf0688a6ba626fb233e77372303/create-impactful-customizable-ai-art-fast.png"];


class RoomsSelection extends StatefulWidget {
  




  @override
  State<RoomsSelection> createState() => RoomsSelectionState();
}

class RoomsSelectionState extends State<RoomsSelection> {

myController openControllewr =Get.put(myController());
bool myANimation=true;
UserDetailsPojo userDetailsPojo=UserDetailsPojo();
@override
  void initState() {
   
getUserInfo();
Timer(Duration(milliseconds: 100), () { 
  setState(() {
    myANimation=false;
  });
});
    // TODO: implement initState
    super.initState();
  }


  getUserInfo()async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     userDetailsPojo=await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
     
     setState(() {
       userDetailsPojo;
     });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 35, 0, 5),
            child: fields(context, "Rooms")),
         
Container(
              height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
  child:Obx(() {
    if(openControllewr.LoadingContent.value){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    else{
      return ListView.builder(
        itemCount: openControllewr.myroom.length,
        itemBuilder: (context,ind){
  return InkWell(
   onTap: ()async{
       openControllewr.fetchRoomTopics(openControllewr.myroom[ind].id??1);
    Get.to(RoomTopicPage(profileImage: userDetailsPojo.profilePic??"profile_pic/1712818972_IMG_20240409_220900.jpg",roomid: openControllewr.myroom[ind].id??0 ,));
   }, 
    child: Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: AnimatedContainer(
           
        height: MediaQuery.of(context).size.height*0.2,
        transform: Matrix4.translationValues((myANimation)?-500:0, 0, 0),
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
                                        openControllewr.myroom[ind].room_name ?? "InvestDost",
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
                        ),
    ),);
      });
    }
  })
)
        ],
      ) ,
    );
  }
}