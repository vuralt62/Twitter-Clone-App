import 'package:flutter/material.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/post_modal.dart';
import 'package:twitter_clone/services/post_service.dart';

class ImageDetailPage extends StatelessWidget {
  ImageDetailPage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  final Post post = PostService().getPosts()[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_appBar(context), _image(), _interaction(context)],
        ),
      ),
    );
  }

  Column _interaction(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buttons(context),
        _answer(),
      ],
    );
  }

  Padding _answer() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          decoration: InputDecoration(hintText: "Answer", helperStyle: TextStyle(fontWeight: FontWeight.w300)),
        ),
      );
  }

  Expanded _image() {
    return Expanded(
      child: Hero(
          tag: imageUrl,
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          )),
    );
  }

  Row _appBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ))
      ],
    );
  }

  Padding _buttons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: null,
            icon: const Icon(
              Icons.comment,
              color: Colors.white60,
              size: 18,
            ),
            label: post.commentCount != "0"
                ? Text(
                    "${post.commentCount}",
                    style: Theme.of(context).textTheme.button,
                  )
                : const SizedBox(),
          ),
          TextButton.icon(
            onPressed: null,
            icon: const Icon(
              Icons.loop,
              color: Colors.white60,
              size: 18,
            ),
            label: post.retweetCount != "0"
                ? Text(
                    "${post.retweetCount}",
                    style: Theme.of(context).textTheme.button,
                  )
                : const SizedBox(),
          ),
          TextButton.icon(
            onPressed: null,
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white60,
              size: 18,
            ),
            label: post.likeCount != "0"
                ? Text(
                    "${post.likeCount}",
                    style: Theme.of(context).textTheme.button,
                  )
                : const SizedBox(),
          ),
          const Icon(
            Icons.share,
            color: Colors.white60,
            size: 18,
          ),
        ],
      ),
    );
  }
}
