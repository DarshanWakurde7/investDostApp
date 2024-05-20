import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SenderWidget extends StatelessWidget {
  const SenderWidget({super.key,required this.message,required this.profileImg,required this.time});
  final String message,profileImg,time;

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding:  EdgeInsets.fromLTRB(0,3,10,0),
            child: Row(
              
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
              
              
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                       constraints: BoxConstraints(maxWidth:MediaQuery.of(context).size.width*0.65,),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade300,
                          borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(23),
                          bottomLeft: Radius.circular(23),
                          topLeft: Radius.circular(23)
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(message,style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white),)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,3,0,8.0),
                        child: Text(time,style: TextStyle(fontSize: 12),),
                      ),
                    ],
                  ),
                    SizedBox(width: 6,),
                      CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(profileImg),),
                ],
              ),
          );
  }
}