import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/screens/home/Tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:movies/screens/home/Tabs/home_tab/cubit/home_tab_states.dart';
import 'package:movies/core/api_result/api_result.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  String? selectedGenre;

  @override
  void initState() {
    super.initState();
    context.read<HomeTabCubit>().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Genres bar
            BlocBuilder<HomeTabCubit, HomeTabStates>(
              builder: (context, state) {
                if (state.moviesState is SuccessApiResult<List<MovieEntity>>) {
                  final movies =
                      (state.moviesState as SuccessApiResult<List<MovieEntity>>)
                          .data!;

                  final allGenres = movies
                      .expand((m) => m.genres ?? [])
                      .toSet()
                      .toList();

                  // 👇 نخلي أول Genre مختار تلقائيًا
                  if (selectedGenre == null && allGenres.isNotEmpty) {
                    selectedGenre = allGenres.first;
                  }

                  return Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: allGenres.length,
                      itemBuilder: (context, index) {
                        final genre = allGenres[index];
                        final isSelected = genre == selectedGenre;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: ChoiceChip(
                            showCheckmark: false, // 👈 نشيل علامة الصح
                            label: Text(
                              genre,
                              textAlign: TextAlign.center, // 👈 النص في النص
                              style: TextStyle(
                                color: isSelected
                                    ? AppColors.black
                                    : AppColors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: const BorderSide(
                                color: AppColors.yellow,
                                width: 3,
                              ),
                            ),
                            selected: isSelected,
                            selectedColor: AppColors.yellow,
                            backgroundColor: AppColors.black,
                            onSelected: (val) {
                              setState(() {
                                selectedGenre = genre;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            ),

            const SizedBox(height: 12),

            // 🔹 Movies Grid
            Expanded(
              child: BlocBuilder<HomeTabCubit, HomeTabStates>(
                builder: (context, state) {
                  if (state.moviesState is LoadingApiResult) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.yellow),
                    );
                  } else if (state.moviesState
                      is SuccessApiResult<List<MovieEntity>>) {
                    final movies =
                        (state.moviesState
                                as SuccessApiResult<List<MovieEntity>>)
                            .data!;

                    final filteredMovies = selectedGenre == null
                        ? movies
                        : movies
                              .where(
                                (m) =>
                                    m.genres != null &&
                                    m.genres!.contains(selectedGenre),
                              )
                              .toList();

                    if (filteredMovies.isEmpty) {
                      return const Center(
                        child: Text(
                          "No movies available",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 80),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.68,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = filteredMovies[index];
                        return buildMovieCard(movie);
                      },
                    );
                  } else if (state.moviesState is ErrorApiResult) {
                    final error =
                        (state.moviesState as ErrorApiResult).getError;
                    return Center(
                      child: Text(
                        "Error: ${error.message ?? 'Unknown error'}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Movie Card
  Widget buildMovieCard(MovieEntity movie) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            movie.mediumCoverImage ?? "",
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[900],
                child: const Icon(
                  Icons.broken_image,
                  color: Colors.white,
                  size: 40,
                ),
              );
            },
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          // ⭐ Rating
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    movie.rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
