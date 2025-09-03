import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundcolor;
  final String text;
  final Function() onClick;
  final Color textColor;
  final Image? image;

  const CustomButton({
    super.key,
    this.backgroundcolor = AppColors.yellow,
    required this.text,
    required this.onClick,
    this.textColor = AppColors.black,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.yellow, width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null) ...[image!, const SizedBox(width: 8)],
            Text(
              text,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
