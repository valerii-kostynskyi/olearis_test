import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test/view/components/logo_widget.dart';
import 'package:olearis_test/view/home/home_screen.dart';
import 'package:olearis_test/view/sigin/cubit/sign_in_cubit.dart';
import 'package:olearis_test/view/sigin/widget/sign_in_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  SignInViewState createState() => SignInViewState();
}

class SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  bool get isInputValid =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is SignInInitialState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: constraints.maxHeight,
              child: Column(
                children: [
                  const Expanded(child: LogoWidget()),
                  _inputsForm(),
                  _button(state, context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _inputsForm() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _email(),
            _password(),
          ],
        ),
      ),
    );
  }

  Widget _email() {
    return TextField(
      controller: _emailController,
      onChanged: (value) => setState(() {}),
      decoration: const InputDecoration(
        labelText: 'Login',
        hintText: 'Enter your email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _password() {
    return TextField(
      controller: _passwordController,
      onChanged: (value) => setState(() {}),
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          icon:
              Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      obscureText: !_passwordVisible,
    );
  }

  Widget _button(SignInState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SignInButton(
        isInputValid: isInputValid,
        state: state,
        onPressed: () {
          context.read<SignInCubit>().signIn(
                _emailController.text,
                _passwordController.text,
              );
        },
      ),
    );
  }
}
