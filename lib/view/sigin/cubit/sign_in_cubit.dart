import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());

    await Future.delayed(const Duration(seconds: 0));

    emit(SignInInitial());
  }
}
