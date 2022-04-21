import 'package:flutter/material.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/current_user_data.dart';

class AppbarCircleImage extends StatelessWidget {
  const AppbarCircleImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: InkWell(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: CircleAvatar(
          backgroundImage: NetworkImage(User.currentUser.photo),
        ),
      ),
    );
  }
}