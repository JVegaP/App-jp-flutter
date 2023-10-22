import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/color_constants.dart';
import 'package:jp_app_flutter/core/constants/strings_constants.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';
import 'package:jp_app_flutter/core/constants/widget_constants.dart';
import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/core/themes/app_theme.dart';
import 'package:jp_app_flutter/presentation/providers/games/games_provider.dart';
import 'package:jp_app_flutter/presentation/screens/games/widgets/widget_item_game.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_background.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_text_label.dart';
import 'package:provider/provider.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({
    Key? key
  }): super(key: key);

  @override
  GamesScreenState createState() => GamesScreenState();
}

class GamesScreenState extends State<GamesScreen> {
  GamesProvider state = getIt<GamesProvider>();

  @override
  void initState() {
    state = Provider.of<GamesProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _getGames();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    state = Provider.of<GamesProvider>(context, listen: true);
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
                itemCount: state.games.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return WidgetItemGame(
                      key: const Key(kWidgetItemGames),
                      item: state.games.elementAt(index),
                      onTap: () {}
                  );
                }
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
        key: const Key(kWidgetTextLabelTitleGames),
        text: kGames,
        textAlign: TextAlign.center,
        textStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
            color: kWhite,
            fontSize: kDimens20,
            fontWeight: FontWeight.w900
        ),
      ),
    );
  }

  /// Method that obtain list of games
  _getGames() async {
    state.isLoading = true;
    await state.getGames().then((value) => {
      state.games = value
    }).whenComplete(() => state.isLoading = false);
  }

}