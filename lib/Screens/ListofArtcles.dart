import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investdost/Models/landernewspojo.dart';
import 'package:investdost/Screens/LanderPage.dart';
import 'package:investdost/Screens/articlePage.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';

class ListOfArticles extends StatefulWidget {
  const ListOfArticles({super.key,required this.id,required this.profileImg,required this.categoryname});
final int id;
final String profileImg,categoryname;
  @override
  State<ListOfArticles> createState() => _ListOfArticlesState();
}

class _ListOfArticlesState extends State<ListOfArticles> {


List<Data> dataArticle=[];
@override
  void initState() {
getArticlesByCategory();
    // TODO: implement initState
    super.initState();
  }

getArticlesByCategory()async{
dataArticle=await ApiCalls.getCategorywiseNew(widget.id);
print(dataArticle.length);
setState(() {
  dataArticle;
});

}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryname),centerTitle: true,backgroundColor: Colors.amber.shade400,),

      body:

          Container(
            child: ListView.builder(
              itemCount: dataArticle.length,
            itemBuilder: (context,ind){
              return GestureDetector(
        onTap: (){
            Get.to(articlepage(title: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${dataArticle[ind].featuredImgPath??"featured_image/1706095138_Mainstream Financial Institutions Embrace Crypto.webp"}", id: dataArticle[ind].id??0,checkAricle: (){},profileString:widget.profileImg ,),transition: Transition.rightToLeft,);
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
                             image: DecorationImage(image: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${dataArticle[ind].featuredImgPath??"featured_image/1706095138_Mainstream Financial Institutions Embrace Crypto.webp"}"),fit: BoxFit.cover)
            
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(child: Text(dataArticle[ind].title??"Investdost",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
            
            ],),
          ),
        ),
      );
            }),
          )

      
    );
  }
}