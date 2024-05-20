import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investdost/Models/AuthorsWhomtexted.dart';
import 'package:investdost/Screens/ProfileScreen.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';

class Authorsfollowedbyuser extends StatefulWidget {
  const Authorsfollowedbyuser({super.key,required this.imageProfile});
final String imageProfile;
  @override
  State<Authorsfollowedbyuser> createState() => _AuthorsfollowedbyuserState();
}

class _AuthorsfollowedbyuserState extends State<Authorsfollowedbyuser> {
List<AuthorswhomTexted> authorlist=[];

@override
  void initState() {
  getAllTextedAuthors();
    super.initState();
  }



  void getAllTextedAuthors() async{

authorlist=await ApiCalls.FetuchFollwedAuthors();
print(authorlist.length);
setState(() {
  authorlist;
});
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Followed Authors",),centerTitle: true,backgroundColor: Colors.amber,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          Container(
       
            height: MediaQuery.of(context).size.height*0.885,
            child: ListView.builder(
              itemCount: authorlist.length,
              itemBuilder: (context,ind){
              return Container(
             
                     decoration: BoxDecoration(
              border: BorderDirectional(bottom: BorderSide(color: Color.fromARGB(255, 86, 86, 86),width: 0.2))
            ),
                child: GestureDetector(
                  onTap: (){
                                                Get.to(Profile(authorid: authorlist[ind].authorId??0, authorslug: authorlist[ind].authoruslug??"", userString:widget.imageProfile ) );
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