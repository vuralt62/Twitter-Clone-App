import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twitter_clone/pages/chat_page/messages.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/current_user_data.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  Radius radius = const Radius.circular(16);

  List<Message> messages = [
    Message(Owner.receiver, "text", null, "14.04.2022"),
    Message(Owner.receiver, "text", null, "14.04.2022"),
    Message(Owner.receiver, "text", null, "14.04.2022"),
    Message(Owner.receiver, "text", null, "14.04.2022"),
    Message(Owner.receiver, "text", null, "14.04.2022"),
    Message(Owner.sender, "text", null, "14.04.2022"),
    Message(Owner.sender, "text", null, "07/02/2022"),
    Message(Owner.receiver, "text", null, "05/02/2022"),
    Message(Owner.sender, "text", null, "05/02/2022"),
    Message(Owner.receiver, "text", null, "27/01/2022"),
    Message(Owner.sender, "text", null, "27/01/2022"),
    Message(Owner.sender, "text", null, "27/01/2022"),
    Message(Owner.receiver, "text", null, "20/12/2021"),
    Message(Owner.sender, "text", null, "20/12/2021"),
    Message(Owner.receiver, "text", null, "20/12/2021"),
    Message(Owner.sender, "text", null, "20/12/2021"),
  ];

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text.length < 2) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              User.currentUser.name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              "@${User.currentUser.userName}",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline))],
      ),
      body: _body(context),
    );
  }

  Column _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _chatzone(),
        _bottomBar(context),
      ],
    );
  }

  Expanded _chatzone() {
    return Expanded(
          child: ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          Message message = messages[index];
          bool isSeries = false;
          bool isLast = true;
          if (messages.length - 1 > index) {
            if (message.owner == messages[index + 1].owner && message.dateTime == messages[index + 1].dateTime) {
              isSeries = true;
              isLast = true;
            }
          }

          if (index > 0) {
            if (message.owner == messages[index - 1].owner && message.dateTime == messages[index - 1].dateTime) {
              isLast = false;
            }
          }
          return Padding(
            padding: !isLast
                ? const EdgeInsets.symmetric(vertical: 1, horizontal: 8)
                : const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              mainAxisAlignment: message.owner == Owner.receiver ? MainAxisAlignment.start : MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message.owner == Owner.receiver
                    ? SizedBox(
                        width: 50,
                        height: 32,
                        child: !isSeries
                            ? Center(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(User.currentUser.photo),
                                  radius: 16,
                                ),
                              )
                            : null,
                      )
                    : const SizedBox(),
                Column(
                  crossAxisAlignment:
                      message.owner == Owner.receiver ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: message.owner == Owner.receiver
                              ? const Color.fromRGBO(60, 85, 99, 1)
                              : Theme.of(context).floatingActionButtonTheme.backgroundColor,
                          borderRadius: message.owner == Owner.receiver
                              ? BorderRadius.only(
                                  topLeft: isSeries ? const Radius.circular(0) : radius,
                                  topRight: radius,
                                  bottomRight: radius,
                                )
                              : BorderRadius.only(
                                  topLeft: radius,
                                  topRight: isSeries ? const Radius.circular(0) : radius,
                                  bottomLeft: radius,
                                )),
                      child: Text(message.text),
                    ),
                    isLast
                        ? Row(
                            children: [
                              Text(
                                message.dateTime,
                                style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w400),
                              ),
                              message.owner != Owner.receiver
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white30,
                                      size: 16,
                                    )
                                  : const SizedBox()
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          );
        },
      ));
  }

  FittedBox _bottomBar(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.image_outlined, color: Theme.of(context).floatingActionButtonTheme.backgroundColor)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.gif_box_outlined,
                color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
              )),
          _textfield(context),
          const VerticalDivider(
            color: Colors.white,
            thickness: 1,
          ),
          _controller.text.isEmpty
              ? _changingIcon()
              : IconButton(
                  onPressed: () {
                    messages.insert(
                        0,
                        Message(Owner.sender, _controller.text, null,
                            DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()));
                    _controller.text = "";
                  },
                  icon: Icon(
                    Icons.send_outlined,
                    color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
                  )),
        ],
      ),
    );
  }

  IconButton _changingIcon() {
    return _controller.text.isEmpty
        ? IconButton(onPressed: () {}, icon: const Icon(Icons.multitrack_audio, color: Colors.deepPurpleAccent))
        : IconButton(
            onPressed: () {
              messages.insert(
                  0,
                  Message(Owner.sender, _controller.text, null,
                      DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()));
              _controller.text = "";
            },
            icon: Icon(
              Icons.send_outlined,
              color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
            ));
  }

  SizedBox _textfield(BuildContext context) {
    return SizedBox(
        width: 250,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: "Start a message",
            hintStyle: Theme.of(context).textTheme.subtitle2,
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              messages.insert(
                  0, Message(Owner.sender, value, null, DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()));
              _controller.text = "";
            }
          },
        ));
  }
}
