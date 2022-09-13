import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, this.onPressed, this.disabled})
      : super(key: key);
  final bool? disabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              disabled == true ? Colors.white.withOpacity(0.1) : Colors.white),
          elevation: MaterialStateProperty.all(disabled == true ? 0 : 3),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Text(
          'Войти',
          style: TextStyle(
              color: disabled == true
                  ? Colors.white.withOpacity(0.5)
                  : AppColors.loginBg),
        ),
      ),
    );
  }
}
