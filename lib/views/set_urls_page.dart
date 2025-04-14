import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quickalert/quickalert.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:warehouse_erp/models/app_model.dart';
import 'package:warehouse_erp/utils/utils.dart';
import 'package:warehouse_erp/widgets/url_selector_button.dart';
import '../widgets/custom_widgets.dart';

class SetUrlPage extends StatefulHookConsumerWidget {
  const SetUrlPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SetUrlPageState();
}

class _SetUrlPageState extends ConsumerState<SetUrlPage> {
  @override
  Widget build(BuildContext context) {
    final sett = ref.watch(settingsControllerProvider.notifier);
    final curl = useState(0);
    final txtURL = useTextEditingController();
    final urls = UrlsAppModel.urlTypes();
    txtURL.text = sett.getURL(curl.value);
    return Responsive(
      mobile: _Mob(
        txtURL: txtURL,
        sett: sett,
        urls: urls,
        curl: curl,
        hasBackButton: true,
      ),
      tablet: _Mob(
        txtURL: txtURL,
        sett: sett,
        urls: urls,
        curl: curl,
        hasBackButton: false,
      ),
    );
  }
}

class _Mob extends StatelessWidget {
  const _Mob(
      {required this.txtURL,
      required this.sett,
      required this.urls,
      required this.curl,
      required this.hasBackButton});

  final TextEditingController txtURL;
  final SettingsController sett;
  final List<UrlsAppModel> urls;
  final ValueNotifier<int> curl;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasBackButton: hasBackButton,
        title: LangTextConstants.lbl_set_urls.tr,
      ),
      body: Column(
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Select a URL to edit'),
                  ),
                  URLSelectorChangeButton(
                    handleURLSelect: (p0) {
                      curl.value = p0;
                    },
                    selectedURL: curl.value,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 100,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(style: BorderStyle.solid, width: 2),
                  ),
                ),
                controller: txtURL,
                maxLines: 3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                OutlinedButton(
                  onPressed: () {
                    if (txtURL.text.isEmpty) {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          animType: QuickAlertAnimType.slideInUp,
                          confirmBtnColor: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .onPrimaryContainer,
                          // TODO lang
                          text: 'The value is empty');
                    } else {
                      sett.setUrl(urls[curl.value].url, txtURL.text);
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          animType: QuickAlertAnimType.slideInUp,
                          confirmBtnColor: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .onPrimaryContainer,
                          // TODO lang
                          text: '${urls[curl.value].name} URL value is saved');
                    }
                  },
                  child: Text(LangTextConstants.lbl_save.tr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
