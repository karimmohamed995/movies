import 'package:flutter/material.dart';
import 'package:movies/screens/home/Tabs/explore_tab/explore_tab.dart';
import 'package:movies/screens/home/Tabs/home_tab/home_tab.dart';
import 'package:movies/screens/home/Tabs/profile_tab/profile_tab.dart';
import 'package:movies/screens/home/Tabs/seach_tab/search_tab.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const ExploreTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[currentIndex],
      backgroundColor: AppColors.black,
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.darkGrey, // اللون يفضل هنا مش جوه الـ bar
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent, // خلي الخلفية شفافة
              elevation: 0, // نشيل أي ظل داخلي من الـ bar نفسه
              selectedItemColor: AppColors.yellow,

              unselectedItemColor: Colors.white,
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(AppAssets.homeIcon, width: 24, height: 24),

                  label: "Home",
                  activeIcon: Image.asset(
                    AppAssets.homeY,
                    width: 24,
                    height: 24,
                    // color: AppColors.yellow, // 👈 اللون عند الـ selected
                  ),
                ),

                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppAssets.searchIcon,
                    width: 24,
                    height: 24,
                  ),

                  label: "Search",
                  activeIcon: Image.asset(
                    AppAssets.searchY,
                    width: 24,
                    height: 24,
                    // color: AppColors.yellow, // 👈 اللون عند الـ selected
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppAssets.exploreIcon,
                    width: 24,
                    height: 24,
                  ),

                  label: "Explore",
                  activeIcon: Image.asset(
                    AppAssets.exploreY,
                    width: 24,
                    height: 24,
                    // color: AppColors.yellow, // 👈 اللون عند الـ selected
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppAssets.profileIcon,
                    width: 24,
                    height: 24,
                  ),

                  label: "profile",
                  activeIcon: Image.asset(
                    AppAssets.profileY,
                    width: 24,
                    height: 24,
                    // color: AppColors.yellow, // 👈 اللون عند الـ selected
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
