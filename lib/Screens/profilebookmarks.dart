import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investdost/Models/AuthorsBioPojo.dart';
import 'package:investdost/Models/UserPojo.dart';
import 'package:investdost/Screens/articlePage.dart';
import 'package:investdost/Screens/mainLanderPage.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePagebookmarks extends StatefulWidget{

  ProfilePagebookmarks({required this.article});

List<Articles> article;

  @override
  State<StatefulWidget> createState() {

    return ProfilePagebookmarksState();

  }



}

class ProfilePagebookmarksState extends State<ProfilePagebookmarks>{
UserDetailsPojo userDetailsPojo=UserDetailsPojo();

@override
  void initState() {
getuserDetial();
    // TODO: implement initState
    super.initState();
  }


getuserDetial()async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
 userDetailsPojo= await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
}


  @override
  Widget build(BuildContext context) {
 return Scaffold(

    body: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    padding: EdgeInsets.zero,

      itemCount: widget.article.length,    
     itemBuilder:(context,ind){
      print(widget.article[ind].featuredImgPath);
      String image=widget.article[ind].featuredImgPath??"featured_image/1706095138_Mainstream Financial Institutions Embrace Crypto.webp";
      return InkWell(
        onTap:(){
          Get.to(articlepage(title: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${image}", id: widget.article[ind].id??0,checkAricle: (){},profileString: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${userDetailsPojo.profilePic??""}",),transition: Transition.rightToLeft,);
        },
        child: Container(
        
          height: MediaQuery.of(context).size.height*0.4,
          width: MediaQuery.of(context).size.width*0.3,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${image}"),fit: BoxFit.cover)
          ),
        ),
      );


     } )

 );
  }

}