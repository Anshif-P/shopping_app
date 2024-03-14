import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/util/constance/colors.dart';
import 'package:shopping_app/util/constance/text_style.dart';

import '../widget/show_dialog.dart';

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
                      Text(
                        'anshif@gmail.com',
                        style: const TextStyle(
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
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('App info'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy & policy'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text('Help'),
            onTap: () {},
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
          ), // ... Other list tiles ...
        ],
      ),
    );
  }
}
