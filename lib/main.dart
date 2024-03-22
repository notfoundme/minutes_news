import 'package:flutter/material.dart';
import 'package:minutes_app/injections/news_injection.dart';
import 'package:minutes_app/views/home_page.dart';
import 'package:minutes_app/vm/category_news_vm.dart';
import 'package:minutes_app/vm/drawer_cat_vm.dart';
import 'package:minutes_app/vm/news_vm.dart';
import 'package:provider/provider.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> CategoryNewsVm(),
      child: ChangeNotifierProvider(
              create:(context) => NewsVm(),
      
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false
          ),
          home: ChangeNotifierProvider(
            create: (context)=> CategoryVm(),
            child: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
