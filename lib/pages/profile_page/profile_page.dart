import 'package:flutter/material.dart';
import 'package:twitter_clone/components/post_item_widget.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/current_user_data.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/post_modal.dart';
import 'package:twitter_clone/services/post_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final List<Post> posts = PostService().getPosts();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: NestedScrollView(
              floatHeaderSlivers: false,
              headerSliverBuilder: ((context, innerBoxIsScrolled) {
                return <Widget>[
                  _sliverAppbar(context),
                ];
              }),
              body: _body())),
    );
  }

  SliverAppBar _sliverAppbar(BuildContext context) {
    return SliverAppBar(
                    expandedHeight: 370,
                    pinned: true,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox.fromSize(
                                size: const Size.fromHeight(150),
                                child: Image.network(
                                  "https://images.pexels.com/photos/9656958/pexels-photo-9656958.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                              margin: const EdgeInsets.all(12),
                                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(width: 1, color: Colors.white30),
                                                  borderRadius: BorderRadius.circular(20)),
                                              child: const Text("Edit profile"))),
                                      Text(User.currentUser.name, style: Theme.of(context).textTheme.subtitle1),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "@${User.currentUser.userName}",
                                        style: Theme.of(context).textTheme.subtitle2,
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.celebration_rounded,
                                            color: Colors.white30,
                                            size: 20,
                                          ),
                                          Text(
                                            "Birthday: 2 July 1998",
                                            style: Theme.of(context).textTheme.subtitle2,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            color: Colors.white30,
                                            size: 20,
                                          ),
                                          Text(
                                            "Joined February 2014",
                                            style: Theme.of(context).textTheme.subtitle2,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(text: "271 ", style: Theme.of(context).textTheme.subtitle1),
                                        TextSpan(text: "follow    ", style: Theme.of(context).textTheme.subtitle2),
                                        TextSpan(text: "271 ", style: Theme.of(context).textTheme.subtitle1),
                                        TextSpan(text: "followers", style: Theme.of(context).textTheme.subtitle2)
                                      ])),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            top: 100,
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image:
                                      DecorationImage(image: NetworkImage(User.currentUser.photo), fit: BoxFit.cover),
                                  border: Border.all(width: 3, color: Theme.of(context).scaffoldBackgroundColor)),
                            ),
                          )
                        ],
                      ),
                    ),
                    bottom: _tabbar(context));
  }

  TabBar _tabbar(BuildContext context) {
    return TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
                        tabs: const [
                          Tab(child: Text("Tweets")),
                          Tab(child: Text("Tweets and replies")),
                          Tab(child: Text("Media")),
                          Tab(child: Text("Likes"))
                        ]);
  }

  TabBarView _body() {
    return TabBarView(children: [
              _tweetPage(),_tweetPage(),
              _mediaPage(),
              _tweetPage(),
            ]);
  }

  ListView _mediaPage() {
    return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  Post post = posts[index];
                  post.text = "";
                  return PostItemWidget(page: "profilepage", post: post);
                },
              );
  }

  ListView _tweetPage() {
    return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostItemWidget(page: "profilepage", post: posts[index]);
                },
              );
  }
}
