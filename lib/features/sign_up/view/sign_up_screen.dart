import 'package:chat_app/features/sign_up/bloc/auth_bloc.dart';
import 'package:chat_app/features/widgets/widgets.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/auth/abstract_auth_repository.dart';
import 'package:chat_app/router/router.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isHiddenPassword = true;
  TextEditingController phoneTextInputController = TextEditingController();
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextRepeatInputController =
      TextEditingController();

  final _authBloc = AuthBloc(GetIt.I<AbstractAuthRepository>());

  @override
  void dispose() {
    phoneTextInputController.dispose();
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextRepeatInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset("assets/chat.png", height: 120),
            FormWidget(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                child: FormTextField(
                  label: Text(
                    S.of(context).phoneNumber,
                    style: theme.textTheme.labelLarge,
                  ),
                  type: TextInputType.emailAddress,
                  controller: phoneTextInputController,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? S.of(context).enterCorrectPhone
                          : null,
                )),
            FormWidget(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                child: FormTextField(
                  label: Text(
                    S.of(context).email,
                    style: theme.textTheme.labelLarge,
                  ),
                  controller: emailTextInputController,
                  type: TextInputType.emailAddress,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? S.of(context).enterCorrectEmail
                          : null,
                )),
            FormWidget(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                child: FormTextField(
                  label: Text(
                    S.of(context).password,
                    style: theme.textTheme.labelLarge,
                  ),
                  controller: passwordTextInputController,
                  validator: (value) => value != null && value.length < 6
                      ? S.of(context).min6Symbols
                      : null,
                )),
            FormWidget(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                child: FormTextField(
                  label: Text(
                    S.of(context).confirmPassword,
                    style: theme.textTheme.labelLarge,
                  ),
                  controller: passwordTextRepeatInputController,
                  validator: (value) =>
                      value == passwordTextInputController.text
                          ? S.of(context).passwordsNotEqual
                          : null,
                )),
            const SizedBox(height: 8),
            BlocConsumer(
                bloc: _authBloc,
                builder: (context, state) {
                  return FormWidget(
                      padding: const EdgeInsets.symmetric(horizontal: 16)
                          .copyWith(top: 16),
                      child: InkWell(
                          onTap: () {
                            _authBloc.add(SignUpUser(
                                emailTextInputController.text,
                                passwordTextInputController.text,
                                phoneTextInputController.text));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                S.of(context).signUp,
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          )));
                },
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    AutoRouter.of(context).replace(const UsersListRoute());
                  } else if (state is AuthFailure) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              state.error.toString(),
                              style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            title: Text(
                              S.of(context).error,
                              style: TextStyle(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        });
                  }
                }),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      S.of(context).orContinueWith,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imagePath: 'assets/google.png'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).alreadyHaveAnAccount,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                TextButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStatePropertyAll(theme.buttonTheme.padding)),
                  onPressed: () {
                    AutoRouter.of(context).popAndPush(const SignInRoute());
                  },
                  child: Text(
                    S.of(context).logInNow,
                    style: theme.textTheme.bodyMedium,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
