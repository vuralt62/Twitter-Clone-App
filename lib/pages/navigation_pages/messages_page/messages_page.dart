import 'package:flutter/material.dart';
import 'package:twitter_clone/components/appbar_circle_image_widget.dart';
import 'package:twitter_clone/pages/chat_page/chat_page.dart';
import 'package:twitter_clone/pages/navigation_pages/drawer_page/drawer_page.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/current_user_data.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/post_modal.dart';
import 'package:twitter_clone/services/post_service.dart';

class MessagesPage extends StatelessWidget {
  MessagesPage({Key? key}) : super(key: key);

  final Post post = PostService().getPosts().first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      body: CustomScrollView(
        slivers: <Widget>[
          _appbar(context),
          _messageList(context),
        ],
      ),
    );
  }

  SliverList _messageList(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(List.generate(
            100,
            (index) => ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ChatPage()));
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(User.currentUser.photo),
                    radius: 24,
                  ),
                  title: Row(
                    children: [
                      Text(
                        "${post.name} ",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        "@${post.userName}",
                        style: Theme.of(context).textTheme.subtitle2,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Hello",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  trailing: Text(
                    "56 min",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ))));
  }

  SliverAppBar _appbar(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 56,
      //expandedHeight: 100,
      //pinned: true,
      centerTitle: true,
      leading: const AppbarCircleImage(),
      title: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            filled: true,
            fillColor: Theme.of(context).splashColor,
            hintText: "Search on DM",
            hintStyle: const TextStyle(fontWeight: FontWeight.normal),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(99),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ))),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
      ],
    );
  }
}
