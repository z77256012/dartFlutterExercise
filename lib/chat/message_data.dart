class MessageData{
  String avatar;
  String title;
  String subTitle;
  DateTime time;
  MessageType type;
  MessageData(this.avatar,this.title,this.subTitle,this.time,this.type);

}

class MessageSecData{
  String subTitle;
  String SettyTitle;
  MessageSecData(this.subTitle,this.SettyTitle);
}

enum MessageType{
  SYSTEM,
  PUBLIC,
  CHAT,
  GROUP
}

List<MessageData> messageData = [
      MessageData("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3850556269,186891222&fm=11&gp=0.jpg","大耳朵笑到","突然大兔兔",DateTime.now(),MessageType.CHAT),
  MessageData("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3850556269,186891222&fm=11&gp=0.jpg","大耳朵笑到","突然大兔兔",DateTime.now(),MessageType.CHAT),
  MessageData("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3850556269,186891222&fm=11&gp=0.jpg","大耳朵笑到","突然大兔兔",DateTime.now(),MessageType.SYSTEM),
  MessageData("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3850556269,186891222&fm=11&gp=0.jpg","大耳朵笑到","突然大兔兔",DateTime.now(),MessageType.CHAT),

];


List<MessageSecData> messageDats = [
  MessageSecData("", ""),
];