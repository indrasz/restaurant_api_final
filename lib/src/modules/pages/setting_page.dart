import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyar_final/src/modules/widgets/custom_dialog.dart';
import 'package:foodyar_final/src/providers/preference_provider.dart';
import 'package:foodyar_final/src/providers/schedule_provider.dart';
import 'package:provider/provider.dart';

import '../../res/res.dart';
import '../widgets/platform_widget.dart';

class SettingPage extends StatelessWidget {
  static const String settingsTitle = 'Settings';

  const SettingPage({Key? key}) : super(key: key);

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreenColor,
        title: const Text(settingsTitle),
      ),
      resizeToAvoidBottomInset: true,
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(settingsTitle),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<PreferenceProvider>(
      builder: (context, provider, child) {
        return ListView(
          children: [
            Material(
              child: ListTile(
                title: const Text('Notification'),
                trailing: Consumer<ScheduleProvider>(
                  builder: (context, scheduled, _) {
                    return Switch.adaptive(
                      activeColor: kGreenColor,
                      value: provider.isDailyRestaurant,
                      onChanged: (value) async {
                        if (Platform.isIOS) {
                          customDialog(context);
                        } else {
                          scheduled.scheduledReminder(value);
                          provider.enableDailyRestaurant(value);
                        }
                      },
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
