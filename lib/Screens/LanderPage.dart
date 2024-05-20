import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investdost/Controller/QuizDataController.dart';
import 'package:investdost/Models/UserPojo.dart';
import 'package:investdost/Models/dropdown.dart';
import 'package:investdost/Screens/Subscribe.dart';

import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/articlePage.dart';
import 'package:investdost/Screens/bannerArticleShow.dart';
import 'package:investdost/Screens/mainLanderPage.dart';

import 'package:investdost/widgets/LanderPageCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/landernewspojo.dart';
List<String> field=["Latest","Featured","Editor's Pick","Trending","Sponsored","Articles"];
var images=['https://www.dianomi.com/img/a/sav2/222436/7/396x206.jpg','https://images.indianexpress.com/2021/05/Trending-03-1.jpg?resize=600,334','https://cdn.newsnationtv.com/videos/vod_images/2023/12/26/trending-17354434502.jpg','https://i.ytimg.com/vi/KGIY6CjfSD4/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCRlFHDmE-3cueZszOLa8mTMl1N-w','https://lbimg.in.com/LiveBlog/img/2022/06/dd6ff21aee393a13d0df31568808a953.png','https://lbimg.in.com/LiveBlog/img/2022/06/dd6ff21aee393a13d0df31568808a953.png'];



List<Data> newsdata=[];
class LanderPage extends StatefulWidget{

  LanderPage({required this.hedding});

  String hedding;

  @override
  State<LanderPage> createState() => _LanderPageState();
}

class _LanderPageState extends State<LanderPage> {
List<Dropdownpage> dropdown=[];
FocusNode focusNode = new FocusNode();
String dropdownValue="more categories";
int _selectedindex=0;
var search=TextEditingController();

QuizController quizController=Get.put(QuizController());

int articleIndex=0;
List<Data> foundData=[];
UserDetailsPojo userDetailsPojo=UserDetailsPojo();
@override
  void initState() {
      foundData=newsdata;
      _selectedindex=1;
      getDropDownItems();
    super.initState();
  }

void getDropDownItems()async{
  SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
  dropdown=await ApiCalls.apiGetDropDownItems();
 userDetailsPojo= await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
}
void getArticle(int ind)async{
  
                if(ind==3){
                      await ApiCalls.getTrendingArticle();
                          setState(() {
                  foundData=newsdata;
                      widget.hedding="Trending";
                    });
                
                }else if(ind==0){
                     await ApiCalls.LatestArticel();
                             setState(() {
               foundData=newsdata;
                      widget.hedding="Article";
                    });
                }
                else if(ind==1){
                      await ApiCalls.getFeatured();
                             setState(() {
                 foundData=newsdata;
                      widget.hedding="Featured Articles";
                    });
                }
                else if(ind==2){
                      await ApiCalls.getEditorsChoice();
                             setState(() {
                     foundData=newsdata;
                      widget.hedding="Editors Choice";
                    });
                }
                else if(ind==5){
                     await ApiCalls.getNews();
                    
                             setState(() {
                foundData=newsdata;
                      widget.hedding="Latest Articles";
                    });
                }
                else if(ind==4){
                     await ApiCalls.getSponserdArticles();
                    
                             setState(() {
                foundData=newsdata;
                      widget.hedding="Latest Articles";
                    });
                }
               

else{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("WillCome Soon0")));
}
getDropDownItems();
}




  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      
      body:Container(
        
          child: RefreshIndicator(
            onRefresh: ()async{
                getArticle(articleIndex);
            },
            child: Column(
                     
              children: [
                     Container(height: MediaQuery.of(context).size.height*0.05,),
                  
                  
                    Padding(
            padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: serchNotify(context)),
                    Container(height: 5,),
                   
                    // Container(height: 2,),
                    
        

          Flexible(
  child: ListView(
    scrollDirection: Axis.vertical,
    padding: EdgeInsets.zero,
  
    children: [
      Padding(
            
            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
            child: Text("Daily Hunts",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),

      imgSlider(),

 Padding(
            
            padding: EdgeInsets.fromLTRB(20, 20, 0, 5),
            child: Text("Categories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),

    Container(
      margin: EdgeInsets.fromLTRB(2, 0, 2, 5),
    height:MediaQuery.of(context).size.height*0.058 ,
    color: Colors.white,

    child: ListView.builder(itemBuilder: (context,ind){
      if(ind<field.length){
        return Container(
       
        
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 7, 5, 7),
          child: ElevatedButton(

        style:  ButtonStyle(
          backgroundColor: MaterialStatePropertyAll( (articleIndex==ind)?Colors.amber:Colors.white)
        ),              


            onPressed: (){
              setState(() {
                articleIndex=ind;
              });
              getArticle(articleIndex);

  // Navigator.pop(context);
            }, child: Text(field[ind],style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Colors.black),),
          

          ),
        ),
      );
      }
      else{
        return Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: DropdownMenu(

            hintText: "Categories",
            onSelected: (value) async{
           foundData=  await ApiCalls.getCategorywiseNew(value!.id);
             setState(() {
               newsdata;
               foundData;
             });
            },
            textStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Colors.black),
              inputDecorationTheme: const InputDecorationTheme(
                        contentPadding: EdgeInsets.all(10),
                       
                        constraints: BoxConstraints.expand(height: 35),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            width: 1.2,
                            color: Colors.blue,
                          ),
                        ),),
            dropdownMenuEntries: dropdown.map<DropdownMenuEntry<Dropdownpage>>((Dropdownpage item){
            return DropdownMenuEntry(value: item, label: item.categoryName,style: ButtonStyle(textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Colors.black))));
          }).toList(),
          width: MediaQuery.of(context).size.width*0.4,
          
          ),
        );
      }
    },

    scrollDirection: Axis.horizontal,
    itemCount: field.length+1,
    ),

  ),


















      Padding(
            
            padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
            child: Text(widget.hedding,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),
      ConstrainedBox(
        constraints: BoxConstraints(maxHeight: double.infinity), // **THIS is the important part**
        child: ListView.builder(
              padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
             print(foundData[index].profilePic);
            String imagename=foundData[index].featuredImgPath??"featured_image/1706095138_Mainstream Financial Institutions Embrace Crypto.webp";
            return Padding(
              padding: EdgeInsets.all(15),
              child: InkWell(
                onTap: (){

                        if(foundData[index].isFreeArtical==1){                 
                           Get.to(articlepage(title: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${imagename}", id: foundData[index].id??1,checkAricle: (){},profileString: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${userDetailsPojo.profilePic??""}",),transition: Transition.rightToLeft);
                        }else{
                                                     Get.to(Subscriptionpage(), transition: Transition.zoom,duration: Duration(milliseconds: 300));

                        }
                },
                child: CardofPage(NameofAutor: foundData[index].createdByString??"Invest Dost", imagePath:"https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${imagename}", TitleName: foundData[index].title??"Hello WOrld Invest DOst ",isFree:foundData[index].isFreeArtical??0,authorsImage: foundData[index].profilePic??"",)));
          },
          itemCount: foundData.length,
        ),
      ),
    ],
  ),
),


                    
                    
                    
   
                    
           
                    
  
                    
                    
                    
                    
                    
                    
                    
              ]
              
              
              ),
          ),
        
        ),
   
      
    );
  }





