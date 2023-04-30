import 'package:flutter/material.dart';
import 'package:keep_notes/Services/login_info.dart';
import 'package:keep_notes/colors.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late bool value = false;
  getSyncSet() async {
    //print("value ${value}");
    LocalDataSaver.getSyncSet().then((valueFromDb) {
      //print("value ${valueFromDb}");
      //print("hello");
      setState(() {
        //print("hii");
        value = valueFromDb!;
        //print(value);
      });
    });
  }

  @override
  void initState() {
    getSyncSet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: bgColor.withOpacity(0.3),
        elevation: 1.0,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Sync",
                  style: TextStyle(
                    color: bgColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Transform.scale(
                  scale: 1.3,
                  child: Switch.adaptive(
                    value: value,
                    onChanged: (switchvalue) {
                      setState(() {
                        value = switchvalue;
                        LocalDataSaver.saveSyncSet(switchvalue);
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
