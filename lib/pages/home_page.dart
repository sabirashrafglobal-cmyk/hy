import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/sensor_cubit.dart';
import '../cubit/sensor_state.dart';
import 'main_dashboard.dart';
import 'reliability_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorCubit, SensorState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Locus Technology DAQ')),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
                ListTile(
                  leading: const Icon(Icons.bar_chart),
                  title: const Text('Reliability (1 Month)'),
                  onTap: () {
                    context.read<SensorCubit>().changePage("month");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.timeline),
                  title: const Text('Reliability (1 Year)'),
                  onTap: () {
                    context.read<SensorCubit>().changePage("year");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: state.selectedPage == "main"
              ? MainDashboard(state: state)
              : ReliabilityPage(page: state.selectedPage),
        );
      },
    );
  }
}