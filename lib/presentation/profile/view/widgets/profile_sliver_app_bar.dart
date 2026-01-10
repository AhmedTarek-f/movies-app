import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/profile/view/widgets/edit_profile_button.dart';
import 'package:movies_app/presentation/profile/view/widgets/exit_button.dart';
import 'package:movies_app/presentation/profile/view/widgets/profile_details_section.dart';

class ProfileSliverAppBar extends StatelessWidget {
  const ProfileSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      expandedHeight: 282.h,
      flexibleSpace: const FlexibleSpaceBar(
        background: RPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              RSizedBox(height: 32),
              ProfileDetailsSection(),
              RSizedBox(height: 24),
              Row(
                children: [
                  Expanded(flex: 2, child: EditProfileButton()),
                  RSizedBox(width: 10),
                  Expanded(child: ExitButton()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
