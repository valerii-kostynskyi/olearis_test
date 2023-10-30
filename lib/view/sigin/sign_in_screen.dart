import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test/view/sigin/cubit/sign_in_cubit.dart';
import 'package:olearis_test/view/sigin/widget/sign_in_view.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
        create: (context) => SignInCubit(),
        child: const SignInView(),
      ),
    );
  }
}
