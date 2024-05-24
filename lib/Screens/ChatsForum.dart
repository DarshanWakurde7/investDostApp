
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/widgets/addComment.dart';


 List<Comment> commentsdata = [];
class Comment {
  final int id;
  final String? message;
  final String? name;
  final String? profile_pic;
  final int? replyCount;
  final List<Comment> children;

  Comment({
    required this.id,
    required this.message,
    required this.name,
    required this.profile_pic,
    required this.replyCount,
    required this.children,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    List<Comment> childrenComments = [];
    if (json['children'] != null) {
      childrenComments = (json['children'] as List)
          .map((childJson) => Comment.fromJson(childJson))
          .toList();
    }
    return Comment(
      id: json['id'],
      message: json['message'],
      name: json['name'],
      profile_pic: json['profile_pic'],
      replyCount: json['replies_count'],
      children: childrenComments,
    );
  }
}

class ChatsForum extends StatefulWidget {

  ChatsForum({required this.roomname,required this.profileImage,required this.roomid,required this.topicId});
  String profileImage;
  int roomid,topicId;

String roomname;

  @override
  State<ChatsForum> createState() => _ChatsForumState();
}

class _ChatsForumState extends State<ChatsForum> {

  
  
   ScrollController scrollController=ScrollController();
@override
  void initState() {

   getApicallForChat();

    // TODO: implement initState
    
    super.initState();

  }



  void getApicallForChat() async{

    print("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${widget.profileImage}");

      commentsdata=await  ApiCalls.GetCommentByTOpics();
      setState(() {
        commentsdata=commentsdata.reversed.toList();
       
      });

      // scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeIn);


  }


  @override
  Widget build(BuildContext context) {
 
        var commetController=TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.roomname+"",),
          backgroundColor: Colors.amber,
          centerTitle: true,
          bottomOpacity: 0.1,
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.82,
             
                child: ListView.builder(
                 reverse: true,
                  controller: scrollController,
                   physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  itemCount: commentsdata.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: CommentWidget(comment: commentsdata[index],roomname: widget.roomname,profileImage: widget.profileImage,threadedComment: false,roomid: widget.roomid,topicid: widget.topicId,));
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                  backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${widget.profileImage}"),
                  backgroundColor: Colors.white,),
                  Container(
                   
                    width: MediaQuery.of(context).size.width*0.7,
                    child: TextField(controller: commetController,
                  
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: 
                     const  BorderSide(color: Colors.amber)
                      )
                    ),
                    )),
                    Transform.rotate(
                      angle: 24.5,
                      child: InkWell(
                        onTap: ()async{
                          print("${commetController.text.toString()},${widget.roomid},${widget.topicId}");
                              await ApiCalls.postComments(commetController.text.toString(),widget.roomid,widget.topicId);
                              getApicallForChat();
                            
                        // scrollController.animateTo(scrollController.position.maxScrollExtent, duration:const Duration(milliseconds: 500), curve: Curves.bounceIn);
                        },
                        child: const Icon(Icons.send,size: 28,color: Colors.amber,))),
               
                ],
              )
          
             
            ],
          ),
        ),
      );
    
  }
}

class CommentWidget extends StatefulWidget {
  
  final Comment comment;
  String roomname,profileImage;
  bool threadedComment;
  int roomid,topicid;

