import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<AddProfile> createState() => _AddProfileState();
}


class _AddProfileState extends State<AddProfile> {
  TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
        
                     
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)
                        
                        ),
          
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                controller:textEditingController ,
                                    
                              ),
                            ),
                            SizedBox(height: 5,),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ElevatedButton(onPressed: ()async{
                                  
                                  // await ApiCalls.postReply(commentData.text.toString(),index);
                                //  await onTapme();
                                   Navigator.pop(context);
                                }, child: Text("Post Comment",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                                ),
                              )
                          ],
                        ),
          
                      ),
        ),
      ),
    );
  }
}