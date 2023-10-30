import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitialState());

  Future<void> signIn(String email, String password) async {
    // validate email & pasword and send SignInErrorState
    emit(SignInLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(SignInInitialState());
  }
}
