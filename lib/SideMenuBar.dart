import 'package:flutter/material.dart';
import 'package:keep_notes/ArchiveView.dart';
import 'package:keep_notes/Settings.dart';
import 'package:keep_notes/colors.dart';

import 'home.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: white,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: const Text(
                  "Google Notes",
                  style: TextStyle(
                    color: bgColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Divider(
                color: bgColor.withOpacity(0.6),
              ),
              sectionOne(),
              const SizedBox(
                height: 5,
              ),
              sectionTwo(),
              const SizedBox(
                height: 5,
              ),
              sectionSettings(),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionOne() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            bgColor.withOpacity(0.2),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            )),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Row(
            children: const [
              Icon(
                Icons.lightbulb_outline,
                color: bgColor,
                size: 25,
              ),
              SizedBox(
                width: 27,
              ),
              Text(
                "Notes",
                style: TextStyle(
                  color: bgColor,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTwo() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            )),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArchiveView(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Row(
            children: const [
              Icon(
                Icons.archive_outlined,
                color: bgColor,
                size: 25,
              ),
              SizedBox(
                width: 27,
              ),
              Text(
                "Archive",
                style: TextStyle(
                  color: bgColor,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionSettings() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            )),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Setting(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Row(
            children: const [
              Icon(
                Icons.settings_outlined,
                color: bgColor,
                size: 25,
              ),
              SizedBox(
                width: 27,
              ),
              Text(
                "Settings",
                style: TextStyle(
                  color: bgColor,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
