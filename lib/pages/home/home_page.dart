import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_challenge_drcash/pages/home/bloc/home_bloc.dart';
import 'package:mobile_challenge_drcash/pages/home/bloc/home_event.dart';
import 'package:mobile_challenge_drcash/pages/home/bloc/home_state.dart';
import 'package:mobile_challenge_drcash/widgets/bottom_loader_list.dart';
import 'package:mobile_challenge_drcash/widgets/card_list_clinics.dart';
import 'package:mobile_challenge_drcash/widgets/shimmer_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Color getColor(Set<MaterialState> states) {
    return const Color.fromARGB(255, 20, 105, 83);
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06D6A0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 105, 83),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => {Navigator.pushReplacementNamed(context, '/login')},
          child: const Icon(
            Icons.power_settings_new,
            color: Colors.white,
            size: 25,
          ),
        ),
        title: Text(
          "Olá, Lucas",
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(listener: ((context, state) {
        switch (state.runtimeType) {
          case LoadingState:
          case HomeState:
            scrollController.addListener(() {
              if (scrollController.position.extentAfter == 0) {
                context.read<HomeBloc>().add(LoadMoreClinicsEvent());
              }
            });
            break;

          default:
        }
      }), builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingState:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  ShimmerCard(),
                  const SizedBox(
                    height: 10,
                  ),
                  ShimmerCard(),
                  const SizedBox(
                    height: 10,
                  ),
                  ShimmerCard(),
                ],
              ),
            );
          case HomeState:
          case LoadingNewClinicsState:
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: NotificationListener<ScrollNotification>(
                  child: Stack(
                    children: [
                      ListView.separated(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: state.listClinics!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardListClinics(
                            clinic: state.listClinics![index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      ),
                      state.runtimeType == LoadingNewClinicsState
                          ? BottomLoaderList()
                          : Container()
                    ],
                  ),
                ));
          default:
            return Container();
        }
      }),
    );
  }
}
