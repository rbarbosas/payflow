import 'package:flutter/material.dart';
import 'modules/login/loginPage.dart';
import 'shared/themes/appColors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
