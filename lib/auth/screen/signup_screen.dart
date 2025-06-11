import 'package:eventlly/auth/screen/login_screen.dart';
import 'package:eventlly/common/services/firebase_services.dart';
import 'package:eventlly/common/widgets/custom_text_styles.dart';
import 'package:eventlly/common/widgets/localizatoin_switch.dart';
import 'package:flutter/material.dart';
import 'package:eventlly/auth/widgets/auth_text_failed.dart';
import 'package:eventlly/common/app_assets.dart';
import 'package:eventlly/common/app_colors.dart';
import 'package:eventlly/common/widgets/custom_main_button.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String routeName = '/signInScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Image.asset(
              AppAssets.logoScreen,
              height: MediaQuery.of(context).size.height * .2,
            ),
            SizedBox(height: 16),
            AuthTextFailed(
              controller: nameController,
              prefixIconPAth: AppAssets.emailIcon,
              hintText: 'name', //TODO:localization
            ),
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
            AuthTextFailed(
              password: true,
              prefixIconPAth: AppAssets.passwordIcon,
              hintText: 'Re password', //TODO:localization
            ),

            loading
                ? Center(child: CircularProgressIndicator())
                : CustomMainButton(
                  tittle: 'Create Account',
                  onPressed: () {
                    setState(() {
                      loading = true;
                    });
                    FirebaseServices.registerUser(
                      email: emailController.text.trim(),
                      password: passwordController.text,
                      name: nameController.text.trim(),
                    ).then((value) {
                      setState(() {
                        loading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "User Registered Successfuly ",
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
                        text: 'Already Have Account ?',
                        style: Theme.of(context).textTheme.labelMedium,
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
