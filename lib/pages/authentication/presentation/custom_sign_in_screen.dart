import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/app/app_constants.dart';
import 'package:starter_kit/pages/authentication/data/firebase_auth_repository.dart';
import 'package:starter_kit/shared/widgets/jbox.dart';

import 'auth_providers.dart';

class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Image.asset(
              ImagePath.avatar,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AuthStateListener(
                child: const EmailForm(),
                listener: (oldState, state, controller) {
                  return null;
                },
              ),
            ),
          ],
        ));
  }
}

class SignInAnonymouslyFooter extends ConsumerWidget {
  const SignInAnonymouslyFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const JBox(
          height: 8,
        ),
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('or'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        TextButton(
          onPressed: () => ref.read(firebaseAuthProvider).signInAnonymously(),
          child: const Text('Sign in anonymously'),
        ),
      ],
    );
  }
}
