import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investdost/Models/AuthorsWhomtexted.dart';
import 'package:investdost/Screens/ChatwithAuthor.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';

class FetchChatMessages extends StatefulWidget {
  const FetchChatMessages({super.key,required this.username});
final String username;
  @override
  State<FetchChatMessages> createState() => _FetchChatMessagesState();
}

class _FetchChatMessagesState extends State<FetchChatMessages> {

List<AuthorswhomTexted> authorlist=[];

@override
  void initState() {

    getAllTextedAuthors();
    // TODO: implement initState
    super.initState();
  }



void getAllTextedAuthors() async{

authorlist=await ApiCalls.FetchAuthorsMessaged();
setState(() {
  authorlist;
});
}




  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Messages"),backgroundColor: Colors.amber,centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          Container(
       
            height: MediaQuery.of(context).size.height*0.823,
            child: ListView.builder(
              itemCount: authorlist.length,
              itemBuilder: (context,ind){
              return Container(
             
                     decoration: BoxDecoration(
              border: BorderDirectional(bottom: BorderSide(color: Color.fromARGB(255, 86, 86, 86),width: 0.2))
            ),
                child: GestureDetector(
                  onTap: (){
                                          Get.to(ChatwithAuthor(Authorname: authorlist[ind].authorName??"",Authorid: authorlist[ind].authorId??0,imageString: widget.username,AuthorImage: authorlist[ind].authorProfilePic??"profile_pic/1712818972_IMG_20240409_220900.jpg",));

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${authorlist[ind].authorProfilePic??"profile_pic/1712818972_IMG_20240409_220900.jpg"}",scale: 1),),
                      SizedBox(width: 10,),
                       Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          SizedBox(height: 5,),
                           Text(authorlist[ind].authorName??"InvestDost Author",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                           Card(
                            color: Colors.amber.shade200,
                            child: Padding(padding: EdgeInsets.fromLTRB(8,2,8,2),child: Text("Author",style: TextStyle(fontSize: 12),),),surfaceTintColor: Colors.amber.shade300,)
                         ],
                       ),
                    ],),
                  ),
                ),
              );
            }),
          )
   
        ],
      ),
    );
  }
}