// Container logo(){

//   return Container(
//       width: 200,
//     child: const Image(image: AssetImage("assets/images/investdost.png")
//     )
//     );

// }

//=-------------------Search---------------------==


Row serchNotify(BuildContext context){
  
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


    GestureDetector(
      onTap: (){
openDrawer();
      },
      child: Image(
         width: MediaQuery.of(context).size.width*0.08,
         height:  MediaQuery.of(context).size.height*0.08,
        image: NetworkImage("https://investdost-test.portalwiz.in/assets/app-icon.png",),
        
      ),
    ),

       Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
         child: Container(
          width: 250,
          height: 40,
          child: TextField(
            autofocus: true,
            onChanged: (value)=>serchdata(value),
            textAlignVertical: TextAlignVertical.bottom,
            textAlign: TextAlign.left,
            cursorHeight: 25.0,
           controller: search,
           maxLines: 1,
           onTapOutside: (event) {
                       FocusScope.of(context).requestFocus(FocusNode());
           },
           decoration: InputDecoration(
            hintText: "Search",
            
            prefixIcon: const Icon(Icons.search),
            suffixIcon: InkWell(
              onTap: (){
          

              },
              child: Icon(Icons.mic)
              ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Color.fromARGB(255, 234, 190, 61))
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.black)
            ),
           ),
          )
          ),
       ),

   InkWell(
    onTap: (){

     
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification1()),);

    },
     child: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage("https://images.rawpixel.com/image_png_400/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L3JtNTMzLWljb24tMTI5LnBuZw.png"),
                backgroundColor: Colors.yellow,
               
              ),
   ),

        ],
      );


}




serchdata(String value){

List<Data> result;
if(value.isEmpty){

result=newsdata;

}
else{
result = newsdata.where((element) => element.title?.toLowerCase()?.contains(value.toLowerCase()) ?? false).toList();


}

setState(() {
  foundData=result;
});

}








}



//----------------------------------Image Slider--------------------------------------------------------------



