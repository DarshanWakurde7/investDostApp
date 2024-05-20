import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key,required this.image,required this.profileImage,required this.time});
final String image,profileImage,time;
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
              
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
            CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(profileImage),),
          ],
        ),
            Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,3,0,0),
                      child: Text(time,style: TextStyle(fontSize: 12),),
                    ),
      ],
    );
  }
}