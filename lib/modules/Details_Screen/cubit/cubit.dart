import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Details_Screen/cubit/states.dart';
import '../../../models/moviesdetails.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class MovieDetailsCubit extends Cubit<MoviesDetailsStates > {
  MovieDetailsCubit() : super(MoviesDetailsInitialState());



  static MovieDetailsCubit get(context) => BlocProvider.of(context);




  MoviesDetails? moviesdetails;

  void getMovieDetailsData(String id) {
    emit(MoviesDetailsLoadingState());
    print('data emitted');

    DioHelper.getData(
      url: Details+id,

      //token: apiKey,
    ).then((value) {
      moviesdetails = MoviesDetails?.fromJson(value.data);
      print(moviesdetails?.videoTitle.toString());

      emit(MoviesDetailsSuccessState());
    }).catchError((error) {
     print(error.toString());
      emit(MoviesDetailsErrorState());
    });
  }
}