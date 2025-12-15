import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/presentation/auth/email_verification/presentation/views/widgets/email_verification_view_body.dart';
import 'package:movies_app/presentation/auth/email_verification/presentation/views_model/email_verification_cubit.dart';
import 'package:movies_app/presentation/auth/email_verification/presentation/views_model/email_verification_intent.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailVerificationCubit>(
      create: (context) =>
          getIt.get<EmailVerificationCubit>()
            ..doIntent(intent: const EmailVerificationInitializationIntent()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              // onPressed: () async => await AuthenticationRepository.instance.logout(),
              onPressed: () => (),
              icon: const Icon(CupertinoIcons.clear),
            ),
          ],
        ),
        body: const EmailVerificationViewBody(),
      ),
    );
  }
}
