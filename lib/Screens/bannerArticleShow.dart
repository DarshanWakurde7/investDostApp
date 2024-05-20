import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:investdost/Models/ArticlePojo.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';

class BannerArticel extends StatefulWidget{

const BannerArticel({required this.id});

final int id;

  @override
  State<StatefulWidget> createState() {
      return BannerArticelState();

  }



}

class BannerArticelState extends State<BannerArticel>{



 DataOfArticles dataOfArticle=new DataOfArticles();




@override
  void initState() {

    getApicall();
    // TODO: implement initState
    super.initState();
  }




  void getApicall() async{


dataOfArticle=await ApiCalls.getFullArticsle(widget.id);

setState(() {
  dataOfArticle;
});

  }



  @override
  Widget build(BuildContext context) {
                   String image=dataOfArticle.featuredImgPath??"featured_image/1706589818_picture1-1-65b13e0c19877.webp";

   return Scaffold(
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
      
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.4,
            
            decoration: BoxDecoration(
              
             image: DecorationImage(
              fit:BoxFit.fill,
              image: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${image}")),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              )
            ),
      
      
          ),
      
            Padding(
              padding: EdgeInsets.fromLTRB(10,15,10,15),
              child: Text(dataOfArticle.parentCategoryString??"Investdost",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: AutofillHints.birthday,fontSize: 16,color: Colors.amberAccent),)),



            Padding(padding: EdgeInsets.fromLTRB(10,0,10,10),
            
            child:HtmlWidget(dataOfArticle.title??"Subscribe.......",textStyle: TextStyle(fontWeight: FontWeight.w500,fontFamily: AutofillHints.birthday,fontSize: 20)) ,
            ),



            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 15),
              child: Row(
                children: [
              
                  CircleAvatar(radius: 18,backgroundColor: Colors.pinkAccent,
                  
                  backgroundImage: NetworkImage("https://i.pngimg.me/thumb/f/720/9366ffe3d4.jpg"),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                  Text(dataOfArticle.createdByString??"hey....",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),maxLines: 1,),
              
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(10,5,10,0),
              child: HtmlWidget(dataOfArticle.content??"Subscribe InvestDost",textStyle: TextStyle(fontWeight: FontWeight.w400,fontFamily: AutofillHints.birthday,fontSize: 15),))
      
      
        ],
      ),
    ),
   );
  }


}