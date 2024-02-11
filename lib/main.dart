import 'package:flutter/material.dart';
// import 'package:traveling_app/screens/catgoris_screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './app_data.dart';
import './screens/filters_screen.dart';
import './screens/taps_screen.dart';
import 'screens/category_trips_screen.dart';
import 'screens/trip_detail_screen.dart';
import './models/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> _availableTrips = Trips_data;
  final List<Trip> _favoriteTrips = [];
  void _changefliters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['famiiy'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _managerfavorite(String tripId) {
    final existingindex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingindex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingindex);
      });
    } else {
      () {
        setState(() {
          _favoriteTrips
              .add(Trips_data.firstWhere((trip) => trip.id == tripId));
        });
      };
    }
  }

  bool _isFovarite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'AE'), // English
          // Locale('es'), // Spanish
        ],
        title: 'Travel App',

        // checkerboardOffscreenLayers: true,
        theme: theme(),
        initialRoute: '/',
        routes: {
          '/': (cxt) => TabsScreen(_favoriteTrips),
          CategoryTripsScreen.screenRoute: (ctx) =>
              CategoryTripsScreen(_availableTrips),
          TripDetailScreen.screenRoute: (ctx) =>
              TripDetailScreen(_managerfavorite, _isFovarite),
          FilterScreen.screenRoute: (ctx) =>
              FilterScreen(_filters, _changefliters)
        });
  }

  ThemeData theme() {
    return ThemeData(
      listTileTheme: const ListTileThemeData(iconColor: Colors.green),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
      primaryColor: Colors.blue,
      useMaterial3: false,
      // accentColor: Colors.amber,.deepPurple,
      primarySwatch: Colors.blue,
      hintColor: Colors.amber,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        brightness: Brightness.light,
      ),
      fontFamily: "assets/fonts/ElMessiri-Regular.ttf",
      textTheme: ThemeData.light().textTheme.copyWith(
          headlineSmall: const TextStyle(
            color: Colors.blue,
            fontSize: 25,
            fontFamily: "assets/fonts/ElMessiri-Regular.ttf",
            fontWeight: FontWeight.bold,
          ),
          titleLarge: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: "assets/fonts/ElMessiri-Regular.ttf",
            fontWeight: FontWeight.bold,
          )),
    );
  }
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
    ),
    body: Container(
      child: const ListTile(trailing: Icon(Icons.abc_outlined)),
    ),
  );
}
