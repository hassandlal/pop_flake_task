import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/BoxOfficeMoviesCubit/cubit.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/BoxOfficeMoviesCubit/states.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/ComingSoonCubit/cubit.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/ComingSoonCubit/states.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/InTheaterCubit/cubit.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/InTheaterCubit/states.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/TopRatedCubit/cubit.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/TopRatedCubit/states.dart';
import '../../shared/component/components.dart';

class MoviesPage extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Coming Soon'),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<MoviesComingSoonCubit, MoviesComingSoonStates>(
                builder: (context, state) {
                  if (state is ComingSoonLoadingHomeDataState) {
                    return Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: CircularProgressIndicator(),
                        ));
                  } else if (state is ComingSoonSuccessHomeDataState) {
                    return BuildListView(
                        MoviesComingSoonCubit.get(context).comingSoon!,
                        context);
                  } else {
                    return Center(child: const Text('oops something went wrong'));
                  }
                },
                listener: (context, state) {}),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('In Theaters'),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<MoviesInTheaterCubit, MoviesInTheaterStates>(
                builder: (context, state) {
                  if (state is InTheaterLoadingHomeDataState) {
                    return Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: CircularProgressIndicator(),
                        ));
                  } else if (state is InTheaterSuccessHomeDataState) {
                    return BuildListView(
                        MoviesInTheaterCubit.get(context).inTheaters!, context);
                  } else {
                    return Center(child: const Text('oops something went wrong'));
                  }
                },
                listener: (context, state) {}),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Top Rated Movies'),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<MoviesTopRatedCubit, MoviesTopRatedStates>(
                builder: (contexr, state) {
                  if (state is TopRatedLoadingHomeDataState) {
                    return Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: CircularProgressIndicator(),
                        ));
                  } else if (state is TopRatedSuccessHomeDataState) {
                    return BuildListView(
                        MoviesTopRatedCubit.get(context).mostPopularMovies!,
                        context);
                  } else {
                    return Center(child: const Text('oops something went wrong'));
                  }
                },
                listener: (context, state) {}),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Box Office Movies'),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<MoviesBoxOfficeCubit, MoviesBoxOfficeStates>(
              builder: (BuildContext context, state) {
                if (state is BoxOfficeLoadingHomeDataState) {
                  return Center(
                      child: Container(
                    width: MediaQuery.of(context).size.width*0.1,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: CircularProgressIndicator(),
                  ));
                } else if (state is BoxOfficeSuccessHomeDataState) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      //physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildTopRatedListMovie(
                            MoviesBoxOfficeCubit.get(context)
                                .boxOffice!
                                .items![index],
                            context);
                      },
                      itemCount: MoviesBoxOfficeCubit.get(context)
                          .boxOffice!
                          .items!
                          .length,
                      scrollDirection: Axis.vertical,
                    ),
                  );
                } else
                  return Center(child: const Text('oops something went wrong'));
              },
              listener: (context, state) {},
            ),
          ],
        ),
      ),
    );
  }
}