  CommentWidget({required this.comment,required this.roomname,required this.profileImage,required this.threadedComment,required this.roomid,required this.topicid});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {

    void getApicallForChat() async{



      commentsdata=await  ApiCalls.GetCommentByTOpics();
      setState(() {
        commentsdata=commentsdata.reversed.toList();
       
      });

      // scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeIn);


  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
          children: [

            CircleAvatar(
              backgroundColor: Colors.amber,
              backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${widget.comment.profile_pic}"),
              radius: 16,
            ),
            SizedBox(width: 10,),
             Text(
            '${widget.comment.name??"Invest Dost"} says:',
            style: TextStyle(
              fontWeight:FontWeight.w500,
              fontSize: 14

            ),
          )
          ],
         ),
          SizedBox(height: 2),
          Padding(
            padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
            child: Text(widget.comment.message??"")),

           Padding(
                padding: EdgeInsets.fromLTRB(45, 5, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        print("Like+1");
                      },
                      child: Icon(Icons.favorite_outline,size: 21,)),
                    //   SizedBox(width: 10,),
                    // InkWell(
                    //   onTap: (){
                    //     print("Dislike+1");
                    //   },
                    //   child: Icon(Icons.thumb_down_outlined,size: 17)),
                           SizedBox(width: 10,),

                    InkWell(onTap: ()async{
                        showModalBottomSheet(context: context, builder: (context){

                              return AddComment(index: widget.comment.id,onTapme: ()async{
                                    
                                    getApicallForChat();

                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reply Added",style: TextStyle(color: Colors.white),),backgroundColor: Colors.amber.shade300,));
                                    
                                   (widget.threadedComment)? {

                                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ChatsForum(roomname: widget.roomname,profileImage: widget.profileImage,roomid: widget.roomid,topicId: widget.topicid,))),
                                    Navigator.pop(context)
                                    
                                    } :   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ChatsForum(roomname: widget.roomname,profileImage: widget.profileImage,roomid: widget.roomid,topicId: widget.topicid,)));

                              },);

                              

                              


                        });
                      
                      
                        
                     
                    },
                    child: const Text("Reply",style: TextStyle(fontWeight: FontWeight.w500,),),
                    )
                  ],
                )),
            

          SizedBox(height: 8),
          if (widget.comment.children.isNotEmpty)
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ThreadedCommentsPage(comment: widget.comment,roomname:widget.roomname ,profile: widget.profileImage,roomid: widget.roomid,topicid: widget.topicid,),
                  ),
                );
              },
              child: Padding(
                
                padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                child: Text('View More Replies ${1+(widget.comment.replyCount??0)}')),
            ),





        ],
      ),
    );
  }
}


class ThreadedCommentsPage extends StatefulWidget {
  final Comment comment;
  String profile;
    String roomname;
    int roomid,topicid;
  ThreadedCommentsPage({required this.comment,required this.roomname,required this.profile,required this.roomid,required this.topicid});

  @override
  State<ThreadedCommentsPage> createState() => _ThreadedCommentsPageState();
}

class _ThreadedCommentsPageState extends State<ThreadedCommentsPage> {

    void getApicallForChat() async{



      commentsdata=await  ApiCalls.GetCommentByTOpics();
      setState(() {
        commentsdata=commentsdata.reversed.toList();
       
      });

      // scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeIn);


  }
  @override
  Widget build(BuildContext context) {
    var commentReplyController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(widget.roomname),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                   height: MediaQuery.of(context).size.height*0.825,
                  child: ListView.builder(
                    reverse: true,
                    itemCount: widget.comment.children.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: CommentWidget(comment: widget.comment.children[index],roomname: widget.roomname,profileImage:widget.profile,threadedComment: true,roomid: widget.roomid,topicid: widget.topicid,));
                    },
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                        backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${widget.profile}"),
                        backgroundColor: Colors.white,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          child: TextField(controller: commentReplyController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: 
                           const  BorderSide(color: Colors.amber)
                            )
                          ),
                          )),
                          Transform.rotate(
                            angle: 24.5,
                            child: InkWell(
                              onTap: ()async{
                                
                                  await ApiCalls.postReply(commentReplyController.text.toString(),widget.comment.id);
                                    await ApiCalls.GetCommentByTOpics();
                                    setState(() {
                                      widget.comment;
                                    });
                                    getApicallForChat();
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reply added")));
                                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ChatsForum(roomname: widget.roomname,profileImage: widget.profile,roomid: widget.roomid,topicId: widget.topicid,)));
                                
                              },
                              child: const Icon(Icons.send,size: 28,color: Colors.amber,))),
                     
                      ],
                    ),
                  )
              ],
            ),
             Card(
              elevation: 2,
                margin: EdgeInsets.all(5),
                color: Colors.white,
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                       color: Colors.white,
                      borderRadius: BorderRadius.circular(11)
                    ),
                 
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.amber,
                              child: Text((widget.comment.name??"InvestDost")[0]),
                            ),
                            SizedBox(width: 4,),
                            Text(widget.comment.name??"InvestDOst")
                          ],
                        ),
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50.0,0,0,0),
                        child: Text(widget.comment.message??"InvestDost Message",textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
