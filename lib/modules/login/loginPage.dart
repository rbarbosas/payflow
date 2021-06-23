import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/themes/appColors.dart';
import 'package:payflow/shared/themes/appImages.dart';
import 'package:payflow/shared/themes/appTextStyles.dart';
import 'package:payflow/shared/themes/widgets/socialLogin/googleLoginButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: 185,
              color: AppColors.primary,
            ),
            Positioned(
              top: 25,
              right: 0,
              left: 0,
              child: Image.asset(AppImages.person, width: 208, height: 273),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 320,
              child: Column(
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 70, right: 70),
                    child: Text("Organize seus boletos em um só lugar",
                        textAlign: TextAlign.center,
                        style: TextStyles.titleHome),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: GoogleLoginButton(onTap: () async {
                      GoogleSignIn _googleSignIn = GoogleSignIn(
                        scopes: [
                          'email',
                          'https://www.googleapis.com/auth/contacts.readonly',
                        ],
                      );

                      try {
                        final response = await _googleSignIn.signIn();
                        print(response);
                      } catch (error) {
                        print(error);
                      }
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
