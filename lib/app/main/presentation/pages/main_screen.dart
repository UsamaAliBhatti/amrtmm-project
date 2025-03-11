import 'package:amrtmm_project/app/main/presentation/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/res/components/main_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          endDrawer: const MainDrawer(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 36,
                  width: 65,
                ),
                /*   SizedBox(width: width * 0.52),
                SizedBox(
                  child: Image.asset(
                    'assets/images/UAE.png',
                    height: 20,
                    width: 27,
                  ),
                ), */
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            backgroundColor: const Color(0xffFFFFFF),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 28,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.tasks),
                label: 'My Services',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outlined,
                  color: Color(0xffFF0000),
                  size: 28,
                ),
                label: 'Create New',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_active_outlined,
                  size: 28,
                ),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                  size: 28,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: navigationShell.currentIndex,
            selectedItemColor: navigationShell.currentIndex == 2
                ? const Color(0xffFF0000)
                : const Color(0xff0084C2),
            unselectedItemColor: const Color(0xffB5BAC0),
            onTap: (index) {
              if (navigationShell.currentIndex != index) {
                context
                    .read<MainBloc>()
                    .add(TabChangedEvent(newTabIndex: index));
                navigationShell.goBranch(index);
              }
            },
            selectedLabelStyle: const TextStyle(color: Color(0xff0084C2)),
            unselectedLabelStyle: const TextStyle(color: Color(0xffB5BAC0)),
          ),
          body: navigationShell,
        );
      },
    );
  }
}
