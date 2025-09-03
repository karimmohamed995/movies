import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String? prefixIcon;
  final bool isPassword;
  final int minLines;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.isPassword = false,
    this.minLines = 1,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: const TextStyle(color: AppColors.white), // لون النص
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[850], // خلفية رمادي غامق

        hintText: widget.hint,
        hintStyle: const TextStyle(color: AppColors.white),

        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  widget.prefixIcon!,
                  height: 24,
                  width: 24,
                  color: AppColors.white,
                ),
              ),

        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.remove_red_eye,
                  color: AppColors.white,
                ),
              )
            : null,

        // البوردر الأساسي
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          // borderSide: const BorderSide(color: AppColors.white, width: 1.5),
        ),
        // البوردر عند الفوكس
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.yellow, width: 2),
        ),
      ),
      minLines: widget.minLines,
      maxLines: widget.isPassword ? 1 : widget.minLines + 1,
      obscureText: widget.isPassword ? obscureText : false,
    );
  }
}
