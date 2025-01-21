import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final bool isPassword;
  final String? labelText;
  final int? maxLines;
  final int? maxLength;
  final AutovalidateMode autoValidateMode;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String? semanticsLabel;
  final void Function()? onTap;
  final bool showDisabledColor;
  final bool alwaysShowBorders;
  final InputDecoration? inputDecoration;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int errorMaxLines;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool readOnly;
  final double? height;
  final void Function(String)? onFieldSubmitted;
  final bool? isDisableHintText;

  const CustomTextFormField({
    super.key,
    this.labelText,
    this.maxLines,
    this.maxLength,
    required this.textEditingController,
    this.labelStyle,
    this.labelPadding,
    this.inputDecoration,
    this.padding,
    this.hintStyle,
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.onChanged,
    this.isPassword = false,
    this.contentPadding,
    this.hintText,
    this.textInputType,
    this.border,
    this.focusedBorder,
    this.enabled = true,
    this.semanticsLabel,
    this.style,
    this.onTap,
    this.showDisabledColor = true,
    this.alwaysShowBorders = true,
    this.textInputAction,
    this.inputFormatters,
    this.errorMaxLines = 2,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,
    this.height = 55,
    this.onFieldSubmitted,
    this.isDisableHintText = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final ValueNotifier<int> errorCount = ValueNotifier(0);
  String validationMessage = '';

  final GlobalKey<FormFieldState> _globalKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null && !widget.isDisableHintText!)
          Padding(
            padding: widget.labelPadding ?? EdgeInsets.only(bottom: 4.h),
            child: Text(
              widget.labelText!,
              style: widget.labelStyle ??
                  TextStyle(
                    color: const Color(0xff2C2C39),
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ValueListenableBuilder(
            valueListenable: errorCount,
            builder: (context, errorCountValue, _) {
              return Container(
                height: widget.height ?? 54.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.red,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextFormField(
                        readOnly: widget.readOnly,
                        inputFormatters: widget.inputFormatters ??
                            [
                              LengthLimitingTextInputFormatter(
                                  widget.maxLength),
                            ],
                        autofocus: widget.autofocus,
                        textInputAction: widget.textInputAction,
                        textAlignVertical: TextAlignVertical.center,
                        autocorrect: false,
                        maxLines: widget.maxLines ?? 1,
                        enableSuggestions: widget.isPassword ? false : true,
                        contextMenuBuilder: (BuildContext context,
                            EditableTextState editableTextState) {
                          if (widget.isPassword) {
                            return const SizedBox();
                          } else {
                            return AdaptiveTextSelectionToolbar.editableText(
                              editableTextState: editableTextState,
                            );
                          }
                        },
                        enabled: widget.enabled,
                        keyboardType: widget.textInputType,
                        focusNode: widget.focusNode,
                        key: _globalKey,
                        controller: widget.textEditingController,
                        style: widget.style ??
                            TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                        autovalidateMode: widget.autoValidateMode,
                        onChanged: widget.onChanged,
                        decoration: InputDecoration(
                          errorMaxLines: widget.errorMaxLines,
                          enabledBorder: widget.alwaysShowBorders
                              ? const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                )
                              : null,
                          disabledBorder: widget.alwaysShowBorders
                              ? const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                )
                              : null,
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          errorStyle:
                              const TextStyle(fontSize: 0, color: Colors.red),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          filled: !widget.enabled && widget.showDisabledColor,
                          // fillColor: !widget.enabled && widget.showDisabledColor
                          //     ? _themeData.disabledColor
                          //     : Colors.white,
                          prefixIconConstraints: const BoxConstraints(
                            maxHeight: 37.5,
                            minHeight: 37.5,
                          ),
                          suffixIconConstraints: const BoxConstraints(
                            maxHeight: 35,
                            minHeight: 35,
                          ),
                          hintText: widget.isDisableHintText!
                              ? widget.labelText
                              : widget.hintText,
                          hintStyle: TextStyle(
                            color: const Color(0xff323941),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: (widget.contentPadding != null)
                              ? EdgeInsets.symmetric(
                                  vertical: widget.contentPadding!.vertical,
                                  horizontal: widget.contentPadding!.horizontal,
                                )
                              : const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 0,
                                ),
                          border: widget.border ??
                              const OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10),
                                  left: Radius.circular(10),
                                ),
                              ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10),
                              left: Radius.circular(10),
                            ),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        validator: (value) {
                          String? message = widget.validator?.call(value);
                          if (message != null && message.isNotEmpty) {
                            validationMessage = message;
                            errorCount.value++;
                          } else {
                            errorCount.value = 0;
                          }

                          return message;
                        },
                        onFieldSubmitted: widget.onFieldSubmitted,
                        obscureText: widget.isPassword,
                        onTap: widget.onTap,
                      ),
                    ),
                  ],
                ),
              );
            }),
        ValueListenableBuilder(
            valueListenable: errorCount,
            builder: (context, errorCountValue, _) {
              if (errorCountValue > 0) {
                return Column(
                  children: [
                    5.hGap,
                    Text(
                      validationMessage,
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    )
                  ],
                );
              }
              return 0.hGap;
            }),
      ],
    );
  }
}

extension Gap on num {
  SizedBox get hGap => SizedBox(
        height: SizeUtil.mediaQuery.size.height *
            (toDouble() / SizeUtil.baseHeight),
      );

  SizedBox get wGap => SizedBox(
        width:
            SizeUtil.mediaQuery.size.width * (toDouble() / SizeUtil.baseWidth),
      );

  double get h =>
      SizeUtil.mediaQuery.size.height * (toDouble() / SizeUtil.baseHeight);

  double get w =>
      SizeUtil.mediaQuery.size.width * (toDouble() / SizeUtil.baseWidth);
}

class SizeUtil {
  static late MediaQueryData _mediaQueryData;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }

  static MediaQueryData get mediaQuery => _mediaQueryData;
  static int get baseHeight => 913;
  static int get baseWidth => 375;
}
