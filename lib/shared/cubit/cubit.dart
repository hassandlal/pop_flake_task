import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pop_flaktask/shared/cubit/states.dart';
import '../network/local/cache_helper.dart';



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = true;

  void changeAppMode()

  {
    isDark = !isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    });

  }
}