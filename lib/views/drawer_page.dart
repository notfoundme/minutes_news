import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minutes_app/theme/text_theme.dart';
import 'package:minutes_app/views/category_page.dart';
import 'package:minutes_app/vm/drawer_cat_vm.dart';
import 'package:minutes_app/vm/news_vm.dart';
import 'package:provider/provider.dart';

class DrawerC extends StatelessWidget {
  const DrawerC({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50.0),
      width: double.maxFinite,
      child: Consumer<CategoryVm>(
        builder: (context, categoryvm, child) {
          if (categoryvm.categoryState == CategoryState.initial) {
            WidgetsBinding.instance.addPostFrameCallback((d) {
              categoryvm.fetchCategory();
            });
            return Container();
          } else if (categoryvm.categoryState == CategoryState.loading) {
            return CircularProgressIndicator();
          } else if (categoryvm.categoryState == CategoryState.loaded) {
            return Drawer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: categoryvm.categoryList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CategoryNewsScreen(
                                      cid: categoryvm.categoryList[index].id
                                          .toString(),
                                      title:
                                          categoryvm.categoryList[index].title,
                                    )));
                      },
                      child: Column(
                        children: [
                          const Icon(
                            Icons.category,
                            size: 50,
                            color: Colors.blue,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              categoryvm.categoryList[index].title,
                              style: MTextTheme.heading1,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Drawer(
              child: Center(
                child: Text("Cannot Connect to Server"),
              ),
            );
          }
        },
      ),
    );
  }
}
