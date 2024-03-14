import 'package:flutter/material.dart';
import 'package:shopping_app/util/constance/colors.dart';
import 'package:shopping_app/util/constance/text_style.dart';

import '../widget/comman/show_dialog.dart';

class ScreenDrawer extends StatelessWidget {
  const ScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.extraLightGrey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 140,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text('Anshif', style: AppText.mediumdark),
                      const Text(
                        'anshif@gmail.com',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFFB5B5B5),
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('App info'),
          ),
          const ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy & policy'),
          ),
          const ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('Help'),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const LogoutDialog();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
