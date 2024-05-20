

import 'package:flutter/material.dart';

var court=['https://c8.alamy.com/comp/ACBGRT/high-section-view-of-a-government-building-supreme-court-new-delhi-ACBGRT.jpg','https://c8.alamy.com/comp/ACBGRT/high-section-view-of-a-government-building-supreme-court-new-delhi-ACBGRT.jpg','https://c8.alamy.com/comp/ACBGRT/high-section-view-of-a-government-building-supreme-court-new-delhi-ACBGRT.jpg','https://c8.alamy.com/comp/ACBGRT/high-section-view-of-a-government-building-supreme-court-new-delhi-ACBGRT.jpg','https://c8.alamy.com/comp/ACBGRT/high-section-view-of-a-government-building-supreme-court-new-delhi-ACBGRT.jpg','https://c8.alamy.com/comp/ACBGRT/high-section-view-of-a-government-building-supreme-court-new-delhi-ACBGRT.jpg'];

class Notification1 extends StatefulWidget{
  @override
  State<Notification1> createState() => _NotificationState1();
}

class _NotificationState1 extends State<Notification1> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
body: Center(
child: Column(
  children: [

    Padding(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 5),
      child: fields(context,"Notification")),
Padding(
  padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
  child: newsCard()
  ),



  ]
  ),

),

);
  }
}




Container fields(BuildContext context,String title){

  return Container(
    height:MediaQuery.of(context).size.height*0.05 ,
    color: Colors.amber,
    child: Row(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [



  

    Text(title,style: const TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
   
      ],
      
      ),

  ); 
}






//------------------news Headline------------------------------------------------------------------------




Container newsCard(){


  return Container(
  height: 695,
  color: Colors.white,

    child: ListView.builder(itemBuilder: (context,ind){
      
      return Card(
        color: Colors.white,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        elevation: 10,
        child: Row(
          
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          
          children: [

          newsColumn(),
           Container(
            color: Colors.white,
            width: 110,
          height: 200,
          child: Image(image: NetworkImage(court[ind]),
          alignment: Alignment.centerRight,
          ),
          
          ),
        ],
        
        ),
        
          );
       
        
    },
scrollDirection: Axis.vertical,
itemCount: court.length,
    ),

  ); 
}

//-------------------newsColumn---------------------------------------------------------------

Container newsColumn(){

  return Container(
    width: 240,
    
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    Padding(
    padding:EdgeInsets.fromLTRB(8, 3, 0, 0),
    child: Text("Pujara’s century and Atharva’s nine-wicket haul steal show",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
    softWrap: true,
    maxLines: 2
    ,)
    ,),
  Padding(
    padding:EdgeInsets.fromLTRB(8, 3, 0, 2),
    child: Text("“We have noted the verdict today of the Court of Appeal of Qatar in the Dahra Global case, in which the sentences have been reduced. The detailed judgement is awaited,” a media release from the Ministry said.India’s Ambassador to Qatar, Vipul, the family members of the jailed Indians, and Embassy officials were present in the Court of Appeal when the verdict was pronounced.A Qatar court on October 26 handed death sentence to eight former Indian Navy officials on charges of spying on a submarine programme on behalf of Israel. They were working in Al Dahra, a Doha-based private defence services provider.",style: TextStyle(fontSize: 10),
    softWrap: true,
    maxLines: 6,
    overflow: TextOverflow.ellipsis
    ,)
    ,)


    
      ],
    ),
  );

}