CarouselSlider imgSlider(){

if(newsdata.isEmpty){
  return CarouselSlider(items: [
    Center(child: CircularProgressIndicator())
  ], options:  CarouselOptions(
     height: 160.0, 
                enlargeCenterPage: true, 
                autoPlay: true, 
                aspectRatio: 16 / 9, 
                autoPlayCurve: Curves.fastOutSlowIn, 
                enableInfiniteScroll: true, 
                autoPlayAnimationDuration: Duration(milliseconds: 800), 
                viewportFraction: 0.8, 
  ));
}
else{
    return CarouselSlider.builder(
    
    itemCount:(newsdata.isEmpty)?1:newsdata.length,
  
  
   itemBuilder: (context,ind,index){
               String image=newsdata[ind].featuredImgPath??"featured_image/1706095138_Mainstream Financial Institutions Embrace Crypto.webp";

    return InkWell(
      onTap: (){
        print(newsdata[ind].title);
        Get.to(BannerArticel(id: newsdata[ind].id??0,));
      },
      child: Card(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35)
          ),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${image}"),fit: BoxFit.fill))
      )
      ),
    );

  }, options: CarouselOptions(
     height: 160.0, 
                enlargeCenterPage: true, 
                autoPlay: true, 
                aspectRatio: 16 / 9, 
                autoPlayCurve: Curves.fastOutSlowIn, 
                enableInfiniteScroll: true, 
                autoPlayAnimationDuration: Duration(milliseconds: 800), 
                viewportFraction: 0.8, 
  ));
}

}


//------------------news Headline------------------------------------------------------------------------
















//---------------------------------------------------------------------------------------------------------
// Container newsCard(BuildContext context){


//   return Container(
//  height: MediaQuery.of(context).size.height*0.46,
// decoration: const BoxDecoration(
//   color: Colors.white
// ),
//   child:  ListView.builder(itemBuilder: (context,ind){
        
//                 String image=newsdata[ind].featuredImgPath??"featured_image/1706115132_picture1-3-65b140215758e.webp";
//                 String  title=newsdata[ind].title.toString();
//                 String  description=newsdata[ind].content.toString();
     
         
//             if(ind<=newsdata.length-1){
               
//         return InkWell(
//           onTap: (){

//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>articlepage(title: "https://investdost-dev.portalwiz.in/investdostapi/storage/app/public/${image}",id: newsdata[ind].id??0,)));

//           },
//           child: Card(
//               surfaceTintColor: Colors.white,
//             shape:RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15)
//             ),
//             elevation: 5,
//             child: Row(
              
              
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              
//               children: [
                
//               newsColumn(title,description),
//                Container(
          
//                 width: 110,
//               height: 200,
          
//                 decoration: BoxDecoration(
//                       image: DecorationImage(image: NetworkImage("https://investdost-dev.portalwiz.in/investdostapi/storage/app/public/${image}",scale: 1.0),fit: BoxFit.fill)
//                 ),
           
//               ),
//             ],
            
//             ),
            
//               ),
//         );
//             }
// else{
//   return     Padding(
//     padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
//     child: Card(
//                   surfaceTintColor: Colors.white,
//                   shape:  RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(25))
//                   ),
//                   elevation: 15,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(25)
//                                     ),
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           height: MediaQuery.of(context).size.height*0.2,
//                                           child: Image(image: NetworkImage("https://www.5paisa.com/mutual-funds/wp-content/uploads/cropped-stock-market-news-cover.jpg.webp"))),
//                                         Padding(
//                                           padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                           child: Text("Stock Market LIVE Updates: Nifty below 21,650, Sensex down 450 pts today; ICICI Bank, HDFC Bank, SBI drag",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500),)),
//                                         SizedBox(height: MediaQuery.of(context).size.height*0.009,),
//                                         Padding(
//                                             padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                                           child: Text("Sensex Today | Stock Market LIVE Updates: On the sectoral front, healthcare and IT indices up 0.5 percent each, while FMCG, PSU Bank, capital goods, metal, oil & gas, power and realty down 1-3 percent each.",style: TextStyle(fontSize: 9,fontWeight: FontWeight.w300),))
//                                       ],
//                                     ),
//                                   ),
//                                  ),
//   );

                               
// }
        
         
          
//       },
//       scrollDirection: Axis.vertical,
//       itemCount: newsdata.length,
//       ),
        
     
//     );

   
// }

// //-------------------newsColumn---------------------------------------------------------------

// Container newsColumn(String title,String description){

//   return Container(
//     width: 240,
//     color: Colors.white,
    
//     child:  Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//     Padding(
//     padding:const EdgeInsets.fromLTRB(8, 3, 0, 0),

//     child: HtmlWidget(title,textStyle:const  TextStyle(fontSize: 12),)
//     ,),
//   Padding(
//     padding:const EdgeInsets.fromLTRB(8, 3, 0, 2),
//         child: HtmlWidget(description,textStyle:const  TextStyle(fontSize: 9),)

//     ,)








    
//       ],
//     ),
//   );

// }
