import 'package:flutter/material.dart';
import '../cubit/sensor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/sensor_cubit.dart';

class MainDashboard extends StatelessWidget {
  final SensorState state;
  const MainDashboard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<SensorCubit>().fetchData(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMainCard(
              icon: Icons.thermostat,
              title: 'Temperature',
              value: '${state.temperature.toStringAsFixed(1)} °C',
              color: Colors.redAccent,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMiniCard(Icons.water_drop, 'Humidity', '${state.humidity} %'),
                _buildMiniCard(Icons.ac_unit, 'Dry Bulb', '${state.dryBulb} °C'),
              ],
            ),
            const SizedBox(height: 20),
            _buildDeviceCard(Icons.local_drink, 'Pump'),
            const SizedBox(height: 10),
            _buildDeviceCard(Icons.compress, 'Compressor'),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCard({required IconData icon, required String title, required String value, required Color color}) {
    return Card(
      color: color.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, color: color, size: 50),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniCard(IconData icon, String label, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, color: Colors.blue, size: 35),
              Text(label, style: const TextStyle(fontSize: 16)),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceCard(IconData icon, String label) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 40),
        title: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      ),
    );
  }
}