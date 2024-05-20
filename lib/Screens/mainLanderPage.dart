
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investdost/Controller/QuizDataController.dart';
import 'package:investdost/Screens/FetchchatsList.dart';

import 'package:investdost/Screens/LanderPage.dart';
import 'package:investdost/Models/ArticlePojo.dart';
import 'package:investdost/Models/UserPojo.dart';
import 'package:investdost/Screens/ProfileScreen.dart';
import 'package:investdost/Screens/QuizRooms.dart';
import 'package:investdost/Screens/Subscribe.dart';
import 'package:investdost/Screens/UserProfile.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/newloginpage.dart';
import 'package:investdost/Screens/reward.dart';
import 'package:investdost/Screens/roomsPage.dart';
import 'package:investdost/Screens/shortNews.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

 List<DataOfArticles> bookMarks=[];
List<int> bookmarkids=[];

 final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

class MyWidget extends StatefulWidget {
  const MyWidget({super.key,required this.ind,required this.user_id});
  final int ind,user_id;
  // final UserDetailsPojo fetchuserProfile;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {


    String imageurl="";
   int _selectedindex=0;
   UserDetailsPojo userDetailsPojo=UserDetailsPojo();
  QuizController quizController=Get.put(QuizController());
  @override
  void initState() {
    // TODO: implement initState
_selectedindex=widget.ind;


getBookmarksApi();
    super.initState();
  }



 void  getBookmarksApi()async{

     userDetailsPojo= await ApiCalls.fetchuserProfile(widget.user_id);
        bookMarks=await ApiCalls.fetchBookmarks();
        bookmarkids= await ApiCalls.getBookMarkIds();
        setState(() {
          imageurl="https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${userDetailsPojo.profilePic??"profile_pic/1712818972_IMG_20240409_220900.jpg"}";
          bookmarkids;
          userDetailsPojo;
        });

        print(userDetailsPojo.username??"InvestDost");

  }





  List<Widget> MyWidget=[
LanderPage(hedding: "All Articles",),
UsersProfile(refreshdata: (){
      
}),
// Profile(authorid: 1,),
HomeWidget(colors: images,),
RoomsSelection(),
StartQuizRoom(),
];




  _changeTab(int index) {
    setState(() {
      _selectedindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 key: _scaffoldKey,

          drawer: Drawer(
            child: Container(
              color: Colors.white,
              child: Column(
                        
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Column(
                     
                      children: [
                                        Padding(padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap:() async{
                                                    Navigator.pop(context);
                                                    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

                                Navigator.push(context,MaterialPageRoute(builder: (context)=>UsersProfile(refreshdata: (){
                            
                                  getBookmarksApi();
                                },)));

                            // Get.to(UsersProfile(userDetailsPojo:userDetailsPojo,),transition: Transition.rightToLeft,duration: Duration(milliseconds: 400));
                          },
                    child: CircleAvatar(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 2, 15),
                        child: Align(
                          alignment: Alignment.bottomRight,
                    
                            child: CircleAvatar(radius: 10,backgroundColor: Colors.amber,
                            child: Icon(Icons.add,color: Colors.white,size: 20,),
                            ),
                          
                        ),
                      ),
                      backgroundImage: NetworkImage(imageurl),radius: 58,),
                  ),),
                  SizedBox(width: MediaQuery.of(context).size.width*0.08,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(userDetailsPojo.username??"InvestDost",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                     Text(" Points ${userDetailsPojo.currentScore??0}",style: TextStyle(fontSize: 16,color: Colors.white),)            
                    ],
                  )
                      ],
                    ),
              SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        Get.to(Rewards());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child:   Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                     Lottie.network("https://lottie.host/23487be8-ce79-4dda-89c3-149d0eaad3fd/1ZZp6TgATT.json",height: 40),
                                  SizedBox(width: 5,),
                                  Text(
                                    "Rewards",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        setState(() {
                          _selectedindex=2;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border:
                              //     Border.all(color: Colors.black, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const  Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                       SizedBox(width: 10,),
                                     Icon(Icons.bookmark_added_outlined),
                                  SizedBox(width: 10,),
                                  Text(
                                    "Bookmarks",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                    InkWell(
                      onTap: (){
                                                Navigator.pop(context);

          Get.to(Subscriptionpage());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border:
                              //     Border.all(color: Colors.black, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const  Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                   SizedBox(width: 10,),
                                     Icon(Icons.monetization_on_outlined),
                                  SizedBox(width: 10,),
                                  Text(
                                    "Subscribe",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                  
                    GestureDetector(
                      onTap: (){
                        Get.to(FetchChatMessages(username: imageurl,),transition: Transition.rightToLeft);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border:
                              //     Border.all(color: Colors.black, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const  Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                   SizedBox(width: 10,),
                                     Icon(Icons.chat_bubble_outline_rounded),
                                  SizedBox(width: 10,),
                                  Text(
                                    "Chats",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                    
              
              
                GestureDetector(
                      onTap: ()async{
                        Navigator.pop(context);
                        SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                        sharedPreferences.remove("userid");
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>newLogin()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                             
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const  Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                   SizedBox(width: 10,),
                                  Icon(Icons.logout),
                                  SizedBox(width: 10,),
                                  Text(
                                    "Log Out",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
              
                ],
              ),
            ),
          ),
         bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.amber)
            )
          ),
          height: MediaQuery.of(context).size.height*0.0735,
          child: BottomNavigationBar(
            selectedItemColor: Colors.amber,
            showUnselectedLabels: false,
            currentIndex: _selectedindex,
            backgroundColor: Colors.transparent,
            items: const<BottomNavigationBarItem>[
          
             BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined,color: Colors.black,size: 24,)),

            
             BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person_outline,color: Colors.black,size: 24,)),

             BottomNavigationBarItem(
            label: "Bookmarks",
            icon: Icon(Icons.favorite,color: Colors.red,size: 24,)),
             BottomNavigationBarItem(
            label: "Forum",
            icon: Icon(Icons.forum_outlined,color: Colors.black,size: 24,)),
              
             BottomNavigationBarItem(
              label: "Quiz",
              icon: Icon(Icons.list,color: Colors.black,size: 24,)),
              
           
          
          ],
          onTap: (ind){

      _changeTab(ind);
          },
          ),
        ),
      ),
body: MyWidget[_selectedindex],



   
    ) ;
  }
}

  void openDrawer(){
    _scaffoldKey.currentState!.openDrawer();
  }