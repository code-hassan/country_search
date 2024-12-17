import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/utills/resources/baseWidgets/textWidget.dart';
import '../colors/app_colors.dart';

class BaseTextField extends StatelessWidget {
   const BaseTextField({
     super.key,
     this.validator,
     required this.hintText,
     this.focusNode,
     required this.textController,
     this.obscureText = false,
     this.keyboardType,
     this.onSuffixIconPressed, this.onSuffixIcon, this.prefixIcon, this.onTap, this.onChanged, this.isDecorated = false,
     this.textAlign = TextAlign.start, this.autofocus,
     this.textFieldTitle, this.contentPadding, this.enabled,
     this.maxLength,
     this.labelText, this.onSaved, this.inputFormatter, this.textInputAction,
   });
   final String? Function(String?)? validator;
   final String hintText;
   final bool obscureText;
   final FocusNode? focusNode;
   final TextEditingController textController;
   final TextInputType? keyboardType;
   final Function()? onSuffixIconPressed;
   final IconData? onSuffixIcon;
   final Widget? prefixIcon;
   final Function()? onTap;
   final Function(String)? onChanged;
   final bool? isDecorated;
   final TextAlign textAlign;
   final bool? autofocus;
   final String? textFieldTitle;
   final EdgeInsetsGeometry? contentPadding;
   final bool? enabled;
   final int? maxLength;
   final String? labelText;
   final void Function(String?)? onSaved;
   final List<TextInputFormatter>? inputFormatter;
   final TextInputAction? textInputAction;


   @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFieldTitle != null
              ? BaseText(
            text: textFieldTitle!,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColor.blackColor,
          )
              : const SizedBox(),
          SizedBox(height: textFieldTitle != null ? 10 : 0,),
          TextFormField(
            style:  TextStyle(
              color: AppColor.blackColor,
              fontSize: contentPadding == null ? 14 : 12,
              fontWeight: contentPadding == null ? FontWeight.w500 : FontWeight.w400,
            ),
            textAlign: textAlign,
            controller: textController,
            focusNode: focusNode,
            obscureText: obscureText,
            validator: validator,
            keyboardType: keyboardType,
            onTap: onTap,
            onSaved: onSaved,
            autofocus: autofocus ?? false,
            maxLength: maxLength,
            decoration: InputDecoration(
              filled: true,
              enabled: enabled ?? true,
              hintText: hintText.tr,
              labelText: labelText?.tr,
              hintStyle:  TextStyle(
                fontSize: contentPadding == null ? 14 : 12,
                fontWeight: contentPadding == null
                    ? FontWeight.w500
                    : FontWeight.w400,
                color: AppColor.blackColor,
              ),
              labelStyle: TextStyle(
                fontSize: contentPadding == null ? 14 : 12,
                fontWeight: contentPadding == null
                    ? FontWeight.w500
                    : FontWeight.w400,
                color: AppColor.blackColor,
              ),
              border: isDecorated == true ? null : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColor.blackColor,),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColor.blackColor,),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColor.blackColor,),
              ),
              disabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColor.blackColor)
              ),
              suffixIcon: onSuffixIcon == null ? null : IconButton(
                onPressed: onSuffixIconPressed,
                icon: Container(
                  height: 22,
                  width: 22,
                  child: Icon(
                    onSuffixIcon,
                    color: Colors.teal,
                  ),
                ),
              ),
              prefixIcon: prefixIcon,
              fillColor:  AppColor.whiteColor,
              contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            ),
            cursorColor: AppColor.blackColor,
            inputFormatters: inputFormatter,
            onChanged: onChanged,
            textInputAction: textInputAction,
          ),
        ],
      );
  }
}
