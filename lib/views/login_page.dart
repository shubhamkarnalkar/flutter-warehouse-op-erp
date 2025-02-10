import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:warehouse_erp/utils/utils.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neopop/neopop.dart';
import '../controllers/login/login_page_notifier.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // ref.watch(themeProvider);
    final theme = Theme.of(context);
    final pageState = ref.watch(loginPageNotifier);
    final ispwdVisible = ref.watch(
      loginPageNotifier.select((value) => value.isPwdVisible),
    );
    final langNow = ref.watch(currentLangProvider);
    // ignore: prefer_const_declarations
    final bool isButtonActive = true;
    // ((pageState.comIDTextController?.text.isNotEmpty ?? false) &&
    //     (pageState.loginPagePasswordController?.text.isNotEmpty ?? false));
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('hey ther'),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        companyLogo(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    ImageConstant.manLoginPageSVG,
                    height: 200,
                    width: 240,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          child: Text(
                            LangTextConstants.lbl_welcome_back.tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 50,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: const FaIcon(
                            Icons.person_outline,
                            size: 30,
                          ),
                          hintText: LangTextConstants.lbl_com_id.tr,
                        ),
                        controller: pageState.comIDTextController,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscuringCharacter: '●',
                        decoration: InputDecoration(
                          hintText: LangTextConstants.lbl_password.tr,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              ref
                                  .read(loginPageNotifier.notifier)
                                  .changeVisibility();
                            },
                            child: ispwdVisible
                                ? const FaIcon(
                                    Icons.remove_red_eye,
                                    size: 30,
                                  )
                                : const FaIcon(
                                    Icons.key,
                                    size: 30,
                                  ),
                          ),
                        ),
                        // obscureText: !ispwdVisible,
                        obscureText: !ispwdVisible,
                        controller: pageState.loginPagePasswordController,
                      ),
                      const SizedBox(height: 20),
                      // CustomElevatedButton(
                      //   text: LangTextConstants.lbl_login.tr,
                      //   onPressed: () {
                      //     // ref.read(loginPageNotifier.notifier).login(context);
                      //     context.goNamed(RouteConstants.home);
                      //   },
                      // ),
                      SizedBox(
                        width: 300,
                        child: NeoPopTiltedButton(
                          isFloating: true,
                          // enabled: isButtonActive,
                          onTapUp: () {
                            isButtonActive
                                ? context.goNamed(RouteConstants.home)
                                // ignore: dead_code
                                : null;
                          },
                          decoration: NeoPopTiltedButtonDecoration(
                            color: theme.colorScheme.primary,
                            // plunkColor: Color.fromRGBO(255, 235, 52, 1),
                            plunkColor: theme.colorScheme.primary,
                            shadowColor: const Color.fromRGBO(36, 36, 36, 1),
                            // shadowColor: theme.colorScheme.inversePrimary,
                            showShimmer: true,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 70.0,
                              vertical: 15,
                            ),
                            child: Center(
                              child: Text(
                                LangTextConstants.lbl_login.tr,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Text(ispwdVisible.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${langNow.flag} ${langNow.name}'),
                          LanguageChangeButton(
                            handleLanguageSelect: ref
                                .watch(settingsControllerProvider.notifier)
                                .setLanguage,
                            localeSelected:
                                ref.watch(currentLangProvider).languageCode,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
