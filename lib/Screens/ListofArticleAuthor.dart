import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investdost/Models/AuthorsBioPojo.dart';
import 'package:investdost/Screens/articlePage.dart';

class AuthorsArticleList extends StatelessWidget {
   AuthorsArticleList({super.key,required this.article,required this.profilrimage});
List<Articles> article;
String profilrimage;







  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.zero,
      itemBuilder: (context,ind){
      String image=article[ind].featuredImgPath??"featured_image/1706095138_Mainstream Financial Institutions Embrace Crypto.webp";
      return GestureDetector(
        onTap: (){
            Get.to(articlepage(title: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${image}", id: article[ind].id??0,checkAricle: (){},profileString:profilrimage ,),transition: Transition.rightToLeft,);
        },
        child: Card(
          elevation: 2,
          color: Colors.white,
          margin: EdgeInsets.all(8),
          child: Container(
            color: Colors.white,
            child: Row(
              
              children: [
            
                  Container(
                    
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.width*0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                             image: DecorationImage(image: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${image}"),fit: BoxFit.cover)
            
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(child: Text(article[ind].title??"Investdost",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
            
            ],),
          ),
        ),
      );
    }
    
    );
  }
} 