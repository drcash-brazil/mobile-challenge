import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_challenge_drcash/pages/home/bloc/home_bloc.dart';
import 'package:mobile_challenge_drcash/pages/home/bloc/home_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Color getColor(Set<MaterialState> states) {
    return const Color.fromARGB(255, 20, 105, 83);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06D6A0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 105, 83),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 22,
          ),
        ),
        title: Text(
          "Hello, Lucas",
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<HomeBloc, HomeState>(
            listener: ((context, state) {}),
            builder: (context, state) {
              switch (state.runtimeType) {
                case HomeState:
                default:
                  return Container();
              }
            }),
      ),
    );
  }
}
