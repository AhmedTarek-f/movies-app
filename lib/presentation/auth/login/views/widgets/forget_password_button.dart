import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_text.dart';
import 'package:movies_app/core/router/route_names.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(RouteNames.forgetPassword);
        },
        borderRadius: BorderRadius.circular(30.r),
        highlightColor: theme.colorScheme.primary.withValues(alpha: 0.2),
        splashColor: theme.colorScheme.primary.withValues(alpha: 0.2),
        child: RPadding(
          padding: const EdgeInsets.all(4),
          child: Text(
            AppText.forgotPassword,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
