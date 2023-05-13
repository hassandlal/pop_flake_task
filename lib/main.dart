import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/BoxOfficeMoviesCubit/cubit.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/ComingSoonCubit/cubit.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/InTheaterCubit/cubit.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/TopRatedCubit/cubit.dart';
import 'package:pop_flaktask/shared/cubit/cubit.dart';
import 'package:pop_flaktask/shared/cubit/states.dart';
import 'package:pop_flaktask/shared/network/local/cache_helper.dart';
import 'package:pop_flaktask/shared/network/remote/dio_helper.dart';
import 'package:pop_flaktask/shared/styles/themes.dart';
import 'package:pop_flaktask/test.dart';
import 'layout/app_layout.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {

  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(),
        ),
        BlocProvider(
          create: (BuildContext context) => MoviesBoxOfficeCubit()..getTopRatedData()
        ),
        BlocProvider(
          create: (BuildContext context) => MoviesComingSoonCubit()..getComingSoonData()
        ),
        BlocProvider(
          create: (BuildContext context) => MoviesInTheaterCubit()..getInTheatersData()
        ),
        BlocProvider(
          create: (BuildContext context) => MoviesTopRatedCubit()..getMostPopularMoviesData()
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home:const MyHomePage(),
          );
        },
      ),
    );
  }
}
