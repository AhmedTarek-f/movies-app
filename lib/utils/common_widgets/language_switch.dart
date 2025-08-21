import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/global_cubit/global_cubit.dart';
import 'package:movies_app/core/global_cubit/global_state.dart';
import 'package:movies_app/utils/common_widgets/custom_toggle_switch.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key, this.isLanguageTextVisible = true});
  final bool isLanguageTextVisible;
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<GlobalCubit>(context);
    return BlocConsumer<GlobalCubit, GlobalState>(
      buildWhen: (previous, current) => current is ChangeLanguageIndexState,
      listener: (context, state) {
        if (state is ChangeLanguageIndexState) {
          context.setLocale(Locale(state.selectedLang));
        }
      },
      builder: (context, state) => CustomToggleSwitch(
        currentIndex: controller.languageSelectedIndex,
        firstIcon: AppIcons.usFlag,
        secondIcon: AppIcons.egFlag,
        onIndexChanged: (index) async =>
            await controller.onLanguageIndexChanged(index: index),
      ),
    );
  }
}
