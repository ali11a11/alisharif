import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../models/trip.dart';

class FavoritesScreen extends StatelessWidget {
  // const FavoritesScreen({super.key});

  final List<Trip> favoriteTrips;

  FavoritesScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(
        child: Text('لايوجد اي  رحلة مظلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season, removeItem: null,
            // removeItem: _removeTrip,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
