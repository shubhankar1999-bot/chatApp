//@dart=2.9
import 'package:chat_app/model/addUser.dart';
import 'package:flutter/material.dart';

class DisplayMessage extends StatefulWidget {
  final String user;
  final String user2;
  DisplayMessage(this.user,this.user2);
  @override
  _DisplayMessageState createState() => _DisplayMessageState();
}

class _DisplayMessageState extends State<DisplayMessage> {
  List<String> message=["Start Conversation"];
   displayUser()async{
    final box = Boxes.getUserDetail();
    for(int i=0;i<box.length;i++){
      var details=box.getAt(i);
      print(widget.user+"  "+widget.user2);
      print(details.username+"    "+details.otherUser);
      if(details.otherUser==widget.user2 && details.username==widget.user) {
        message.add(details.allMessage[0]);
      }
    }
    if(message[0]!="Start Conversation"){
      return message;
    }
  }
  @override
  void initState() {
    super.initState();
    displayUser();
    print(widget.user);
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView.builder(
            itemCount: message.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                  alignment: (Alignment.topRight),
                  //(messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (Colors.blue[200]),
                      //(messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(message[index]!=null?message[index]:null, style: TextStyle(fontSize: 15),),
                    //Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


