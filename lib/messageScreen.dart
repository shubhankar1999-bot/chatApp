//@dart=2.9

import 'package:chat_app/MessageScreenComponents/messageDisplay.dart';
import 'package:flutter/material.dart';

import 'model/addUser.dart';
import 'model/db.dart';
class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  String name;
  String user;
  Map data = {};
  final _user = MessageModel();
  TextEditingController _myController=new TextEditingController();
  Future getUser(String user,String otherUser,String messages)async{
    print(messages);
    _user.username=user;
    _user.otherUser=otherUser;
    _user.allMessage.add(messages);
    final box = Boxes.getUserDetail();
    box.add(_user);
  }

  @override
  void dispose() {
    super.dispose();
    _myController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    name=data["name"];
    user=data["user"];

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                  SizedBox(width: 2,),
                  CircleAvatar(
                    backgroundImage: NetworkImage(data["avatarUrl"]),
                    maxRadius: 20,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(data["name"],style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                        SizedBox(height: 6,),
                        Text(data["online"]==true?"Online":"Offline",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                      ],
                    ),
                  ),
                  Icon(Icons.settings,color: Colors.black54,),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            DisplayMessage(name, user),

            Container(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                          height: 60,
                          width: double.infinity,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Icon(Icons.add, color: Colors.white, size: 20, ),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Expanded(
                                child: TextField(
                                  controller: _myController,
                                  decoration: InputDecoration(
                                      hintText: "Write message...",
                                      hintStyle: TextStyle(color: Colors.black54),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              SizedBox(width: 15,),
                              FloatingActionButton(
                                onPressed: (){
                                  if(_myController.text!=null) {
                                    getUser(data["name"], data["user"], _myController.text);
                                    Navigator.popAndPushNamed(context, "/message",arguments: data);
                                  }
                                  setState(() {
                                    user=data["user"];
                                    name=data["name"];
                                  });
                                },
                                child: Icon(Icons.send,color: Colors.white,size: 18,),
                                backgroundColor: Colors.blue,
                                elevation: 0,
                              ),
                            ],

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
    );
  }
}
