import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';
import 'package:task_schedule/utils/view_utils.dart';

class CustomInput<T> extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final String? type;
  final double? width;
  final Widget? suffixIcon;
  final bool obscure;
  final bool enabled;
  final dynamic validator;
  final int maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool hasBottomPadding;

  const CustomInput({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.obscure = false,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.type,
    this.width,
    this.enabled = true,
    this.maxLines = 1,
    this.hasBottomPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? queryWidth() * 0.9,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Styles.body(),
          ),
          TextFormField(
            showCursor: true,
            controller: controller,
            cursorColor: Colors.grey,
            obscureText: obscure,
            enabled: enabled,
            keyboardType: keyboardType ?? TextInputType.text,
            maxLines: maxLines,
            style: Styles.body(size: 16),
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: hint,
              isDense: true,
              hintStyle: Styles.lightBody(size: 16),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              suffixIcon: suffixIcon,
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 24, maxWidth: double.infinity),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.faintGreyColor, width: 1),
              ),
              border: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.faintGreyColor, width: 1),
              ),
              counterText: '',
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
