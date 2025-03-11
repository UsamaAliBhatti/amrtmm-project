import 'package:amrtmm_project/core/config/routes/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
  const MainDrawer({
    Key? key,
  }) : super(key: key);
}

class _MainDrawerState extends State<MainDrawer> {
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
            padding: const EdgeInsets.fromLTRB(55, 30, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close, size: 18, color: Colors.white),
                ),
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
                buildMenuTextRow('About Us', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.commonScreen,
                      extra: {"screenNum": 1, "title": "About Us"});
                }),
                const Divider(),
                buildMenuTextRow('Contact Us', Icons.arrow_forward_ios, () {
                  context.pushNamed(
                    RoutesNameConstants.contactUsScreen,
                  );
                }),
                const Divider(),
                buildMenuTextRow('Terms of Use', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.commonScreen, extra: {
                    "screenNum": 2,
                    "title": "Terms of Use",
                  });
                }),
                const Divider(),
                buildMenuTextRow('DMCA Policy', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.commonScreen, extra: {
                    "screenNum": 3,
                    "title": "DMCA Policy",
                  });
                }),
                const Divider(),
                buildMenuTextRow(
                    'Terms and Conditions', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.commonScreen, extra: {
                    "screenNum": 4,
                    "title": "Terms and Conditions",
                  });
                }),
                const Divider(),
                buildMenuTextRow('Privacy Policy', Icons.arrow_forward_ios, () {
                  context.pushNamed(RoutesNameConstants.commonScreen,
                      extra: {"screenNum": 5, "title": "Privacy Policy"});
                }),
                const Divider(),
                buildMenuTextRow('FAQ\'s', Icons.arrow_forward_ios, () {}),
                const Divider(),
                buildMenuTextRow('Logout', Icons.arrow_forward_ios, () {}),
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
          const SizedBox(
            height: 10,
          ),
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
