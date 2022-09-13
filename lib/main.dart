import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:yoko/ui/login/login_screen.dart';

import 'init_widget.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('users');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen(),

          // BlocBuilder<LoginBloc, LoginState>(
          //   builder: (context, state) {
          //     if (state is UnAuthState) {
          //       print(state);
          //       return LoginScreen();
          //     } else {
          //       return const ActivitiesScreen();
          //     }
          //   },
          // ),
        ),
      ),
    );
  }
}
