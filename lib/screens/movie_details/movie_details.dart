import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/screens/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies/screens/movie_details/cubit/movie_details_states.dart';
import 'package:movies/screens/movie_details/cubit/similar_movies_cubit.dart';
import 'package:movies/screens/movie_details/cubit/similar_movies_states.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/di/di.dart';

class MovieDetails extends StatelessWidget {
  final int movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<MovieDetailsCubit>()..getMovieDetails(movieId),
        ),
        BlocProvider(
          create: (_) =>
              getIt<SimilarMoviesCubit>()..getMovieSuggestions(movieId),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Movie Details Header + Stats
              BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
                builder: (context, state) {
                  final movieState = state.movieDetailsState;

                  if (movieState is LoadingApiResult) {
                    return SizedBox(
                      height: screenHeight * 0.65,
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.red),
                      ),
                    );
                  } else if (movieState is SuccessApiResult<MovieEntity>) {
                    final movie = movieState.getData;
                    return buildHeader(context, screenHeight, movie);
                  } else if (movieState is ErrorApiResult) {
                    return SizedBox(
                      height: screenHeight * 0.65,
                      child: Center(
                        child: Text(
                          movieState.getError.message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),

              // 🔹 Screenshots Section
              const SizedBox(height: 10),
              buildSectionTitle("Screenshots"),
              const SizedBox(height: 12),
              BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
                builder: (context, state) {
                  final movieState = state.movieDetailsState;

                  if (movieState is SuccessApiResult<MovieEntity>) {
                    final movie = movieState.getData;
                    return buildScreenShots(movie);
                  }

                  return const SizedBox.shrink();
                },
              ),

              // 🔹 Similar Movies Section
              const SizedBox(height: 20),
              buildSectionTitle("Similar Movies"),
              const SizedBox(height: 12),
              BlocBuilder<SimilarMoviesCubit, SimilarMoviesStates>(
                builder: (context, state) {
                  final moviesState = state.similarMoviesState;

                  if (moviesState is LoadingApiResult) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  } else if (moviesState is SuccessApiResult) {
                    final movies = moviesState.getData;

                    if (movies.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "No similar movies",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      );
                    }

                    return SizedBox(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemCount: movies.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final m = movies[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              m.mediumCoverImage ?? "",
                              width: 140,
                              height: 200,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                width: 140,
                                height: 200,
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (moviesState is ErrorApiResult) {
                    return Center(
                      child: Text(
                        moviesState.getError.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),

              // 🔹 Summary Section
              const SizedBox(height: 20),
              buildSectionTitle("Summary"),
              const SizedBox(height: 12),
              BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
                builder: (context, state) {
                  final movieState = state.movieDetailsState;

                  if (movieState is SuccessApiResult<MovieEntity>) {
                    final movie = movieState.getData;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          (movie.summary?.isNotEmpty ?? false)
                              ? movie.summary!
                              : "No summary available",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // 🎬 Header
  Widget buildHeader(
    BuildContext context,
    double screenHeight,
    MovieEntity movie,
  ) {
    return Stack(
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
        // Gradient
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
        // Back button
        SafeArea(
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        // Title + Stats
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
                style: const TextStyle(color: Colors.white70, fontSize: 18),
              ),
              const SizedBox(height: 16),
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
                  onPressed: () {},
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
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildScreenShots(MovieEntity movie) {
    final screenshots = movie.screenshots ?? [];

    if (screenshots.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          "No screenshots available",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      );
    }

    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: screenshots.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final url = screenshots[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              url,
              width: 250,
              height: 160,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 250,
                height: 160,
                color: Colors.grey[800],
                child: const Icon(Icons.broken_image, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildStatItem(IconData icon, String value, Color color) {
    return Container(
      width: 110,
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
