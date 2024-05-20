

import 'package:flutter/material.dart';

class CardofPage extends StatelessWidget{

  const  CardofPage({required this.NameofAutor,required this.imagePath, required this.TitleName,required this.isFree,required this.authorsImage});

final String NameofAutor,imagePath,TitleName,authorsImage;
final int isFree;


 
  @override
  Widget build(BuildContext context) {
 return Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Color.fromARGB(255, 225, 234, 249)))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${authorsImage??""}"),radius: 14,),
                          SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                          Text(NameofAutor,overflow: TextOverflow.clip,),
                   
              
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Hero(
                        tag: "myImage",
                        child: Container(
                          // width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.2,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(image: NetworkImage(imagePath),fit: BoxFit.cover),
                                      
                        ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Visibility(
                                visible: (isFree==0),
                                child: Icon(Icons.lock,color: Colors.white,size: 18,)),
                            ),
                          ),            
                        ),
                      ),
              
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child:Text(TitleName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
                              )
              
              
              
                ],
              ),
            );
  }

}



