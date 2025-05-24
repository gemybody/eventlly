import 'package:eventlly/auth/screen/login_screen.dart';
import 'package:eventlly/common/localizatoin_switch.dart';
import 'package:flutter/material.dart';
import 'package:eventlly/auth/widgets/auth_text_failed.dart';
import 'package:eventlly/common/app_assets.dart';
import 'package:eventlly/common/app_colors.dart';
import 'package:eventlly/common/custom_main_button.dart';
import 'package:eventlly/common/custom_text_Styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static const String routeName = '/signInScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Image.asset(
              AppAssets.logoScreen,
              height: MediaQuery.of(context).size.height * .2,
            ),
            SizedBox(height: 16),
            AuthTextFailed(
              prefixIconPAth: AppAssets.emailIcon,
              hintText: 'name', //TODO:localization
            ),
            AuthTextFailed(
              prefixIconPAth: AppAssets.emailIcon,
              hintText: 'Email', //TODO:localization
            ),
            AuthTextFailed(
              password: true,
              prefixIconPAth: AppAssets.passwordIcon,
              hintText: 'password', //TODO:localization
            ),
            AuthTextFailed(
              password: true,
              prefixIconPAth: AppAssets.passwordIcon,
              hintText: 'Re password', //TODO:localization
            ),

            CustomMainButton(tittle: 'Create Account', onPressed: () {}),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already Have Account ?',
                        style: TextStyle(
                          color: const Color(0xFF1C1C1C),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
              
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                //TODO:go to login
                                Navigator.of(
                                  context,
                                ).pushReplacementNamed(LoginScreen.routeName);
                              },
              
                        style: CustomTextStyles.style16w700dark.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.mainColor,
                          color: AppColors.mainColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            LocalizatoinSwitch(),
          ],
        ),
      ),
    );
  }
}
