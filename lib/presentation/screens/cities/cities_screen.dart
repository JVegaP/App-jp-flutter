import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/core/constants/color_constants.dart';
import 'package:jp_app_flutter/core/constants/strings_constants.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';
import 'package:jp_app_flutter/core/constants/widget_constants.dart';
import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/core/managers/routes_manager.dart';
import 'package:jp_app_flutter/core/themes/app_theme.dart';
import 'package:jp_app_flutter/core/utils/utils.dart';
import 'package:jp_app_flutter/domain/models/cities/city_model.dart';
import 'package:jp_app_flutter/presentation/providers/cities/cities_provider.dart';
import 'package:jp_app_flutter/presentation/screens/cities/widgets/widget_item_city.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_background.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_button_text.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_text_label.dart';
import 'package:provider/provider.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({
    Key? key
  }): super(key: key);

  @override
  CitiesScreenState createState() => CitiesScreenState();
}

class CitiesScreenState extends State<CitiesScreen> {
  CitiesProvider state = getIt<CitiesProvider>();

  @override
  void initState() {
    state = Provider.of<CitiesProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _getCities();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    state = Provider.of<CitiesProvider>(context, listen: true);
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
          _header(),
          state.isLoading ? const Center(
            child: SizedBox(
              height: kDimens50,
              width: kDimens50,
              child: CircularProgressIndicator(
                color: kPrimary,
                strokeWidth: kDimens5,
              ),
            ),
          ) : Padding(
            padding: const EdgeInsets.only(top: kDimens60),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(kDimens20),
                itemCount: state.cities.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return WidgetItemCity(
                      key: const Key(kWidgetItemCities),
                      item: state.cities.elementAt(index),
                      onTap: (value) {
                        state.selected = index;
                        state.isSelect = true;
                      }
                  );
                }
            ),
          ),
          Visibility(
            visible: state.isSelect,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(kDimens15),
                child: WidgetButtonText(
                  colorBackground: kPrimary,
                  key: const Key(kWidgetButtonContinueCities),
                  hasShadow: true,
                  isLoading: false,
                  isEnabled: true,
                  onTap: () => {
                    _goToGames()
                  },
                  padding: const EdgeInsets.symmetric(vertical: kDimens10, horizontal: kDimens10),
                  text: kContinue,
                ),
              ),
            ),
          )
        ]
    );
  }

  /// Method create structure of view header
  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: kDimens15, horizontal: kDimens20),
      decoration: const BoxDecoration(
        color: kPrimary
      ),
      child:  WidgetTextLabel(
        key: const Key(kWidgetTextLabelTitleCities),
        text: kCities,
        textAlign: TextAlign.center,
        textStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
            color: kWhite,
            fontSize: kDimens20,
            fontWeight: FontWeight.w900
        ),
      ),
    );
  }

  /// Method that obtain list of cities
  _getCities() {
    state.isLoading = true;
    functionDelay(timeDuration: kDurationMs1500,
        function: () async{
          await state.getCities().then((value) => {
            state.cities = value
          }).whenComplete(() => state.isLoading = false);
        }
    );
  }

  /// Method that navigate to games screen
  _goToGames() {
    route.openGamesScreen(context);
  }
}