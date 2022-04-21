import 'package:flutter/material.dart';
import 'package:twitter_clone/pages/navigation_pages/main_page/page_model.dart';
import 'package:twitter_clone/pages/navigation_pages/search_page/search_page.dart';
import '../home_page/home_page.dart';
import '../messages_page/messages_page.dart';
import '../notifications_page/notifications_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<PageItem> pageList = [
    PageItem("HomePage", const HomePage(), const Icon(Icons.home_filled), const Icon(Icons.home_filled)),
    PageItem("Search", const SearchPage(), const Icon(Icons.search), const Icon(Icons.search)),
    PageItem("Notifications", const NotificationsPage(), const Icon(Icons.notifications),
        const Icon(Icons.notifications_outlined)),
    PageItem("Messages", MessagesPage(), const Icon(Icons.mail), const Icon(Icons.mail_outline))
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _fab(),
        bottomNavigationBar: _bottomNavbar(context),
        body: pageList[selected].body);
  }

  FloatingActionButton _fab() {
    return FloatingActionButton(
          onPressed: () {},
          child: Icon(
            selected == 3 ? Icons.mail_outline : Icons.add,
            color: Colors.white,
          ));
  }

  Material _bottomNavbar(BuildContext context) {
    return Material(
        elevation: 2,
        color: const Color.fromRGBO(21, 32, 43, 1),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(border: Border(top: BorderSide(width: 0.1, color: Colors.white))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  pageList.length,
                  (index) => SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 4,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: selected == index ? pageList[index].selectedIcon : pageList[index].unselectedIcon,
                        ),
                      ))),
        ),
      );
  }
}