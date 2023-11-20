import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/sign_up/sign_up.dart';
import 'package:chat_app/features/users_list/users_list.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VerifyUserScreen extends StatelessWidget {
  const VerifyUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text(S.of(context).somethingWentWrong)),
          );
        } else if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return const Scaffold();
          }
          return const UsersListScreen();
        }
        return const SignUpScreen();
      },
    );
  }
}
