import 'package:chat_app/features/widgets/widgets.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                  'Phone number',
                  style: theme.textTheme.labelLarge,
                ),
                type: TextInputType.phone,
              ),
            ),
            FormWidget(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                child: FormTextField(
                    label: Text(
                  'Password',
                  style: theme.textTheme.labelLarge,
                ))),
            const SizedBox(height: 8),
            FormWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            FormWidget(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(const UsersListRoute());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                )),
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
                      'Or continue with',
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
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                TextButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStatePropertyAll(theme.buttonTheme.padding)),
                  onPressed: () {
                    AutoRouter.of(context).push(const SignUpRoute());
                  },
                  child: Text(
                    'Register now',
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
