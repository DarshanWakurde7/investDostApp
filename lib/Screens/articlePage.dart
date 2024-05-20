
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investdost/Screens/ListofArtcles.dart';
import 'package:investdost/Screens/ProfileScreen.dart';
import 'package:investdost/Screens/mainLanderPage.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:investdost/Models/ArticlePojo.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:investdost/Screens/notification.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:url_launcher/url_launcher.dart';



class articlepage extends StatefulWidget{

 const  articlepage({Key? key, required this.title,required this.id,required this.checkAricle,required this.profileString}) : super(key: key); 

  final String title;
  final int id;
  final Function checkAricle;
  final String profileString;
 @override 
  State<articlepage> createState() => articlepageState();


}

class articlepageState extends State<articlepage>{

 DataOfArticles dataOfArticle=new DataOfArticles();

List<String> dataofTags=[];
IconData bookIcon=Icons.bookmark_outline;
List<DataOfArticles> reletedArticles=[];
bool visibleFeedbackemoji=true;


@override
  void initState() {

    getApicall();




    // TODO: implement initState
    super.initState();
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
  ]);
  }




  void getApicall() async{


dataOfArticle=await ApiCalls.getFullArticsle(widget.id);
bookIcon=(bookmarkids.contains(dataOfArticle.id))?Icons.bookmark_added:Icons.bookmark_add_outlined;
reletedArticles=await ApiCalls.getRelatedArtcles(dataOfArticle.categoryId??0);

setState(() {
  
    bookIcon;
  dataOfArticle;
  dataofTags=dataOfArticle.tagNames??[];
  reletedArticles;
});

  }

   void shareDeepLink(BuildContext context) {
    final String deepLink = generateDeepLink();
    // Use url_launcher to open the deep link
    launch(deepLink);
  }

    String generateDeepLink() {
    
    return 'https://investdost-dev.portalwiz.in/';
  
  }




  @override
  Widget build(BuildContext context) {

        return Scaffold(


body: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      
          Padding(
            padding: EdgeInsets.fromLTRB(0, 35, 0, 5),
            child: fields(context,"Article")
            ),

        
           
           Container(
            width:MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height*0.883,
             child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text("${dataOfArticle.title??"...."}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
                )
                ),



                       Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: GestureDetector(
                onTap: (){
                  Get.to(ListOfArticles(id: dataOfArticle.categoryId??0,profileImg: widget.profileString,categoryname: dataOfArticle.categoryString??"Investdost",));
                },
                child: Card(
                  borderOnForeground: true,
                  color: Colors.white,
                  child: Container(
                
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                  color: Colors.amber.shade300,
                          ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,4,8,4),
                  child: Text(dataOfArticle.categoryString??"Articles"),
                ),
                ),),
              ),
            ),
                   
                       Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            
                  child: Hero(
                    tag: "myImage",
                    child: Container(
                      width:MediaQuery.of(context).size.width-25 ,
                      height: 250,
                      decoration:  BoxDecoration(
                        
                        image: DecorationImage(image: NetworkImage(widget.title),fit: BoxFit.contain)
                      ),
                    
                      
                    
                    
                         
                        
                                    
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: ()async{
                            

                                    if(bookmarkids.contains(dataOfArticle.id)){

                                       bool mydata=await ApiCalls.removeBookmark(dataOfArticle.id??0);

                                          if(mydata){
                                  print(mydata);
                                  Get.rawSnackbar(

                                    title: "Bookmark Removed!!",
                                    message: dataOfArticle.title,
                                    icon: Icon(Icons.check),
                                    backgroundColor: Colors.amber.shade300
                                  );
                                                                  }

                                    }else{

                                 bool mydata=await ApiCalls.addBookmark(dataOfArticle.id??0);
                                if(mydata){
                                  print(mydata);
                                  Get.rawSnackbar(

                                    title: "Bookmark Added Successfully",
                                    message: dataOfArticle.title,
                                    icon: Icon(Icons.check),
                                    backgroundColor: Colors.amber.shade300
                                  );
                                                                  }
                                    }
                          
                                  bookMarks=await ApiCalls.fetchBookmarks();
                                  bookmarkids= await ApiCalls.getBookMarkIds();
                                      widget.checkAricle();
                                  setState(() {
                                    bookMarks;
                                    bookmarkids;
                                    bookIcon=(bookmarkids.contains(dataOfArticle.id))?Icons.bookmark_added:Icons.bookmark_add_outlined;
                                  });
                              
                            },
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                child: Icon(bookIcon)),
                            ),
                          )
                    
                    
                    
                    
                                
                    
                                  
                    ),
                  ),
            
                       ),


                     Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: GestureDetector(
                  onTap: (){
                    Get.to(Profile(authorid: 1,authorslug: dataOfArticle.authorSlug??"",userString: widget.profileString,));
                  },
                  child: Row(
                    children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${dataOfArticle.profilePic??"profile_pic/1712818972_IMG_20240409_220900.jpg"}"),
                            radius: 16,
                          ),
                                  SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                            Text(dataOfArticle.createdByString??"ken",overflow: TextOverflow.clip,style: TextStyle(fontWeight: FontWeight.w500),),
                    ],
                    ),
                ),
                
                
                ),








                       Container(
                        
                        height: MediaQuery.of(context).size.height*0.07,
                         child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dataofTags.length,
                          itemBuilder: (context,ind){
                          return Padding(
                            padding: EdgeInsets.all(5),
                            child: Card(
                                  color: Colors.white,
                                  elevation: 1.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(dataofTags[ind],style: TextStyle(fontSize: 14,color: Colors.black),),
                                )
                            ));
                         }),
                       ),
                       
               Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: HtmlWidget(
                  dataOfArticle.content??"Loading ...",textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w300),
                onTapUrl: (url){

                  bool _isFullScreen = false;

                  if(url.contains("youtube")){

                     YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(url)!,
flags: YoutubePlayerFlags(
  autoPlay: true,
 showLiveFullscreenButton: true,
)
);
bool _isYoutubeFullScreen = false;

_controller.addListener(() {
  if (_controller.value.isFullScreen != _isYoutubeFullScreen) {
    setState(() {
      _isYoutubeFullScreen = _controller.value.isFullScreen;
      if (!_isYoutubeFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }
});







                       showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context){
                          

                         return Dialog(
                          
                          child: Container(
           
                            child: YoutubePlayer(
                              aspectRatio: 4/3,
                              controller: _controller,

),
                          ),
                         );
                       }).then((value) {
setState(() {
   SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
});
                         
                       });


  





                  }
                  else if(url.contains("mp4")){

    VideoPlayerController  _controller = VideoPlayerController.networkUrl(Uri.parse(url))
      ..initialize().then((_) {
        setState(() {});
      });
                       showDialog(context: context,
                        builder: (context){
                      _controller.play();
                         return Dialog(
                            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                
                children: <Widget>[
                  VideoPlayer(_controller),
                  ClosedCaption(text: _controller.value.caption.text),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      child: Icon(Icons.open_in_browser,color: Colors.white,size: 24,),
                      onTap: (){
                 launchUrl(Uri.parse(url));
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.play_arrow,color: Colors.white,size: 24,)),
                      onTap: (){
             if(_controller.value.isPlaying){
              _controller.pause();
             }
             else{
              _controller.play();
             }
                      },
                    ),
                  ),
                  Align( 
                    alignment: Alignment.bottomCenter,
                    child: VideoProgressIndicator(_controller, allowScrubbing: true)),
                ],
              ),
            ),
                          
                         );
                       });





                  }
                  else{
                 
               final response=jsonDecode(url);
               print(response["name"]);
                  }
               
                    print("Heekldcmlksdmcsdlkmc");
                   return true;   
                },
                )),

