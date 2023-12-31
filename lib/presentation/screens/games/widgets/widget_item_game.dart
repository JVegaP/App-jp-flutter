import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/app_constants.dart';
import 'package:jp_app_flutter/core/constants/color_constants.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';
import 'package:jp_app_flutter/core/constants/widget_constants.dart';
import 'package:jp_app_flutter/core/themes/app_theme.dart';
import 'package:jp_app_flutter/domain/models/games/game_model.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_text_label.dart';

/// Class that create a item customizable for the game
class WidgetItemGame extends StatefulWidget {
  final GameModel _item;
  final Function() _onTap;

  const WidgetItemGame({
    required Key key,
    required GameModel item,
    required Function() onTap,
  }): _item = item,
        _onTap = onTap,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetItemGame();

}

class _WidgetItemGame extends State<WidgetItemGame> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            widget._onTap();
          },
          child: Container(
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(kDimens15)),
              boxShadow: [
                BoxShadow(
                    blurRadius: kDimens10,
                    color: kShadowLight,
                    offset: Offset(kDimens1, kDimens2)
                )
              ],
              color: kWhite
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kDimens10, horizontal: kDimens15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: kDimens100,
                      width: kDimens100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(kDimens15)),
                          border: Border.all(
                            width: kDimens05,
                            color: kGray
                          ),
                          color: kGray.withOpacity(kDimens05),
                          image: DecorationImage(
                            image: NetworkImage(urlImage()),
                            fit: BoxFit.fill,
                          )
                      )
                  ),
                  const SizedBox(width: kDimens10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        WidgetTextLabel(
                          key: const Key(kWidgetTextLabelTitleItemGame),
                          text: widget._item.title,
                          textStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: kDimens13
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                        const SizedBox(height: kDimens5),
                        WidgetTextLabel(
                          key: const Key(kWidgetTextLabelDescriptionItemGame),
                          text: widget._item.description,
                          textAlign: TextAlign.start,
                          textStyle: AppTheme.getAppTheme().textTheme.bodySmall?.copyWith(
                              color: kGray,
                              fontSize: kDimens11
                          ),
                          maxLines: 4,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ),
        const SizedBox(height: kDimens20)
      ],
    );
  }

  /// Method that change path of image
  String urlImage() {
    var path = widget._item.thumbnail?.path.replaceAll("http", "https") ?? kDefaultEmptyString;
    var extension = widget._item.thumbnail?.extension;
    return '$path.$extension';
  }
}