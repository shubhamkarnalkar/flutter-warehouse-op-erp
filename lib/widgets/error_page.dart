import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/utils/utils.dart';
import 'package:warehouse_erp/views/login_page.dart';

class ErrorPage extends ConsumerWidget {
  final Object? obj;
  const ErrorPage({super.key, this.obj});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorList = GlobalMessenger.messageFormatter(
        obj.runtimeType == DioException ? obj as DioException : Object());

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.error_sharp,
              size: 60,
              color: Colors.redAccent,
            ),
          ),
          if (obj.runtimeType == String)
            Text(
              obj as String,
              style: Theme.of(context).textTheme.headlineSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          else if (errorList[0].toString().contains('404'))
            Column(
              children: [
                Text(
                  errorList[1].toString(),
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          else
            Column(
              children: [
                Text(
                  errorList[1],
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                switch (errorList[0].toString()) {
                  String() => errorList[0].toString().contains('401')
                      ? TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          ),
                          // TODO: lang
                          child: const Text('Go To Login Page'),
                        )
                      : const Text(''),
                }
              ],
            ),
        ],
      ),
    );
  }
}
