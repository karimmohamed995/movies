import 'package:flutter/material.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
import 'package:movies/utils/app_colors.dart';

class MovieDetails extends StatelessWidget {
  final MovieEntity movie;
  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 الجزء العلوي (الصورة + الجريدينت + العنوان + الزرار)
            Stack(
              children: [
                SizedBox(
                  height: screenHeight * 0.65,
                  width: double.infinity,
                  child: Image.network(
                    movie.mediumCoverImage ?? "",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: screenHeight * 0.65,
                      width: double.infinity,
                      color: Colors.grey[900],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),

                // Gradient Overlay
                Container(
                  height: screenHeight * 0.65,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.7),
                        Colors.black,
                      ],
                    ),
                  ),
                ),

                // زر رجوع
                SafeArea(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                // عنوان + سنة + زرار + إحصائيات
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Text(
                        movie.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${movie.year}",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // زرار WATCH
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // TODO: Action
                          },
                          child: const Text(
                            "Watch",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // 🔹 Runtime + Rating + Love
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildStatItem(Icons.favorite, "15", AppColors.yellow),
                          buildStatItem(
                            Icons.access_time,
                            "${movie.runtime ?? 90}",
                            AppColors.yellow,
                          ),
                          buildStatItem(
                            Icons.star,
                            movie.rating.toStringAsFixed(1),
                            AppColors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // 🔹 هنا تقدر تبدأ أي Sections جديدة
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Screenshot",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 200), // Placeholder space
          ],
        ),
      ),
    );
  }

  Widget buildStatItem(IconData icon, String value, Color color) {
    return Container(
      width: 110, // 👈 زودت العرض شوية
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
