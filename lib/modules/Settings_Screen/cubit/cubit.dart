
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/models/complaintModel.dart';
import 'package:pop_flaktask/modules/Settings_Screen/cubit/states.dart';

class ComplaintCubit extends Cubit<ComplaintStates>{
  ComplaintCubit(): super(NewComplaimentInitialState());



  static ComplaintCubit get(context)=>BlocProvider.of(context);


List<ComplaintModel> complaints =[];
void addNewComplaint(String username,String mail, String complaint){
  ComplaintModel newcomplaint = ComplaintModel(username,mail,complaint);
  complaints.add(newcomplaint);

  emit(NewComplaimentAddedSuccessfully());

}

}