
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investdost/Models/AuthorsBioPojo.dart';
import 'package:investdost/Models/AuthorsWhomtexted.dart';
import 'package:investdost/Screens/ChatwithAuthor.dart';
import 'package:investdost/Screens/ListofArticleAuthor.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';

import 'package:investdost/Screens/notification.dart';
import 'package:investdost/Screens/profilebookmarks.dart';

class Profile extends StatefulWidget {
  const Profile({super.key,required this.authorid,required this.authorslug,required this.userString});
final int authorid;
final String authorslug;
final String userString;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {

late TabController _controller;
AuthorsBioPojo authorsBioPojo=AuthorsBioPojo();
List<AuthorswhomTexted> authorlist=[];
bool followed=false;

@override
  void initState() {


    getAuthorsinfo();
    _controller=TabController(length: 2, vsync: this,initialIndex: 0);
    // TODO: implement initState
    super.initState();

  }




getAuthorsinfo()async{


        authorsBioPojo=await ApiCalls.fetchAuthorsBio(widget.authorid,widget.authorslug);
      authorlist=await ApiCalls.FetuchFollwedAuthors();

      
   
        setState(() {
          authorsBioPojo;
     followed=authorlist.map((e) => e.authorId).toList().contains(authorsBioPojo.authorId);
        });
          
            
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
            padding: EdgeInsets.fromLTRB(0, 35, 0, 5),
            child: fields(context,"Profile")
            ),

           
  SizedBox(
    
    height: MediaQuery.of(context).size.height*0.009,),
           Table(
                textDirection: TextDirection.ltr,
                 defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                 columnWidths: {
                      0:FractionColumnWidth(0.4),
                      1:FractionColumnWidth(0.6),
                 
                    },

            children: [

              TableRow(
                children: [
                  Column(
                    children: [
                      Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: CircleAvatar(radius: 44,
                      backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${authorsBioPojo.profilePic??"profile_pic\/Screenshot (737).png"}",
                      scale: 88
                                       
                      ),
                      
                      )),
                      SizedBox(height: 10,),
                                Text(authorsBioPojo.authorName??"InvestDost Author",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
           
                    ],
                  ),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                    textDirection: TextDirection.ltr,
                    columnWidths: {
                      0:FractionColumnWidth(0.25),
                      1:FractionColumnWidth(0.32),
                      2:FractionColumnWidth(0.32)
                    },
                    children: [
                      TableRow(
                     
                        children: [
                          Text("${authorsBioPojo.Post??0}",textAlign: TextAlign.center,),
                          Text("${authorsBioPojo.followersCount??0}",textAlign: TextAlign.center,),
                          Text("${authorsBioPojo.followersCount??0}",textAlign: TextAlign.center,),
                        ]
                      ),
                      TableRow(
                        children: [
                          Text("Posts",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500),),
                          Text("Followers",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500)),
                          Text("Following",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500)),
                        ]
                      ),
                      ],
                  )
                ]
              )
            ],
           ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [

            //         Padding(
            //           padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
            //           child: Text("Sagar Namo",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)),
            //                                      SizedBox(width: MediaQuery.of(context).size.width*0.18,),
            //           Container(
            //             height: MediaQuery.of(context).size.height*0.05,
            //             child: Chip(
            //             padding: EdgeInsets.all(5),
            //               label: Text("Current Rank 7",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 11),),backgroundColor: Colors.amber,),
            //           ),



                      

            //   ],
              
            //   ),
 Padding(
   padding: const EdgeInsets.fromLTRB(25.0,4,0,0),
   child: Text(authorsBioPojo.authorBio??"InvestDost Author",style: TextStyle(fontSize: 16),textAlign: TextAlign.start,),
 ),
              SizedBox(height: MediaQuery.of(context).size.height*0.005,),


                                                 

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                            OutlinedButton(onPressed: ()async{

                                   (followed)? await ApiCalls.unFolluwAuthor(authorsBioPojo.authorId??1,authorsBioPojo.authorName??"InvestDost"):await ApiCalls.folluwAuthor(authorsBioPojo.authorId??1,authorsBioPojo.authorName??"InvestDost");
                                   getAuthorsinfo();

                            }, child:  Text((followed)?"UnFollow":"Follow",style: TextStyle(color: Colors.black,fontSize: 12),),style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),),
                            OutlinedButton(onPressed: (){

                                                Get.to(ChatwithAuthor(Authorname: authorsBioPojo.authorName??"",Authorid: authorsBioPojo.userId??0,imageString: widget.userString,AuthorImage: authorsBioPojo.profilePic??"profile_pic\/Screenshot (737).png",));
                              
                            }, child:  Text("Message",style: TextStyle(color: Colors.black,fontSize: 12),),style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),),)
                  ],
                ),
              ),

    TabBar(
                    controller: _controller,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.grid_view_outlined),
                      ),
                      Tab(
                   icon: Icon(Icons.list_alt),
                      ),
                    ],
                    labelColor: Colors.black,
                  ),


              Container(
          
                height: MediaQuery.of(context).size.height*0.575,
                child: TabBarView(
                  controller: _controller,
                  children: [
                  ProfilePagebookmarks(article: authorsBioPojo.articles??[],),
               AuthorsArticleList(article: authorsBioPojo.articles??[],profilrimage: widget.userString,),
                ],
                
                ),
              )


          ],

      ),

    );
  }
}