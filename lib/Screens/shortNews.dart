
import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:investdost/Models/ArticlePojo.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/articlePage.dart';
import 'package:investdost/Screens/mainLanderPage.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';





//---------------------newWidget---------------------------------------


class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key? key,
    required this.colors,
    this.testingController,
  }) : super(key: key);

  // This is a parameter to support testing in this repo
  final Controller? testingController;
  final List colors;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}


class _HomeWidgetState extends State<HomeWidget> {
  late Controller controller;
  DataOfArticles dataofAricle=DataOfArticles();

  @override
  initState() {

    getBookmarksApi();
    controller = widget.testingController ?? Controller()
      ..addListener((event) {
        _handleCallbackEvent(event);
      });

print("Length of Bookmarks:-${bookMarks.length}");
   
    super.initState();
  }


   void  getBookmarksApi()async{
        bookMarks=await ApiCalls.fetchBookmarks();
        setState(() {
          bookMarks;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bookMarks.isEmpty?Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedEmoji(AnimatedEmojis.anguished,size: 55,),
          SizedBox(height: 10,),
          Text("Sorry no bookmarks",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
        ],
      ),)
      :TikTokStyleFullPageScroller(
          
          contentSize:bookMarks.length,
          swipePositionThreshold: 0.2,
        
          swipeVelocityThreshold: 1000,
           
          animationDuration: const Duration(milliseconds: 100),
            
          controller: controller,
             
            
          builder: (BuildContext context, int index) {
        print(bookMarks[index].id??0);
           
            String image=bookMarks[index].featuredImgPath??"";
            return  GestureDetector(

        onHorizontalDragEnd: (details) {
              if(details.primaryVelocity!.compareTo(0)==-1){
print("Hello");
Get.to(articlepage(title: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${image}", id: bookMarks[index].id??0,checkAricle: (){
  print("Hello Woeld");
    getBookmarksApi();
},profileString: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${image}",),transition: Transition.rightToLeft,duration: Duration(milliseconds: 250));
              }
        },
              child: Container(
                  color: Colors.white,
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
                  
                    )
                  ),
                      
                      
                ),
                
                
                
                 Padding(
                    padding: EdgeInsets.fromLTRB(10,15,10,10),
                    child: Text("Investdost",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: AutofillHints.birthday,fontSize: 22,color: Colors.amberAccent),)),
                
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(bookMarks[index].title??"Subscribe to InvestDost And get Access to new Dost Versions", style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: HtmlWidget((bookMarks[index].content==null)?'''IT stocks fell at open on March 5 on the NSE after brokerage CLSA downgraded TCS and HCL and reiterated its "sell" call on Wipro and LTIMindtree. While the 2024 growth outlook on the sector remains "weak at best", this is not being reflected in valuations of the stocks, CLSA analysts have said.
                
                All four stocks closed almost a percent down on March 4. At open, TCS was trading at Rs 4,033.10 (-1.1 percent), HCL at Rs 1,608.55 (-1.79 percent), Wipro at Rs 518.65 (-0.35 percent) and Rs 5,177.80 (-0.75 percent).
                Follow our market blog for live updates
                The top-down approach to IT services sector demand outlook was reminiscent of 2019 and the 2024 guidance from global companies didn't exude confidence, it said.'''.substring(0,120):
                  
                  bookMarks[index].content!.substring(0,80),
                  
                  ),
                ),



                
                
                
                
                
                
              
                  ],
                ),
              ),
            );
          },
        ),


      );
    
  }

  void _handleCallbackEvent(ScrollEvent event) {
    print(
        "Scroll callback received with data: {direction: ${event.direction}, success: ${event.success} and page: ${event.pageNo ?? 'not given'}}");
    if (event.percentWhenReleased != null) {
      print("Percent when released: ${event.percentWhenReleased}");
    }
  }
  
  void getArticlefull(int bookMark) async{

dataofAricle=await ApiCalls.getFullArticsle(bookMark);
setState(() {
  dataofAricle;
});

  }
}