import 'package:chat_app/features/sign_up/bloc/auth_bloc.dart';
import 'package:chat_app/features/widgets/widgets.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/auth/abstract_auth_repository.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();

  final _authBloc = AuthBloc(GetIt.I<AbstractAuthRepository>());

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
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
              height: 100,
            ),
            Image.asset("assets/chat.png", height: 120),
            FormWidget(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
              child: FormTextField(
                label: Text(
                  S.of(context).email,
                  style: theme.textTheme.labelLarge,
                ),
                controller: emailTextInputController,
                type: TextInputType.emailAddress,
              ),
            ),
            FormWidget(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                child: FormTextField(
                  label: Text(
                    S.of(context).password,
                    style: theme.textTheme.labelLarge,
                  ),
                  controller: passwordTextInputController,
                )),
            const SizedBox(height: 8),
            FormWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).forgotPassword,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            BlocConsumer<AuthBloc, AuthState>(
              bloc: _authBloc,
              builder: (context, state) {
                return FormWidget(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(top: 16),
                    child: InkWell(
                      onTap: () {
                        _authBloc.add(SignInUser(emailTextInputController.text,
                            passwordTextInputController.text));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            S.of(context).signIn,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ));
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
              },
            ),
            const SizedBox(height: 50),
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
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imagePath: 'assets/google.png'),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).notAMember,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                TextButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStatePropertyAll(theme.buttonTheme.padding)),
                  onPressed: () {
                    AutoRouter.of(context).popAndPush(const SignUpRoute());
                  },
                  child: Text(
                    S.of(context).registerNow,
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
