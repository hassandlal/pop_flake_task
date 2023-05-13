import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/TopRatedCubit/states.dart';

import '../../../../models/MostPopularMoviesModel.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class MoviesTopRatedCubit extends Cubit<MoviesTopRatedStates> {
  MoviesTopRatedCubit() : super(HomeTopRatedInitialState());

  static MoviesTopRatedCubit get(context) => BlocProvider.of(context);


  MostPopularMovies? mostPopularMovies;
  void getMostPopularMoviesData() {
    emit(TopRatedLoadingHomeDataState());

    DioHelper.getData(
      url: MostPopularMoviesAPI,
    ).then((value) {
      mostPopularMovies = MostPopularMovies.fromJson(value.data);
      print(mostPopularMovies?.items![0].id.toString());

      emit(TopRatedSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(TopRatedErrorHomeDataState());
    });
  }










}
