import 'package:course_app/shop_app/models/login_model.dart';
import 'package:course_app/shop_app/network/dio_helper.dart';
import 'package:course_app/shop_app/network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordVisibility extends LoginState{}



class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  changePasswordVisibility(){
    isPassword=!isPassword;
    suffix = isPassword?Icons.visibility:Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }


  void userLogin({@required String email, @required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData
      (url: LOGIN,
        data: {
          'email': email,
          'password': password
        }
        ).then((value) {
        print(value.data);
       LoginModel loginModel= LoginModel.fromJson(value.data);
        emit(LoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
}
