import 'package:animated_emoji/animated_emoji.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Subscriptionpage extends StatefulWidget {
  const Subscriptionpage({super.key});

  @override
  State<Subscriptionpage> createState() => _SubscriptionpageState();
}

class _SubscriptionpageState extends State<Subscriptionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(height: 40,),
          Align(alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,10,10,0),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.close,size: 28,))),),

              Container(height: 10,),

          Text("Choose Your Plan",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
          
          Container(height: 10,),
          Padding(
            padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
            child: Text("Get full Access to Daily briefings, expert insights, markets guides and more",textAlign: TextAlign.center,)),


         
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.2,
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
         
                image:DecorationImage(image: AssetImage("assets/images/investD-removebg-preview.png"))
              ),
              
            ),
         
            Container(
                color: Colors.white,
              width: MediaQuery.of(context).size.width,
          
           child: CarouselSlider.builder(itemCount: 5, itemBuilder: (context,ind,index){

                return Card(
                  color: Colors.white,
                      elevation: 8,
                    child: Container(
                       width: MediaQuery.of(context).size.width,
                       
                      //  margin: EdgeInsets.all(5),
                       decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                       ),
                       child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                         child: Column(
                          children: [
                              SizedBox(height: 5,),
                            Text("My go-to investing app",textAlign:TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            SizedBox(height: 2,),
                            Text('''My go to app for getting news and insights in a truly digestible way. super simple to read and undersd.digestible way. super simple to read and undersd.digestible way. super simple to read and undersd.'''),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height*0.05,
                            
                        
                                 child: Align(
                                  alignment: Alignment.center,
                                   child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder: (context,ind){
                                      return Icon(Icons.star,color: Colors.amber,);
                                    }),
                                 )
                       
                            ),

                    





                          ],
                         ),
                       ),
                    ),

                );

           }, options: CarouselOptions(
            enlargeCenterPage: true,
           )),

            ),


SizedBox(height: 15,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                           color: Colors.white,
                          border:Border.all(
                            color: Colors.blueAccent
                            
                    
                          )
                        ),
                       
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10,),
                                        Text("Get Your Dost Now",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                        SizedBox(height: 5,),
                                        Text("₹ 200/Month"),
                                        SizedBox(height: 10,),
                                      ],
                                    ),
                      
                              ),
                    ),
                  ),

                  
SizedBox(height: 25,),

GestureDetector(
  onTap: (){
    Navigator.pop(context);
  },
  child: Padding(
    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
    child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.08,
      decoration: BoxDecoration(
            color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.black
        ),
        
      ),
      child: Center(child: Text("Subscribe now",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)),
    ),
  ),
)
                  
        ],
      ),
    );
  }
}