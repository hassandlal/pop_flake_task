import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Home_Screen/cubit/ComingSoonCubit/states.dart';

import '../../../../models/ComingSoonModel.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class MoviesComingSoonCubit extends Cubit<MoviesComingSoonStates> {
  MoviesComingSoonCubit() : super(HomeComingSoonInitialState());

  static MoviesComingSoonCubit get(context) => BlocProvider.of(context);

  ComingSoon? comingSoon;

  void getComingSoonData() {
    emit(ComingSoonLoadingHomeDataState());

    DioHelper.getData(
      url: COMINGSOON,
      //token: apiKey,
    ).then((value)  {
      comingSoon = ComingSoon.fromJson(value.data);
      print(comingSoon?.items![0].toString());
      emit(ComingSoonSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ComingSoonErrorHomeDataState());
    });
  }
}