import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/sensor_cubit.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const LocusApp());
}

class LocusApp extends StatelessWidget {
  const LocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SensorCubit()..fetchData(),
      child: MaterialApp(
        title: 'Locus Technology DAQ',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}