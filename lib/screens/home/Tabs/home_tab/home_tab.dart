import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/home/Tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:movies/screens/home/Tabs/home_tab/cubit/home_tab_states.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
import 'package:movies/screens/movie_details/movie_details.dart';
import 'package:movies/utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    context.read<HomeTabCubit>().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBackGround(context),

            BlocBuilder<HomeTabCubit, HomeTabStates>(
              builder: (context, state) {
                final moviesState = state.moviesState;

                if (moviesState is LoadingApiResult) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.yellow),
                  );
                } else if (moviesState is SuccessApiResult<List<MovieEntity>>) {
                  final movies = moviesState.data ?? [];

                  if (movies.isEmpty) {
                    return const Center(
                      child: Text(
                        "No movies available",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  // 🔹 Group movies by Genre
                  final Map<String, List<MovieEntity>> moviesByGenre = {};
                  for (var movie in movies) {
                    final genres = movie.genres ?? [];
                    for (var genre in genres) {
                      moviesByGenre.putIfAbsent(genre, () => []);
                      moviesByGenre[genre]!.add(movie);
                    }
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: moviesByGenre.entries.map((entry) {
                      final genreName = entry.key;
                      final genreMovies = entry.value;

                      if (genreMovies.isEmpty) return const SizedBox();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildGenreRow(genreName),
                          buildMoviesList(genreMovies),
                          const SizedBox(height: 16),
                        ],
                      );
                    }).toList(),
                  );
                } else if (moviesState is ErrorApiResult) {
                  final error = moviesState.getError;
                  return Center(
                    child: Text(
                      "Error: ${error.message}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Background Banner
  Widget buildBackGround(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.65,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/homeBg.png", fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.3)),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                  Colors.black,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Genre Row
  Widget buildGenreRow(String genreName) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            genreName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: AppColors.white,
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: navigate to genre details page
            },
            child: const Text(
              "See More",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.yellow,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Movies Horizontal List
  Widget buildMoviesList(List<MovieEntity> movies) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetails(movieId: movie.id),
                ),
              );
            },
            child: Container(
              width: 140,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Poster + Rating overlay
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          movie.mediumCoverImage ?? "",
                          fit: BoxFit.cover,
                          height: 180,
                          width: 140,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 180,
                              width: 140,
                              color: Colors.grey[800],
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.white,
                                size: 40,
                              ),
                            );
                          },
                        ),
                      ),
                      // ⭐ Rating Badge
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "${movie.rating.toStringAsFixed(1)} ⭐",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Title
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Year
                  Text(
                    "${movie.year}",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
