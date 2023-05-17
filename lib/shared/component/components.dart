import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Details_Screen/cubit/cubit.dart';
import 'package:pop_flaktask/modules/Details_Screen/cubit/states.dart';

import '../../modules/BoxOfficeDetails_Screen/BoxOfficeScreen.dart';
import '../../modules/Details_Screen/DetailsScreen.dart';
import '../../modules/SearchDetails_Screen/SearchDetailsScreen.dart';

String token = '';

Widget BuildListView(model, context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.3,
    child: ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BlocConsumer<MovieDetailsCubit,MoviesDetailsStates>(
          builder: (BuildContext context, state) {
            return InkWell(
              onTap: () {
                MovieDetailsCubit.get(context).getMovieDetailsData(model.items[index].id!);
                print(model.items[index].id!);
                navigateTo(
                    context,
                    DetailsScreen(
                        poster: model.items[index].image!,
                        name: model.items[index].title!,
                        about: model.items[index].fullTitle!));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: FadeInImage(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.2,
                        placeholder:
                            const AssetImage('assets/images/blank.png'),
                        image: NetworkImage(
                          model.items[index].image!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      model.items[index].title!,
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, Object? state) {},
        );
      },
      itemCount: model.items.length,
      scrollDirection: Axis.horizontal,
    ),
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget buildListMovie(model, context) {
  return InkWell(
    onTap: () {
      navigateTo(
          context,
          SearchDetailsScreen(
            about: model.description,
            name: model.title,
            poster: model.image,
          ));
    },
    child: Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: FadeInImage(
                placeholder: const AssetImage('assets/images/blank.png'),
                image: NetworkImage(
                  model.image!,
                )),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name: " + model.title,
                  ),
                  Text(
                    'Description : ' + model.description,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildTopRatedListMovie(model, context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        navigateTo(
            context,
            TopRatedBoxOfficeScreen(
              name: model.title,
              poster: model.image,
              rank: model.rank,
              weeks: model.weeks,
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: FadeInImage(
                  placeholder: const AssetImage('assets/images/blank.png'),
                  image: NetworkImage(
                    model.image!,
                  )),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name: " + model.title,
                    ),
                    Text(
                      'Weeks : ' + model.weeks,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'rank : ' + model.rank,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'gross : ' + model.gross,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
