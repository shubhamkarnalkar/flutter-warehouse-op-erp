import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quickalert/quickalert.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:warehouse_erp/models/local_settings_model.dart';
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
      mobile: Scaffold(
        appBar: CustomAppBar(
          hasBackButton: true,
          title: LangTextConstants.lbl_set_urls.tr,
          actions: [
            TextButton(
              onPressed: () {
                sett.setUrl(urls[curl.value].url, txtURL.text);
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    confirmBtnColor: Theme.of(context)
                        .buttonTheme
                        .colorScheme!
                        .onPrimaryContainer,
                    text: '${urls[curl.value].name} URL value is saved');
              },
              child: Text(LangTextConstants.lbl_save.tr),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Select a URL to edit'),
                  URLSelectorChangeButton(
                    handleURLSelect: (p0) {
                      curl.value = p0;
                    },
                    selectedURL: curl.value,
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: TextField(
                  controller: txtURL,
                  maxLines: 5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
