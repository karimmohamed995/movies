import 'package:flutter/material.dart';
import 'package:movies/utils/app_assets.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // الجزء العلوي
            Container(
              color: const Color(0xFF1E1E1E),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // صورة + اسم تحتها
                      Column(
                        children: const [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("assets/profile.png"),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "John Safwat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const Spacer(), // يخلي النصوص في السنتر
                      // Wish List & History في النص جنب الصورة
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "12",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Wish List",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 40),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "History",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(), // علشان يوازن المسافة مع الشمال
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Edit و Exit
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Exit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Tabs
                  TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.amber,
                    labelColor: Colors.amber,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(icon: Icon(Icons.list), text: "Watch List"),
                      Tab(icon: Icon(Icons.folder), text: "History"),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    color: Colors.black,
                    child: Center(
                      child: Image.asset(AppAssets.emptyScreen, height: 120),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Center(
                      child: Image.asset(AppAssets.emptyScreen, height: 120),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
