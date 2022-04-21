import 'package:flutter/material.dart';
import 'package:twitter_clone/pages/image_detail_page/image_detail_page.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/current_user_data.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/post_modal.dart';
import 'package:twitter_clone/pages/profile_page/profile_page.dart';
import 'package:twitter_clone/pages/tweet_page/tweet_page.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    Key? key,
    required this.post,
    required this.page,
  }) : super(key: key);

  final String page;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => TweetPage(
                      post: post,
                    )));
      },
      child: Column(
        children: [
          Padding(
            //decoration: const BoxDecoration(border: Border(top: BorderSide(width: 0.1, color: Colors.white))),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileImage(context),
                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _postTopInfo(context),
                        Text(
                          "${post.text}",
                        ),
                        post.photo != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: post.photo!.length > 1 ? multiplePhotos(context) : onePhoto(context),
                              )
                            : const SizedBox(),
                        _buttons(context)
                      ],
                    ))
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }

  Padding _buttons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.comment,
                  color: Colors.white60,
                  size: 18,
                ),
                post.commentCount != "0"
                    ? const SizedBox(
                        width: 4,
                      )
                    : const SizedBox(),
                post.commentCount != "0"
                    ? Text(
                        "${post.commentCount}",
                        style: Theme.of(context).textTheme.button,
                      )
                    : const SizedBox()
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.loop,
                    color: Colors.white60,
                    size: 18,
                  ),
                  post.retweetCount != "0"
                      ? const SizedBox(
                          width: 4,
                        )
                      : const SizedBox(),
                  post.retweetCount != "0"
                      ? Text(
                          "${post.retweetCount}",
                          style: Theme.of(context).textTheme.button,
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.white60,
                    size: 18,
                  ),
                  post.likeCount != "0"
                      ? const SizedBox(
                          width: 4,
                        )
                      : const SizedBox(),
                  post.likeCount != "0"
                      ? Text(
                          "${post.likeCount}",
                          style: Theme.of(context).textTheme.button,
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.share,
                color: Colors.white60,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect onePhoto(context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ImageDetailPage(
                          imageUrl: post.photo![0],
                        )));
          },
          child: AspectRatio(
            aspectRatio: 1,
            child: _image(context, post.photo![0]),
          ),
        ));
  }

  SizedBox multiplePhotos(context) {
    return SizedBox(
      height: 200,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: post.photo!.length > 2 ? 1.6 : 0.8,
        padding: EdgeInsets.zero,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 2,
        children: List.generate(post.photo!.length, (photoIndex) {
          BorderRadius? radius;
          if (post.photo!.length <= 2) {
            if (photoIndex == 0) {
              radius = const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));
            } else if (photoIndex == 1) {
              radius = const BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12));
            }
          } else {
            if (photoIndex == 0) {
              radius = const BorderRadius.only(topLeft: Radius.circular(12));
            } else if (photoIndex == 1) {
              radius = const BorderRadius.only(topRight: Radius.circular(12));
            } else if (photoIndex == 2) {
              radius = const BorderRadius.only(bottomLeft: Radius.circular(12));
            } else if (photoIndex == 3) {
              radius = const BorderRadius.only(bottomRight: Radius.circular(12));
            }
          }
          return ClipRRect(borderRadius: radius, child: _image(context, post.photo![photoIndex]));
        }),
      ),
    );
  }

  InkWell _image(context, String url) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ImageDetailPage(
                      imageUrl: url,
                    )));
      },
      child: Hero(
        tag: page + url,
        child: Image.network(
          url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, frame) {
            return FittedBox(
              fit: BoxFit.cover,
              child: child,
            );
          },
        ),
      ),
    );
  }

  Row _postTopInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
          },
          child: Row(
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
        ),
        Row(
          children: [
            Text(
              ".56 dk",
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.right,
            ),
            const Icon(
              Icons.more_vert,
              color: Colors.white60,
              size: 24,
            )
          ],
        )
      ],
    );
  }

  SizedBox _profileImage(context) {
    return SizedBox(
        width: 64,
        child: Center(
          child: CircleAvatar(
              backgroundImage: NetworkImage(User.currentUser.photo),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
                    },
                    splashColor: Colors.transparent,
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                  ))),
        ));
  }
}
