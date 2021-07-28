//@dart=2.9
import 'package:chat_app/constants.dart';
import 'package:chat_app/model/chatModel.dart';
import 'package:flutter/material.dart';

class ChatScreenUI extends StatefulWidget {
  @override
  _ChatScreenUIState createState() => _ChatScreenUIState();
}

class _ChatScreenUIState extends State<ChatScreenUI> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("CHAT"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: containerRadius),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 10),
          child: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context, i) => GestureDetector(
              onTap: (){
                Navigator.pushNamed(context,'/message',arguments: {"name":dummyData[i].name,
                  "avatarUrl":dummyData[i].avatarUrl,
                  "online":dummyData[i].online,
                  "user":data["user"],
                });
              },
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        dummyData[i].avatarUrl,
                      ),
                      radius: 26,
                      child: dummyData[i].online
                          ? Container(
                        margin: EdgeInsets.only(bottom: 40, right: 40),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                      )
                          : Container(),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dummyData[i].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          dummyData[i].time,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            if (dummyData[i].seen)
                              Icon(
                                Icons.done_all,
                                size: 18,
                                color: Colors.blue[600],
                              ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                dummyData[i].message,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            if (!dummyData[i].seen)
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 70,
                    endIndent: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
