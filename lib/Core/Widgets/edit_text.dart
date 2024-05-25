import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../Managers/text_styles.dart';

class EditText extends StatelessWidget {
  final TextEditingController controller;
  final bool multiLang;
  final String hint;
  final int? maxLength, maxLines, errorMaxLines;
  final TextInputAction? textInputAction;
  final Color? bgColor, hintColor, borderColor;
  final double? height,
      marginHorizontal,
      marginVertical,
      paddingHorizontal,
      paddingVertical,
      borderRadius;
  final bool? isBorder, enabled, obscureText;
  final Widget? prefixIcon, suffixIcon;
  final Function(String)? onChange;
  final String? errorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const EditText(
      {super.key,
      required this.multiLang,
      required this.controller,
      required this.hint,
      this.maxLength,
      this.maxLines,
      this.textInputAction,
      this.bgColor,
      this.height,
      this.marginHorizontal,
      this.marginVertical,
      this.isBorder,
      this.borderColor,
      this.prefixIcon,
      this.suffixIcon,
      this.onChange,
      this.paddingHorizontal,
      this.paddingVertical,
      this.borderRadius,
      this.errorText,
      this.hintColor,
      this.inputFormatters,
      this.errorMaxLines,
      this.obscureText = false,
      this.keyboardType,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: controller,
      maxLength: maxLength,
      maxLines: obscureText! ? 1 : maxLines,
      textInputAction: textInputAction,
      enabled: enabled,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: multiLang ? Locales.string(context, hint) : hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorText,
        errorMaxLines:errorMaxLines??2,
        counterText: "",
        contentPadding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal ?? 0, vertical: paddingVertical ?? 0),
        fillColor: bgColor,
        filled: true,
        hintStyle: TextStyleManager.textStyleRegular
            .copyWith(fontSize: 15, color: hintColor),
        border: isBorder == null || isBorder!
            ? OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: borderColor ?? Colors.transparent,
                    width: borderColor != null ? 2 : 0,
                    style: borderColor != null
                        ? BorderStyle.solid
                        : BorderStyle.none))
            : InputBorder.none,
        focusedBorder: isBorder == null || isBorder!
            ? OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: borderColor ?? Colors.transparent,
                    width: borderColor != null ? 2 : 0,
                    style: borderColor != null
                        ? BorderStyle.solid
                        : BorderStyle.none))
            : InputBorder.none,
        enabledBorder: isBorder == null || isBorder!
            ? OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: borderColor ?? Colors.transparent,
                    width: borderColor != null ? 2 : 0,
                    style: borderColor != null
                        ? BorderStyle.solid
                        : BorderStyle.none))
            : InputBorder.none,
        disabledBorder: isBorder == null || isBorder!
            ? OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: borderColor ?? Colors.transparent,
                    width: borderColor != null ? 2 : 0,
                    style: borderColor != null
                        ? BorderStyle.solid
                        : BorderStyle.none))
            : InputBorder.none,
      ),
    );
  }
}
