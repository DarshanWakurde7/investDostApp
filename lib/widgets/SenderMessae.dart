import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SenderMessage extends StatelessWidget {
  const SenderMessage({super.key,required this.message,required this.profileImg,required this.time});
 final String message,profileImg,time;
  @override
  Widget build(BuildContext context) {
    return   Padding(

            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(profileImg),),
                SizedBox(width: 6,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(  maxWidth: MediaQuery.of(context).size.width*0.65,),
                    
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 237, 243, 245),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(23),
                          bottomLeft: Radius.circular(23),
                          bottomRight: Radius.circular(23)
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(message,style: TextStyle(fontWeight: FontWeight.w400),)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,3,0,0),
                      child: Text(time,style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
               
              ],
            ),
          );
  }
}