import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.maxLines = 1,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.obscuringCharacter = "*",
    this.validator,
    this.textInputAction,
    this.hintStyle,
    this.contentPadding,
    this.style,
    this.onTap,
    this.enabled,
    this.suffixIconConstraints,
    this.maxLength,
    this.prefixIcon,
    this.prefixIconConstraints,
    required this.label,
    this.labelStyle,
  });
  final String? hintText;
  final String label;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final String obscuringCharacter;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final void Function()? onTap;
  final bool? enabled;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      onTap: onTap,
      style: style ?? theme.textTheme.bodyLarge,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding:
            contentPadding ??
            REdgeInsets.symmetric(horizontal: 19, vertical: 18),
        filled: true,
        fillColor: theme.colorScheme.shadow,
        label: Text(label, style: labelStyle ?? theme.textTheme.bodyLarge),
        hintStyle: hintStyle ?? theme.textTheme.bodyLarge,
        hintText: hintText?.tr(),
        focusedBorder: buildOutlinedBorder(
          borderColor: theme.colorScheme.primary,
        ),
        enabledBorder: buildOutlinedBorder(
          borderColor: theme.colorScheme.shadow,
        ),
        focusedErrorBorder: buildOutlinedBorder(
          borderColor: theme.colorScheme.error,
        ),
        errorBorder: buildOutlinedBorder(borderColor: theme.colorScheme.error),
        disabledBorder: buildOutlinedBorder(
          borderColor: theme.colorScheme.secondary,
        ),
        errorMaxLines: 2,
        prefixIcon: prefixIcon,
        prefixIconConstraints:
            prefixIconConstraints ??
            BoxConstraints(maxWidth: 60.r, maxHeight: 60.r),
        suffixIconConstraints:
            suffixIconConstraints ??
            BoxConstraints(maxWidth: 60.r, maxHeight: 60.r),
        suffixIcon: suffixIcon,
        errorStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.error,
        ),
      ),
      maxLength: maxLength,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      validator: validator,
      enabled: enabled,
    );
  }

  OutlineInputBorder buildOutlinedBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
