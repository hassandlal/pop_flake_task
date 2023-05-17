import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/shared/cubit/cubit.dart';
import '../modules/Details_Screen/cubit/cubit.dart';
import '../modules/Details_Screen/cubit/states.dart';
import '../modules/Home_Screen/HomeScreen.dart';
import '../modules/Search_Screen/SearchScreen.dart';
import '../modules/Settings_Screen/SettingsScreen.dart';
import '../shared/cubit/states.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('POP FLAKE'),
            bottom: TabBar(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  text: 'movies',
                  icon: Icon(Icons.home),
                ),
                Tab(
                  text: 'search',
                  icon: Icon(Icons.search),
                ),
                Tab(
                  text: 'settings',
                  icon: Icon(Icons.brightness_5_sharp),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              MoviesPage(),
              SearchScreen(),
              const SettingsPage(),
            ],
          ),

        );
      },
    );
  }
}
