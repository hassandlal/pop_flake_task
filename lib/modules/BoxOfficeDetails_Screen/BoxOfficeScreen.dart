import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Details_Screen/cubit/cubit.dart';
import 'package:pop_flaktask/modules/Details_Screen/cubit/states.dart';
import 'package:pop_flaktask/modules/WebView/WebView.dart';

import '../../shared/component/components.dart';


class TopRatedBoxOfficeScreen extends StatelessWidget {
  final String poster;
  final String name;
  final String rank;
  final String weeks;

  const TopRatedBoxOfficeScreen({
    Key? key,
    required this.poster,
    required this.name,
    required this.rank,
    required this.weeks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(


      extendBody: true,
      body: SizedBox(
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
                        height: screenHeight*0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(poster),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Name: " + name,
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

                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Rank : ' + rank,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Weeks : ' + weeks,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 17,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    BlocConsumer<MovieDetailsCubit, MoviesDetailsStates>(builder: (context,state){

                      return Center(
                        child: ElevatedButton(
                            onPressed: () => navigateTo(
                                context,
                                WebViewPage(
                                  urlsent: MovieDetailsCubit.get(context).moviesdetails?.link.toString(),
                                )),
                            child: const Text('see trial video')),
                      );
                    }, listener: (context,state){})
                  ],
                ))
          ],
        ),
      ),
    );
  }
}