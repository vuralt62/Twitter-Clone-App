import 'package:flutter/material.dart';
import 'package:twitter_clone/components/appbar_circle_image_widget.dart';
import 'package:twitter_clone/pages/navigation_pages/drawer_page/drawer_page.dart';
import 'package:twitter_clone/pages/navigation_pages/search_page/trendtopic.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      body: _body(context),
    );
  }

  CustomScrollView _body(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[_sliverappbar(context), _trendtopicappbar(), _trentopiclist(context)],
    );
  }

  SliverAppBar _sliverappbar(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 56,
      centerTitle: true,
      leading: const AppbarCircleImage(),
      title: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            filled: true,
            fillColor: Theme.of(context).splashColor,
            hintText: "Search on Twitter",
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

  SliverAppBar _trendtopicappbar() {
    return const SliverAppBar(
      pinned: true,
      leading: SizedBox(),
      leadingWidth: 0,
      title: Text("Trend Topics"),
    );
  }

  SliverList _trentopiclist(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(
            List.generate(TrendTopic.trendTopics.length, (index) => _trendtopicitem(index, context))));
  }

  ListTile _trendtopicitem(int index, BuildContext context) {
    return ListTile(
      title: Text(
        TrendTopic.trendTopics[index].location,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(TrendTopic.trendTopics[index].title,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5)),
          ),
          Text(
            TrendTopic.trendTopics[index].tweetCount,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
      trailing: const Icon(
        Icons.more_vert,
        color: Colors.grey,
      ),
    );
  }
}
