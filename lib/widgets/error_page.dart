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
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.error_sharp,
                  size: 60,
                  color: Colors.redAccent,
                ),
              ),
              obj.runtimeType == String
                  ? Text(
                      obj as String,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  : Column(
                      children: [
                        Text(
                          GlobalMessenger.messageFormatter(
                              obj.runtimeType == DioException
                                  ? obj as DioException
                                  : Object())[1],
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        switch (GlobalMessenger.messageFormatter(
                                obj.runtimeType == Object
                                    ? obj as DioException
                                    : Object())[0]
                            .toString()) {
                          '401' => TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              ),
                              child: Text(GlobalMessenger.messageFormatter(
                                obj.runtimeType == Object
                                    ? obj as DioException
                                    : Object(),
                              )[1]),
                            ),
                          String() => TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              ),
                              child: const Text('Go To Login Page'),
                            ),
                        }
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
