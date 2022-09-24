import 'package:flutter/material.dart';
import 'package:image_gallery_from_url/core/domain/entities/app_colors.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.contentPadding,
    this.initialValue,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final String? initialValue;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      enabled: enabled,
      initialValue: initialValue,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.input,
        hintStyle: TextStyle(
          color: AppColors.primaryText.withOpacity(.5),
        ),
        labelStyle: TextStyle(
          color: AppColors.primaryText,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.input),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.input),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.input),
          borderRadius: BorderRadius.circular(10),
        ),
        iconColor: AppColors.primaryText.withOpacity(.7),
      ),
    );
  }
}
