import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/BoxOfficeMoviesCubit/cubit.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/ComingSoonCubit/cubit.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/InTheaterCubit/cubit.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/TopRatedCubit/cubit.dart';
import 'package:pop_flaktask/shared/cubit/cubit.dart';
import 'package:pop_flaktask/shared/cubit/internetcheck/cubit.dart';
import 'package:pop_flaktask/shared/cubit/internetcheck/states.dart';
import 'package:pop_flaktask/shared/cubit/states.dart';
import 'package:pop_flaktask/shared/network/local/cache_helper.dart';
import 'package:pop_flaktask/shared/network/remote/dio_helper.dart';
import 'package:pop_flaktask/shared/styles/themes.dart';
import 'layout/app_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(
    MyApp(connectivity: Connectivity()),
  );
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;

  const MyApp({super.key, required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..changeAppMode(),
        ),
        BlocProvider(
            create: (BuildContext context) =>
                MoviesBoxOfficeCubit()..getTopRatedData()),
        BlocProvider(
            create: (BuildContext context) =>
                MoviesComingSoonCubit()..getComingSoonData()),
        BlocProvider(
            create: (BuildContext context) =>
                MoviesInTheaterCubit()..getInTheatersData()),
        BlocProvider(
            create: (BuildContext context) =>
                MoviesTopRatedCubit()..getMostPopularMoviesData()),
        BlocProvider(
            create: (BuildContext context) =>
                InternetCubit(connectivity: connectivity)),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: BlocConsumer<InternetCubit, InternetState>(
              builder: (BuildContext context, state) {
                if(kIsWeb){ return const MyHomePage();}
                if (state is InternetConnected) {
                  return const MyHomePage();
                }
                else {
                  return const Scaffold(body: Center(child: Text('no internet connection')));
                }

              },
              listener: (BuildContext context, Object? state) {

              },
            ),
          );
        },
      ),
    );
  }
}
