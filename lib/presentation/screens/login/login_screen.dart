import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/core/constants/color_constants.dart';
import 'package:jp_app_flutter/core/constants/routes_constants.dart';
import 'package:jp_app_flutter/core/constants/strings_constants.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';
import 'package:jp_app_flutter/core/constants/widget_constants.dart';
import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/core/managers/routes_manager.dart';
import 'package:jp_app_flutter/core/themes/app_theme.dart';
import 'package:jp_app_flutter/core/utils/strings_utils.dart';
import 'package:jp_app_flutter/core/utils/utils.dart';
import 'package:jp_app_flutter/presentation/providers/login/login_provider.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_background.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_button_text.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_image.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_text_field.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_text_label.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key
  }): super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  LoginProvider state = getIt<LoginProvider>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void initState() {
    state = Provider.of<LoginProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    state = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
            child: _mainContainer()
        )
    );
  }

  ///--------------------------------- PRIVATE METHODS --------------------------------///
  /// Method create structure base of view
  Widget _mainContainer() {
    return Stack(
      children: [
        const WidgetBackground(key: Key(kWidgetBackground), colorBackground: kWhite),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDimens30, vertical: kDimens50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: kDimens2,
                        decoration: const BoxDecoration(
                          color: kPrimary,
                          borderRadius: BorderRadius.all(Radius.circular(kDimens40))
                        ),
                      ),
                    ),
                    const SizedBox(width: kDimens15),
                    WidgetTextLabel(
                      key: const Key(kWidgetTextLabelTitleLogin),
                      text: kLogin,
                      textAlign: TextAlign.center,
                      textStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
                          color: kPrimary,
                          fontSize: kDimens20,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    const SizedBox(width: kDimens15),
                    Expanded(
                      child: Container(
                        height: kDimens2,
                        decoration: const BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.all(Radius.circular(kDimens40))
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kDimens40),
                WidgetTextField(
                  controller: _emailTextController,
                  contentPadding: const EdgeInsets.symmetric(horizontal: kDimens10, vertical: kDimens12),
                  errorText: state.errorMessage,
                  key: const Key(kWidgetTextFieldEmail),
                  labelText: kEmail,
                  onChanged: (String value) {
                    state.emailValid = value.isValidEmail();
                  },
                  textInputType: TextInputType.emailAddress,
                  textStyle: AppTheme.getAppTheme().textTheme.bodySmall,
                  labelStyle: AppTheme.getAppTheme().textTheme.bodySmall,
                ),
                const SizedBox(height: kDimens20),
                WidgetTextField(
                  controller: _passwordTextController,
                  contentPadding: const EdgeInsets.symmetric(horizontal: kDimens10, vertical: kDimens12),
                  errorText: state.errorMessage,
                  key: const Key(kWidgetTextFieldPassword),
                  labelText: kPassword,
                  obscureText: state.showPassword,
                  onChanged: (String value) {
                    state.passwordValid = value.isValidPassword();
                  },
                  suffix: _iconShowPwd(
                    icon: const WidgetImage(
                      key: Key(kWidgetIconShowPassword),
                      image: kIconShowPwd,
                      color: kPrimary,
                    ),
                    onTap: () => state.showPassword = !state.showPassword
                  ),
                  textInputType: TextInputType.text,
                  textStyle: AppTheme.getAppTheme().textTheme.bodySmall,
                  labelStyle: AppTheme.getAppTheme().textTheme.bodySmall,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: state.errorMessage == kDefaultEmptyString ? false : true,
                    child: WidgetTextLabel(
                      key: const Key(kWidgetTextLabelErrorLogin),
                      text: state.errorMessage,
                      textAlign: TextAlign.start,
                      textStyle: AppTheme.getAppTheme().textTheme.bodySmall?.copyWith(
                          color: kPrimary,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: kDimens40),
                WidgetButtonText(
                  colorBackground: kPrimary,
                  key: const Key(kWidgetButtonLogin),
                  hasShadow: true,
                  isLoading: state.isLoading,
                  isEnabled: state.emailValid && state.passwordValid,
                  onTap: () => {
                    state.errorMessage = kDefaultEmptyString,
                    state.isLoading = true,
                    _login()
                  },
                  padding: const EdgeInsets.symmetric(vertical: kDimens10, horizontal: kDimens10),
                  text: kLogin,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  /// Method that show or hide text of text field
  /// [icon] : Widget for icon
  /// [onTap] : Function to execute
  Widget _iconShowPwd({
    required Widget icon,
    required Function onTap
  }) {
    return IconButton(
        onPressed: () {
          onTap();
        },
        icon: icon
    );
  }

  /// Method that execute login of user
  _login() {
    functionDelay(timeDuration: kDurationMs1500,
        function: () async{
          await state.login(
              email: _emailTextController.text,
              password: _passwordTextController.text
          ).then((bool isLogged) {
            if(isLogged) {
              route.openCitiesScreen(context);
            }
          }).whenComplete(() => state.isLoading = false);
        }
    );
  }
}