import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping/core/cubit/cubit.dart';
import 'package:shipping/features/shipping/presentation/pages/home/drawer_widget.dart';

void main() {
  runApp(const ArchivingApp());
}

class ArchivingApp extends StatelessWidget {
  const ArchivingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArchivingCubit(),
      child: MaterialApp(
        title: 'Shipping Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Readex Pro',
        ),
        home: const CustomeRequest(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
