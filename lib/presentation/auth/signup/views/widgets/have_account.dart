import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/router/route_names.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppText.alreadyHaveAccount,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
              },
              borderRadius: BorderRadius.circular(30.r),
              highlightColor: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
              splashColor: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
              child: RPadding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  AppText.login,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
