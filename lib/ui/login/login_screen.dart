import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoko/api/activities_api.dart';
import 'package:yoko/api/login_api.dart';
import 'package:yoko/constants/app_colors.dart';
import 'package:yoko/constants/app_styles.dart';
import 'package:yoko/ui/activities/activities_screen.dart';
import 'package:yoko/ui/login/widgets/login_button.dart';
import 'package:yoko/ui/login/widgets/login_text_field.dart';
import 'package:yoko/ui/login/widgets/password_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final LoginApi api = LoginApi();

  final ActivitiesApi activity = ActivitiesApi();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.loginBg,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Добро пожаловать, Авторизуйтесь',
                style: AppStyles.loginTitle,
              ),
              SizedBox(height: 35.h),
              LoginTextField(
                controller: emailController,
              ),
              SizedBox(height: 16.h),
              PasswordTextField(
                passwordController: passwordController,
              ),
              SizedBox(height: 16.h),
              LoginButton(
                  disabled: emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty
                      ? false
                      : true,
                  onPressed: () async {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      api
                          .login(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        if (value.data?.accessToken != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ActivitiesScreen()),
                              (route) => false);
                        }
                      });
                    }
                  }),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Регистрация',
                    style: AppStyles.signUp,
                  ),
                  Text(
                    'Забыли пароль?',
                    style: AppStyles.signUp.copyWith(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
