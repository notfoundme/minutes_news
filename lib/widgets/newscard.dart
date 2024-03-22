import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minutes_app/models/news_model.dart';
import 'package:minutes_app/theme/text_theme.dart';
import 'package:minutes_app/widgets/top_bottom_bar_change_notifier.dart';

class NewsCard extends StatelessWidget {
final NewsModel nm;

  final GlobalKey<ScaffoldState> homeScaffoldKey; // k123
  final TopBottomBarChangeNotifier topBottomBarChangeNotifier;
  const NewsCard({
    super.key,
    required this.nm,
    required this.homeScaffoldKey,
    required this.topBottomBarChangeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        topBottomBarChangeNotifier.toggle();
      },
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.network(
                    nm.image + "?slug=" + Random().nextInt(500).toString(),
                    width: double.maxFinite,
                    height: size.height * 0.3,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nm.title,
                          style: MTextTheme.heading1,
                          textAlign: TextAlign.justify,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          nm.content,
                          style: MTextTheme.content1,
                          // textAlign: TextAlign.justify,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "swipe left for more at Reuters / few hours ago",
                          style: MTextTheme.contentSmall,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ListTile(
                onTap: () {
                  homeScaffoldKey.currentState!.openEndDrawer();
                },
                tileColor: Colors.grey[900],
                title: Text(nm.title.length > 20 ? nm.title.substring(0,20): nm.title,
                  style: MTextTheme.headingWhite,
                  maxLines: 1,
                ),
                subtitle: Text(
                  "Tap to know more",
                  maxLines: 1,
                  style: MTextTheme.contentWhite,
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.28,
            left: 8,
            child: Card(
              elevation: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Minutes",
                  style: MTextTheme.contentSmall.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}