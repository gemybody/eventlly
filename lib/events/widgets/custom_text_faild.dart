import 'package:flutter/material.dart';

class CustomTextFaild extends StatefulWidget {
  const CustomTextFaild({
    super.key,
    required this.title,
    required this.controller,
    this.prefixIcon,
    this.maxLines = 1,
    this.hintText,
  });
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final int? maxLines;

  @override
  State<CustomTextFaild> createState() => _CustomTextFaildState();
}

class _CustomTextFaildState extends State<CustomTextFaild> {
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.labelMedium),
        SizedBox(height: 8),
        TextFormField(
          focusNode: focusNode,

          maxLines: widget.maxLines,
          controller: widget.controller,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'field cannot be empty'
                      : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,

            hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color:
              //focusNode.hasFocus?Colors.pink: 
              Theme.of(
                context,
              ).textTheme.labelMedium!.color!.withOpacity(.8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
          ),
        ),
      ],
    );
  }
}
