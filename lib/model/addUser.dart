import 'package:chat_app/model/db.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes{
  static Box<MessageModel> getUserDetail()=>Hive.box<MessageModel>("User");
}