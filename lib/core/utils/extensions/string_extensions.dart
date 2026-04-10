import 'package:chat_app/core/theming/theming_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension StringExtensions on String {
  Future<bool?> get showToast => Fluttertoast.showToast(fontSize: 16, msg: this, textColor: ThemingColors.whiteColor, backgroundColor: ThemingColors.greyColor);
}
