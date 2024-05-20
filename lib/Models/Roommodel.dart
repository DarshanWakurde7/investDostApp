class RoomModel{


  RoomModel({
    required this.id,
    required this.room_name,
    required this.created_by,
  });

int? id;
String? room_name;
int? created_by;

}
class RomTopic{


  RomTopic({
    required this.id,
    required this.topic,
    required this.created_by,
    required this.topic_id,
  });

int? id;
String? topic;
int? created_by;
int? topic_id;

}