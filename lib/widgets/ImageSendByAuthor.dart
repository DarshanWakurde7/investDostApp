import 'package:flutter/material.dart';

class ImageSendByuser extends StatelessWidget {
  const ImageSendByuser({super.key,required this.image,required this.profileImage,required this.time});
final String image,profileImage,time;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                CircleAvatar(
                        radius: 14,
                        backgroundImage: NetworkImage(profileImage),),
              Container(
                height: MediaQuery.of(context).size.height*0.25,
                width: MediaQuery.of(context).size.height*0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(image)),
      
                     borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(23) ,
                                topRight: Radius.circular(23),
                                bottomLeft: Radius.circular(23),
                            
                              )
                ),
              ),
              
            ],
          ),
              Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,3,0,0),
                        child: Text(time,style: TextStyle(fontSize: 12),),
                      ),
        ],
      ),
    );
  }
}