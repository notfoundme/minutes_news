import 'package:flutter/material.dart';
import 'package:minutes_app/views/drawer_page.dart';
import 'package:minutes_app/vm/news_vm.dart';
import 'package:minutes_app/widgets/newscard.dart';
import 'package:minutes_app/widgets/top_bottom_bar_change_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;
  GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>(); // k123
  final TopBottomBarChangeNotifier topBottomBarChangeNotifier =
      TopBottomBarChangeNotifier();

  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<NewsVm>(context);
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
        create: (context) => topBottomBarChangeNotifier,
        builder: (context, child) {
          return Stack(
            children: [
              Scaffold(
                key: homeScaffoldKey, // k123
                // appBar: AppBar(),
                drawer: DrawerC(),

                endDrawer: Drawer(
                  child: ListView(
                    children: [Text("Hello World")],
                  ),
                ),
                body: Consumer<NewsVm>(builder: (context, notifier, child) {
                  if (notifier.newsState == NewsState.initial) {
                    WidgetsBinding.instance.addPostFrameCallback((d) {
                      notifier.fetchAllNews();
                    });
                    return Container();
                  } else if (notifier.newsState == NewsState.loading) {
                    return CircularProgressIndicator();
                  } else if (notifier.newsState == NewsState.loaded) {
                    print(notifier.listOfNewsModel);
                    return PageView.builder(
                        itemCount: notifier.listOfNewsModel.length,
                        scrollDirection: Axis.vertical,
                        onPageChanged: (pageNumber) {
                          print(pageNumber);
                          if (pageNumber ==
                              notifier.listOfNewsModel.length - 3) {
                            notifier.fetchBasedOnOffset();
                          }
                        },
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: NewsCard(
                              homeScaffoldKey: homeScaffoldKey, // k123
                              topBottomBarChangeNotifier:
                                  topBottomBarChangeNotifier,
                              nm: notifier.listOfNewsModel[index],
                            ),
                          );
                        });
                  } else
                    return Text("error");
                }),
              ),
              Consumer<TopBottomBarChangeNotifier>(
                  builder: (context, notifier, child) {
                return AnimatedContainer(
                  height: notifier.isVisible ? 50 : 0,
                  width: size.width,
                  duration: const Duration(milliseconds: 200),
                  child: Material(
                    child: !notifier.isVisible
                        ? Container()
                        : Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (isDrawerOpen) {
                                      homeScaffoldKey.currentState!
                                          .closeDrawer();
                                    } else {
                                      homeScaffoldKey.currentState!
                                          .openDrawer();
                                    }
                                    isDrawerOpen = !isDrawerOpen;
                                    setState(() {});
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        isDrawerOpen
                                            ? Icons.close
                                            : Icons.arrow_back_ios,
                                        size: 20,
                                        color: Colors.blue,
                                      ),
                                      isDrawerOpen
                                          ? Text("Close")
                                          : Text("Discover"),
                                    ],
                                  ),
                                ),
                                Text(
                                  isDrawerOpen ? "Discover" : "Top Stories",
                                  textAlign: TextAlign.center,
                                ),
                                Icon(
                                  isDrawerOpen ? Icons.settings : Icons.refresh,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                  ),
                );
              })
            ],
          );
        });
  }
}

