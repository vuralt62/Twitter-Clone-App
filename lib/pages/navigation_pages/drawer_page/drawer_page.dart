import 'package:flutter/material.dart';
import 'package:twitter_clone/pages/navigation_pages/home_page/current_user_data.dart';
import 'package:twitter_clone/pages/profile_page/profile_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              _currentUserInfo(context),
              ListTile(
                title: const Text("Profile"),
                leading: const Icon(Icons.person_outline),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
                },
              ),
              const ListTile(
                leading: Icon(Icons.list_alt),
                title: Text("Lists"),
              ),
              const ListTile(
                leading: Icon(Icons.chat_bubble_outline),
                title: Text("Subjects"),
              ),
              const ListTile(
                leading: Icon(Icons.bookmark_border),
                title: Text("Bookmarks"),
              ),
              const ListTile(
                leading: Icon(Icons.flash_on_outlined),
                title: Text("Moments"),
              ),
              const ListTile(
                leading: Icon(Icons.attach_money),
                title: Text("Monetization"),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.rocket_launch),
                title: Text("Twitter for professionals"),
              ),
              const Divider(),
              const ListTile(
                title: Text("Setting and privacy"),
              ),
              const ListTile(
                title: Text("Help center"),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
          _bottom(context),
        ],
      ),
    );
  }

  Padding _currentUserInfo(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(User.currentUser.photo),
                      radius: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(User.currentUser.name, style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "@${User.currentUser.userName}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 50,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(text: "271 ", style: Theme.of(context).textTheme.subtitle1),
                      TextSpan(text: "follow    ", style: Theme.of(context).textTheme.subtitle2),
                      TextSpan(text: "271 ", style: Theme.of(context).textTheme.subtitle1),
                      TextSpan(text: "followers", style: Theme.of(context).textTheme.subtitle2)
                    ])),
                  )
                ],
              ),
            );
  }

  Align _bottom(BuildContext context) {
    return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.lightbulb_outline),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.qr_code),
                )
              ],
            ),
          ),
        );
  }
}
