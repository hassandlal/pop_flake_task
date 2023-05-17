import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/models/moviesdetails.dart';
import 'package:pop_flaktask/modules/Details_Screen/cubit/cubit.dart';
import 'package:pop_flaktask/modules/Details_Screen/cubit/states.dart';

class DetailsScreen extends StatefulWidget {
  final String poster;
  final String name;

  final String about;

  const DetailsScreen({
    Key? key,
    required this.poster,
    required this.name,
    required this.about,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<MovieDetailsCubit, MoviesDetailsStates>(
      builder: (context, state) {
        MoviesDetails? movie = MovieDetailsCubit.get(context).moviesdetails;
        return Scaffold(
          extendBody: true,
          body: (state is MoviesDetailsLoadingState)
              ? const Center(child: CircularProgressIndicator())
              : ((state is MoviesDetailsSuccessState)
                  ? SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              children: [
                SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: screenWidth,
                            height: screenHeight * 0.2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(widget.poster),
                                fit: BoxFit.fill,
                              ),
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Name: ${widget.name}",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'About : ${movie?.videoDescription.toString()}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          )
                  : const Center(
            child: Text('oops some thing went wrong'),
          )),
        );
      },
      listener: (context, state) {},
    );
  }
}
