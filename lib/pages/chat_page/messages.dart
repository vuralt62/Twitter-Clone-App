enum Owner { sender, receiver }

class Message {
  late Owner owner;
  late String text;
  List? photo;
  late String dateTime;

  Message(this.owner, this.text, this.photo, this.dateTime);
}
