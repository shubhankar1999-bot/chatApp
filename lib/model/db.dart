//@dart=2.9
import 'package:hive/hive.dart';

part 'db.g.dart';

@HiveType(typeId: 0)
class MessageModel{
  @HiveField(0)
  String username;
  @HiveField(1)
  String otherUser;
  @HiveField(2)
  List<String> allMessage=[];
}