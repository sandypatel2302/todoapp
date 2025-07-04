import 'package:flutter/material.dart';
import 'package:todoapp/utils/constants.dart';
import 'package:todoapp/utils/widgets/customtext.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  ValueNotifier<bool> one = ValueNotifier(false);
  ValueNotifier<bool> two = ValueNotifier(false);
  ValueNotifier<bool> three = ValueNotifier(false);
  ValueNotifier<bool> four = ValueNotifier(false);
  ValueNotifier<bool> five = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Customtext(text: Constants.one)),
                  ValueListenableBuilder(
                    builder: (context, val, child) {
                      return Switch(value: val, onChanged: (enable) {
                        one.value = enable;
                      });
                    },
                    valueListenable: one,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Customtext(text: Constants.two)),
                  ValueListenableBuilder(
                    builder: (context, val, child) {
                      return Switch(value: val, onChanged: (enable) {
                        two.value = enable;
                      });
                    },
                    valueListenable: two,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Customtext(text: Constants.three)),
                  ValueListenableBuilder(
                    builder: (context, val, child) {
                      return Switch(value: val, onChanged: (enable) {
                        three.value = enable;
                      });
                    },
                    valueListenable: three,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Customtext(text: Constants.four)),
                  ValueListenableBuilder(
                    builder: (context, val, child) {
                      return Switch(value: val, onChanged: (enable) {
                        four.value = enable;
                      });
                    },
                    valueListenable: four,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Customtext(text: Constants.five)),
                  ValueListenableBuilder(
                    builder: (context, val, child) {
                      return Switch(value: val, onChanged: (enable) {
                        five.value = enable;
                      });
                    },
                    valueListenable: five,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
