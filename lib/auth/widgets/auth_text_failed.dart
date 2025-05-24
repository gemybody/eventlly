import 'package:eventlly/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthTextFailed extends StatefulWidget {
  const AuthTextFailed({
    super.key,
    required this.prefixIconPAth,
    this.hintText,
    this.password,
  });
  final String prefixIconPAth;
  final String? hintText;
  final bool? password;

  @override
  State<AuthTextFailed> createState() => _AuthTextFailedState();
}

class _AuthTextFailedState extends State<AuthTextFailed> {
  late bool isObscurs = widget.password ?? false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: isObscurs,
        decoration: InputDecoration(
          suffixIcon:
              widget.password == true
                  ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscurs = !isObscurs;
                      });
                    },
                    child: Icon(
                      isObscurs
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                    ),
                  )
                  : null,
          hintText: widget.hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              widget.prefixIconPAth,

              colorFilter: ColorFilter.mode(
                Theme.of(context).hoverColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).hoverColor,
          ),
          border: customBorder(),
          enabledBorder: customBorder(),
          focusedBorder: customBorder(focousColor: AppColors.mainColor),
        ),
      ),
    );
  }

  OutlineInputBorder customBorder({Color? focousColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      //علشان يعرف لونه في انهي ثيم
      borderSide: BorderSide(
        color: focousColor ?? Theme.of(context).hoverColor,
      ),
    );
  }
}
