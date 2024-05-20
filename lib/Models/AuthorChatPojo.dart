class messageDart {
  int? senderId;
  String? type;
  String? senderName;
  String? image;
  String? senderProfilePic;
  String? content;
  String? createdAt;

  messageDart(
      {this.senderId,
      this.senderName,
      this.type,
      this.senderProfilePic,
      this.content,
      this.createdAt});

  messageDart.fromJson(Map<String, dynamic> json) {
    senderId = json['sender_id'];
    type = json['message_type'];
    image = json['image'];
    senderName = json['sender_name'];
    senderProfilePic = json['sender_profile_pic'];
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender_id'] = this.senderId;
    data['message_type'] = this.type;
    data['image'] = this.image;
    data['sender_name'] = this.senderName;
    data['sender_profile_pic'] = this.senderProfilePic;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    return data;
  }
}