SizedBox(height: MediaQuery.of(context).size.height*0.055,),

                Card(

                  color: Colors.white,
                     margin: EdgeInsets.all(15),
                  elevation: 2,
                  child: Container(

                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.white,
                      border: Border(
                      
                      top: BorderSide(color: Color.fromARGB(0, 0, 0, 0),width: 2.5)
                      )),
                              
                                
                  
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                                       
                        Visibility(
                          visible: visibleFeedbackemoji,
                          child: Text("Did You found this Article Helpful ?",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                         Visibility(
                          visible: visibleFeedbackemoji,
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Cardofemojis(data: AnimatedEmojis.thumbsDown,addreview: ()async{
                                  await ApiCalls.FeedbackforArticle(dataOfArticle.id??0, 1);
                                  setState(() {
                                    visibleFeedbackemoji=!visibleFeedbackemoji;
                                  });
                            },),
                                Container(width: 10,),
                           
                                  Container(width: 20,),
                                  Cardofemojis(data: AnimatedEmojis.thumbsUp,addreview: ()async{
                                 await ApiCalls.FeedbackforArticle(dataOfArticle.id??0, 1);
                                 setState(() {
                                   visibleFeedbackemoji=!visibleFeedbackemoji;
                                 });
                                  },),
                                Container(width: 10,),
                           
                                // Container(width: 20,),
                                //    Cardofemojis(data: AnimatedEmojis.smile),
                                // Container(width: 10,),
                                Visibility(
                          visible: (!visibleFeedbackemoji),
                          child: Text("Thankyou for the Review",style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w600,backgroundColor: Colors.greenAccent),)),
                              ],
                              ),
                         ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                       ],
                     ),
                   )
                  ),
                

                Card(
                  color: Colors.white,
  child: Container(
    color: Colors.white,
    width:double.infinity,
    height: MediaQuery.of(context).size.height*0.4,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("RELATED CONTENT",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
      ),

            Container(
              margin: EdgeInsets.all(5),
           
            height: MediaQuery.of(context).size.height*0.32,
            child: ListView.builder(
              itemCount: reletedArticles.length,
              scrollDirection: Axis.horizontal,
              padding:EdgeInsets.zero,
              itemBuilder: (context,ind){
              
              return GestureDetector(
                onTap: (){
print("okk");
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>articlepage(title: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${reletedArticles[ind].featuredImgPath}", id: reletedArticles[ind].id??0,checkAricle: (){},profileString: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${widget.profileString??""}",)
));
                },
                child: Container(
                     width: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                          
                        Container(
                          height: 210,width: 200,
                        decoration: BoxDecoration(
                         image: DecorationImage(image: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${reletedArticles[ind].featuredImgPath??"featured_image/1706095138_Mainstream Financial Institutions Embrace Crypto.webp"}",),
                         fit: BoxFit.cover
                         
                         ),
                          borderRadius: BorderRadius.circular(11)
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(reletedArticles[ind].title??"....",style: TextStyle(fontSize: 14.2,fontWeight: FontWeight.w500),maxLines: 2,),
                        ),
                    ],
                  ),
                ),
              );
        }),
      )
      
    ],),
  ),
)
                   

                ],
               ),
             ),
           ),





    
      
      
      
      
        ]
        ),
);





        

  }


}


//animated emojis

class Cardofemojis extends StatelessWidget{

  Cardofemojis({required this.data,required this.addreview});

AnimatedEmojiData data;
Function addreview;

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: (){
        addreview();
      },
      child: Card(
                        color: Colors.white,
                        elevation: 14,
                        child: Container(
                          decoration:const  BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.white),
                          width: MediaQuery.of(context).size.width*0.2,
                          height: MediaQuery.of(context).size.height*0.095,
                          
                          child: Center(child: AnimatedEmoji(data,size: 36,),),
                        ),
                      ),
    );
  }


}