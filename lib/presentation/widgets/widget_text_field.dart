import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/core/constants/color_constants.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';

class WidgetTextField extends StatefulWidget {
  final TextEditingController _controller;
  final EdgeInsets? _contentPadding;
  final FocusNode? _focusNode;
  final String? _labelText;
  final TextStyle? _labelStyle;
  final InputDecoration? _inputDecoration;
  final List<TextInputFormatter>? _inputFormatters;
  final int _maxLength;
  final bool _obscureText;
  final Function(String) _onChanged;
  final Widget? _prefix;
  final Widget? _suffix;
  final TextAlign? _textAlign;
  final TextCapitalization? _textCapitalization;
  final TextStyle? _textStyle;
  final TextInputType? _textInputType;

  WidgetTextField(
      {TextEditingController? controller,
      EdgeInsets? contentPadding,
      String? errorText,
      FocusNode? focusNode,
      String? labelText,
      TextStyle? labelStyle,
      InputDecoration? inputDecoration,
      List<TextInputFormatter>? inputFormatters,
      required Key key,
      int? maxLength,
      bool? obscureText,
      required Function(String) onChanged,
      Widget? prefix,
      Widget? suffix,
      TextAlign? textAlign,
      TextCapitalization? textCapitalization,
      TextStyle? textStyle,
      TextInputType? textInputType})
      : _controller = controller ?? TextEditingController(text: kDefaultEmptyString),
        _contentPadding = contentPadding,
        _focusNode = focusNode,
        _labelText = labelText,
        _labelStyle = labelStyle,
        _inputDecoration = inputDecoration,
        _inputFormatters = inputFormatters ?? const [],
        _maxLength = maxLength ?? kDefaultInitInt,
        _obscureText = obscureText ?? false,
        _onChanged = onChanged,
        _prefix = prefix,
        _suffix = suffix,
        _textAlign = textAlign,
        _textCapitalization = textCapitalization,
        _textStyle = textStyle,
        _textInputType = textInputType,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetTextField();
}

class _WidgetTextField extends State<WidgetTextField> {
  @override
  Widget build(BuildContext context) {
    return _createTextField();
  }

  /// Method that creates the main content of the textFieldInput
  Widget _createTextField() {
    return TextField(
      controller: widget._controller,
      decoration: widget._inputDecoration ?? _createInputDecoration(),
      focusNode: widget._focusNode,
      inputFormatters: widget._inputFormatters,
      keyboardType: widget._textInputType,
      maxLength: widget._maxLength,
      obscureText: widget._obscureText,
      onChanged: (String value) {
        widget._onChanged(value);
      },
      style: widget._textStyle,
      textAlign: widget._textAlign ?? TextAlign.start,
      textCapitalization: widget._textCapitalization ?? TextCapitalization.none,
    );
  }

  /// Method that configure the icon in the prefix
  Widget? _createPrefixIcon() {
    if (widget._prefix == null) {
      return null;
    } else {
      return widget._prefix;
    }
  }

  /// Method that configure the icon in the suffix
  Widget? _createSuffixIcon() {
    if (widget._suffix == null) {
      return null;
    } else {
      return widget._suffix;
    }
  }

  /// Method that customize the textField input decoration
  InputDecoration _createInputDecoration() {
    return InputDecoration(
      counter: const Offstage(),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(kDimens10))),
        contentPadding: widget._contentPadding,
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(kDimens10))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(kDimens10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kGray, width: kDimens05),
            borderRadius: BorderRadius.all(Radius.circular(kDimens10))),
        fillColor: kGray.withOpacity(.2),
        filled: true,
        labelText: widget._labelText,
        labelStyle: widget._labelStyle,
        prefixIcon: _createPrefixIcon(),
        suffixIcon: _createSuffixIcon()
    );
  }
}
