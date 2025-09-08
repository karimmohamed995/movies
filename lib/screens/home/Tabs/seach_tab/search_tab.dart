import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_assets.dart'; // خلي هنا الصور بتاعتك

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController _controller = TextEditingController();
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: SafeArea(
        child: Column(
          children: [
            // 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    query = value.trim();
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search movies...",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: AppColors.darkGrey,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      AppAssets.searchIcon, // 👈 صورتك بدل أيقونة السيرش
                      width: 24,
                      height: 24,
                      color: AppColors.white, // لو عايز تلونها
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // 🔹 Body
            Expanded(
              child: query.isEmpty
                  ? Center(
                      child: Image.asset(
                        AppAssets.emptyScreen, // 👈 حط صورتك هنا
                        width: 180,
                        height: 180,
                      ),
                    )
                  : Center(
                      child: Text(
                        "Searching for \"$query\" ...",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
