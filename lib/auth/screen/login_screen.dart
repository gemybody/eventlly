import 'package:eventlly/auth/screen/signup_screen.dart';
import 'package:eventlly/auth/widgets/auth_text_failed.dart';
import 'package:eventlly/common/app_assets.dart';
import 'package:eventlly/common/app_colors.dart';
import 'package:eventlly/common/services/firebase_services.dart';
import 'package:eventlly/common/widgets/custom_main_button.dart';
import 'package:eventlly/common/widgets/custom_main_outlined_button.dart';
import 'package:eventlly/common/widgets/custom_text_styles.dart';
import 'package:eventlly/common/widgets/localizatoin_switch.dart';
import 'package:eventlly/home/main_layer_Screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: ListView(
          padding: EdgeInsets.all(16),

          children: [
            Image.asset(
              AppAssets.logoScreen,
              height: MediaQuery.of(context).size.height * .2,
            ),
            SizedBox(height: 16),
            AuthTextFailed(
              controller: emailController,
              prefixIconPAth: AppAssets.emailIcon,
              hintText: 'Email', //TODO:localization
            ),
            AuthTextFailed(
              controller: passwordController,
              password: true,
              prefixIconPAth: AppAssets.passwordIcon,
              hintText: 'password', //TODO:localization
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password?',
                    style: CustomTextStyles.style16w700dark.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.mainColor,
                      color: AppColors.mainColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            loading
                ? Center(child: CircularProgressIndicator())
                : CustomMainButton(
                  tittle: 'Login',
                  onPressed: () {
                    setState(() {
                      loading = true;
                    });
                    FirebaseServices.logInUser(
                      email: emailController.text.trim(),
                      password: passwordController.text,
                    ).then((value) {
                      setState(() {
                        loading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "User LogidIn Successfuly${value?.name} ",
                            style: CustomTextStyles.style18w500light,
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    });
                  },
                ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: " Don’t Have Account ? ",

                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Create Account',
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                //TODO:go to signup
                                Navigator.of(
                                  context,
                                ).pushReplacementNamed(SignupScreen.routeName);
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
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Or',
                    style: CustomTextStyles.style16w500dark.copyWith(
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            CustomMainOutlinedButton(
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(AppAssets.GoogleIcon),
              ),
              tittle: 'Login With Google',
              onPressed: () {},
            ),
            SizedBox(height: 30),
            LocalizatoinSwitch(),
          ],
        ),
      ),
    );
  }
}
