import 'package:chat_app/MessageScreenComponents/messageDisplay.dart';
import 'package:chat_app/chatScreen.dart';
import 'package:chat_app/messageScreen.dart';
import 'package:chat_app/model/db.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MessageModelAdapter());
  await Hive.openBox<MessageModel>("User");
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":(context)=>Home(),
      "/chat":(context)=>ChatScreenUI(),
      "/message":(context)=>Messages(),
    },
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _myController=new TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _myController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: TextStyle(color: Colors.red),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _myController,
                decoration: InputDecoration(
                  hintText: "Enter Username",
                ),
                validator: (value){
                        if(value!.isEmpty){
                        return "You must Enter Username";
                         }
                          else if(value.length>8){
                        return "Username must be less than 8 letters";
                        }
                          },
              ),
            ),
            ElevatedButton(onPressed: (){
              if(_myController.text.isNotEmpty)
              Navigator.pushNamed(context, "/chat",arguments: {"user":_myController.text});
              }, child: Icon(Icons.send),)
          ],
        ),
      ),
    );
  }
}


