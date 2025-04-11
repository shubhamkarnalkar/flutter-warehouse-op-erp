import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_erp/utils/localization/app_localization.dart';
import 'package:warehouse_erp/utils/localization/lang_text_constants.dart';

class GlobalMessenger {
  static void showSnackBarMessage(
      {required BuildContext context, String? error, String? message}) {
    if (error != null) {
      message = error;
    }
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message ?? ''),
          backgroundColor: error == null ? null : Colors.red,
        ),
      );
  }

  static List<String> messageFormatter(Object obj, [bool isLoginPage = false]) {
    try {
      throw obj;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.badResponse:
          return !isLoginPage
              ? ['401', LangTextConstants.msg_LoginFailedNeedtologinagain.tr]
              : ['401', LangTextConstants.msg_Invalidusernameorpassword.tr];
        case DioExceptionType.connectionTimeout:
          // TODO: lang
          return [
            e.response?.statusCode.toString() ?? '400',
            'Connection time out'
          ];

        case DioExceptionType.connectionError:
          // TODO: lang
          return [
            e.response?.statusCode.toString() ?? '401',
            'Connection Error'
          ];
        default:
          return [
            e.response?.statusCode.toString() ?? '400',
            e.message.toString()
          ];
      }
    } catch (e) {
      if (e.toString().contains('401')) {
        return !isLoginPage
            ? ['401', LangTextConstants.msg_LoginFailedNeedtologinagain.tr]
            : ['401', LangTextConstants.msg_Invalidusernameorpassword.tr];
      } else {
        switch (e) {
          case DioExceptionType.badResponse:
            return !isLoginPage
                ? ['401', LangTextConstants.msg_LoginFailedNeedtologinagain.tr]
                : ['401', LangTextConstants.msg_Invalidusernameorpassword.tr];
          case DioExceptionType.connectionTimeout:
            // TODO: lang
            return ['404', 'Connection time out'];
          case DioExceptionType.connectionError:
            // TODO: lang
            return ['404', 'Connection Error'];
          default:
            return ['0', LangTextConstants.msg_something_went_wrong.tr];
        }
      }
    }
  }
}
