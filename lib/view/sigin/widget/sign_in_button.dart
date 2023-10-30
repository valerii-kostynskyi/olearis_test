import 'package:flutter/material.dart';
import 'package:olearis_test/view/sigin/cubit/sign_in_cubit.dart';

class SignInButton extends StatelessWidget {
  final bool isInputValid;
  final SignInState state;
  final VoidCallback onPressed;

  const SignInButton({
    super.key,
    required this.isInputValid,
    required this.state,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isInputValid
            ? Theme.of(context).focusColor
            : Theme.of(context).disabledColor,
      ),
      onPressed: state is SignInLoading || !isInputValid ? () {} : onPressed,
      child: SizedBox(
        width: 100,
        height: 30,
        child: Center(
          child: state is SignInLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                )
              : const Text('Continue'),
        ),
      ),
    );
  }
}
