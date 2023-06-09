import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/BoxOfficeMoviesCubit/states.dart';
import '../../../../models/TopRatedBoxOfficeModel.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';


class MoviesBoxOfficeCubit extends Cubit<MoviesBoxOfficeStates > {
  MoviesBoxOfficeCubit() : super(HomeBoxOfficeInitialState());

  static MoviesBoxOfficeCubit get(context) => BlocProvider.of(context);




  BoxOffice?boxOffice;

  void getTopRatedData() {
    emit(BoxOfficeLoadingHomeDataState());

    DioHelper.getData(
      url: TOPRATED,

    ).then((value) {
      boxOffice = BoxOffice.fromJson(value.data);


      emit(BoxOfficeSuccessHomeDataState());
    }).catchError((error) {

      emit(BoxOfficeErrorHomeDataState());
    });
  }
}