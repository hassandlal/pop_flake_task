import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Details_Screen/cubit/states.dart';
import 'package:video_player/video_player.dart';
import '../../../models/moviesdetails.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class MovieDetailsCubit extends Cubit<MoviesDetailsStates> {
  MovieDetailsCubit() : super(MoviesDetailsInitialState());

  static MovieDetailsCubit get(context) => BlocProvider.of(context);

  MoviesDetails? moviesdetails;

  void getMovieDetailsData(String id) {
    emit(MoviesDetailsLoadingState());

    DioHelper.getData(
      url: Details + id,
    ).then((value) {
      moviesdetails = MoviesDetails?.fromJson(value.data);

      emit(MoviesDetailsSuccessState());
    }).catchError((error) {
      emit(MoviesDetailsErrorState());
    });
  }


}
