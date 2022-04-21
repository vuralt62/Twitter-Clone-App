import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/components/appbar_circle_image_widget.dart';
import 'package:twitter_clone/components/post_item_widget.dart';
import 'package:twitter_clone/pages/navigation_pages/drawer_page/drawer_page.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/post_modal.dart';
import 'package:twitter_clone/services/post_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];
  @override
  void initState() {
    posts = PostService().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      body: CustomScrollView(
        slivers: [
          const HomePageAppBar(),
          HomePageTimeLine(
            posts: posts,
          )
        ],
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      shape: const Border(bottom: BorderSide(width: 0.1, color: Colors.white38)),
      leading: const AppbarCircleImage(),
      title: const Center(
        child: FaIcon(FontAwesomeIcons.twitter),
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.auto_awesome))],
    );
  }
}

class HomePageTimeLine extends StatelessWidget {
  const HomePageTimeLine({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return PostItemWidget(
        page: "homepage",
        post: posts[index],
      );
    }, childCount: posts.length));
  }
}
