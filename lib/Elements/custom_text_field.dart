import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shalimar/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Widget? icon;
  final Widget? iconPerfix;
  final TextEditingController? controller;

  final FocusNode? focusNode;
  final AutovalidateMode? AutovalidateModes;
  // final FocusNode nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final bool isTrue;
  final bool obscureText;

  // final Function()? onChanged;
  final VoidCallback onIconTap;
  final VoidCallback? callBack;

  // final Function onSubmit;
  final bool isEnabled;
  final int maxLines;
  final int? maxLength;

  final TextCapitalization capitalization;
  final double prefixSize;
  final bool divider;
  final TextAlign textAlign;
  final bool isAmount;
  final bool isNumber;
  final bool showTitle;

  // final TextStyle hintStyle;
  // final TextStyle labelStyle;
  final bool readOnly;

  final List<TextInputFormatter>? inputFormat;
  final FormFieldValidator<String>? validator;
  final FormFieldValidator<String>? onChanged;

  CustomTextField({
    required this.hintText,
    required this.labelText,
    this.controller,
    this.focusNode,
    // this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.maxLength,
    // this.onSubmit,
    this.onChanged,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.isTrue = false,
    this.prefixSize = 10,
    this.divider = false,
    this.textAlign = TextAlign.start,
    this.isAmount = false,
    this.isNumber = false,
    this.showTitle = false,
    // this.hintStyle,
    // this.labelStyle,
    this.icon,
    this.inputFormat,
    this.validator,
    // required this.onIconTap,
    this.readOnly = false,
    this.callBack,
    required this.onIconTap,
    required this.obscureText,
    this.AutovalidateModes,
    this.iconPerfix,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 48,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        autovalidateMode: widget.AutovalidateModes,
        inputFormatters: widget.inputFormat,
        onTap: widget.callBack,
        obscureText: widget.obscureText,
        readOnly: widget.readOnly,
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: widget.focusNode,
        textAlign: widget.textAlign,
        textInputAction: widget.inputAction,
        keyboardType: widget.isAmount ? TextInputType.number : widget.inputType,
        cursorColor: primaryColor,
        textCapitalization: widget.capitalization,
        enabled: widget.isEnabled,
        autofocus: false,

        // obscureText: widget.isPassword ? _obscureText : false,

        // inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
        //     : widget.isAmount ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))] : widget.isNumber ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))] : null,

        // inputFormatters: widget.inputFormat,
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              borderSide: BorderSide(
                color: blackTextColor,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              borderSide: BorderSide(
                color: Color(0xffECE6E6),
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              borderSide: BorderSide(
                color: Color(0xffECE6E6),
              )),
          hintText: widget.hintText,
          errorStyle: TextStyle(height: 1),
          hintStyle: TextStyle(
              color:  Color(0xff4F6273),
              fontSize: 12,
              fontWeight: FontWeight.w600),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color:  Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600),
          suffixIcon: widget.isPassword ? widget.iconPerfix : null,
          prefixIcon: widget.isTrue ? widget.icon : null,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
