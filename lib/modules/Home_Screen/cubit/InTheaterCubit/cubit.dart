import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/InTheaterCubit/states.dart';


import '../../../../models/InTheatersModel.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';


class MoviesInTheaterCubit extends Cubit<MoviesInTheaterStates> {
  MoviesInTheaterCubit() : super(InTheaterHomeInitialState());

  static MoviesInTheaterCubit get(context) => BlocProvider.of(context);






  InTheaters? inTheaters;
  void getInTheatersData() {
    emit(InTheaterLoadingHomeDataState());

    DioHelper.getData(
      url: INTHEATERS,

    ).then((value) {
      inTheaters = InTheaters.fromJson(value.data);


      emit(InTheaterSuccessHomeDataState());
    }).catchError((error) {

      emit(InTheaterErrorHomeDataState());
    });
  }
}