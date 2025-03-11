import 'package:amrtmm_project/app/review/review_screen.dart';
import 'package:amrtmm_project/core/config/routes/routes_constants.dart';
import 'package:amrtmm_project/core/utils/functions/app_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../services/databases/local_db.dart';

class ProfileDrawer extends StatefulWidget {
  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
  const ProfileDrawer({
    Key? key,
  }) : super(key: key);
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) {
    return Container(
      color: const Color(0xd80084c2),
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(55, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /* IconButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
                  },
                  icon: const Icon(Icons.close, size: 18, color: Colors.white),
                ), */
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo2.png',
                        height: 85,
                        width: 110,
                      ),
                      const Text('Version 1.0',
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                    ],
                  ),
                ),
                buildMenuTextRow('Edit Profile', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.editProifleScreen);
                }),
                const Divider(),
                buildMenuTextRow('Dashboard', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.dashboardScreen);
                }),
                /*   const Divider(),
                buildMenuTextRow('Create a Service', Icons.arrow_forward_ios,
                    () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateService()));
                }), */
                const Divider(),
                buildMenuTextRow('Manage Tasks', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.manageTasks);
                }),
                const Divider(),
                buildMenuTextRow('Packages', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.packageScreen);
                }),
                const Divider(),
                buildMenuTextRow('Reviews', Icons.arrow_forward_ios, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReviewScreen()));
                }),
                const Divider(),
                buildMenuTextRow('Bank Details', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.bankDetailScreen);
                }),
                const Divider(),
                buildMenuTextRow('My Wallet', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.walletScreen);
                }),
                const Divider(),
                buildMenuTextRow('Logout', Icons.arrow_forward_ios, () async {
                  final isLoggedOut = await LocalDB.logoutUser();
                  if (isLoggedOut && context.mounted) {
                    context
                        .pushReplacementNamed(RoutesNameConstants.loginScreen);
                    return;
                  }
                  showToast(
                      msg: "Cannot logout right now, please try again later");
                  return;
                }),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(90, 0, 10, 20),
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildSocialIcon('assets/images/fb.png', 20, 30, () {}),
                  buildSocialIcon('assets/images/insta.png', 20, 35, () {}),
                  buildSocialIcon('assets/images/linkedin.png', 20, 30, () {}),
                  buildSocialIcon('assets/images/twitter.png', 20, 30, () {}),
                ],
              ),
            ),
          ),
          /*  const SizedBox(
            height: 10,
          ), */
        ],
      ),
    );
  }

  Widget buildSocialIcon(
      String imagePath, double height, double width, VoidCallback onTap) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath, height: height, width: width),
        ),
      ),
    );
  }

  Widget buildMenuTextRow(String text, IconData icon, VoidCallback onTap) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(icon, color: Colors.white, size: 14),
        ],
      ),
      onTap: onTap,
    );
  }
}
