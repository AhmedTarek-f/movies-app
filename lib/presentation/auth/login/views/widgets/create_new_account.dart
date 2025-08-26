import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_text.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppText.dontHaveAcc,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            InkWell(
              onTap: () {},
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
                  AppText.createOne,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        const RSizedBox(height: 27),
        RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 85),
          child: Row(
            children: [
              Expanded(
                child: Divider(color: Theme.of(context).colorScheme.primary),
              ),
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  AppText.or,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 15),
                ),
              ),
              Expanded(
                child: Divider(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
