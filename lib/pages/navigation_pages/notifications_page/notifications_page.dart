import 'package:flutter/material.dart';
import 'package:twitter_clone/components/appbar_circle_image_widget.dart';
import 'package:twitter_clone/pages/navigation_pages/drawer_page/drawer_page.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/current_user_data.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/post_modal.dart';
import 'package:twitter_clone/pages/tweet_page/tweet_page.dart';
import 'package:twitter_clone/services/post_service.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Post> posts = PostService().getPosts();
  final List list = PostService().getPosts()[1].photo ?? [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const DrawerPage(),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              _appbarWithTabbar(context),
            ];
          },
          body: TabBarView(children: [
            _notificationList(),
            _notificationList(),
          ]),
        ),
      ),
    );
  }

  ListView _notificationList() {
    return ListView.separated(
      itemCount: posts.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return _notificationItem(context, index);
      },
    );
  }

  InkWell _notificationItem(BuildContext context, int index) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => TweetPage(post: posts[index])));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite_rounded,
                    color: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(User.currentUser.photo),
                      ),
                      const Text("Martin liked your tweet."),
                      Text(
                        "Martin liked your tweet.",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
  }

  SliverAppBar _appbarWithTabbar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      shape: const Border(bottom: BorderSide(width: 0.1, color: Colors.white38)),
      leading: const AppbarCircleImage(),
      title: const Text(
        "Notifications",
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))],
      bottom: TabBar(
          indicatorColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: const EdgeInsets.only(
            bottom: 16,
          ),
          tabs: const [
            Text("All"),
            Text("Mentions"),
          ]),
    );
  }
}
