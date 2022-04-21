import 'package:flutter/material.dart';
import 'package:twitter_clone/components/post_item_widget.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/post_modal.dart';

class TweetPage extends StatelessWidget {
  const TweetPage({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: PostItemWidget(page: "profilepage", post: post));
  }
}
