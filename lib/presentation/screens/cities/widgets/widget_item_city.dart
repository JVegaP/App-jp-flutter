import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/constants/color_constants.dart';
import 'package:jp_app_flutter/core/constants/style_constants.dart';
import 'package:jp_app_flutter/core/themes/app_theme.dart';
import 'package:jp_app_flutter/domain/models/cities/city_model.dart';
import 'package:jp_app_flutter/presentation/widgets/widget_text_label.dart';

/// Class that create a item customizable for the cities
class WidgetItemCity extends StatelessWidget {
  final CityModel _item;
  final Function(bool) _onTap;

  const WidgetItemCity({
    required Key key,
    required CityModel item,
    required Function(bool) onTap
  }): _item = item,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(kDimens10)),
            boxShadow: [
              BoxShadow(
                  blurRadius: kDimens10,
                  color: kShadowLight,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(kDimens1, kDimens1)
              )
            ],
            color: kWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kDimens15, horizontal: kDimens10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: kDimens20,
                  width: kDimens20,
                  child: Checkbox(
                    value: _item.selected,
                    onChanged: (value) {
                      _onTap(value ?? true);
                    },
                    checkColor: kWhite,
                    activeColor: kPrimary,
                    side: const BorderSide(color: kPrimary),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kDimens5)
                    ),
                  ),
                ),
                const SizedBox(width: kDimens10),
                Expanded(
                    child: WidgetTextLabel(
                      key: Key('${_item.id}${_item.name}'),
                      text: _item.name,
                      textAlign: TextAlign.start,
                      textStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
                          color: kBlack,
                          fontSize: kDimens15,
                          fontWeight: FontWeight.w900
                      ),
                    )
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: kDimens20)
      ],
    );
  }
}