import 'package:drcash/blocs/auth/auth_cubit.dart';
import 'package:drcash/blocs/clinics/clinics_cubit.dart';
import 'package:drcash/core/routes.dart';
import 'package:drcash/models/clinic_model.dart';
import 'package:drcash/pages/details_page.dart';
import 'package:drcash/ui/clinic_card/clinic_card.dart';
import 'package:drcash/ui/clinic_loading/clinic_loading.dart';
import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  bool showBottomSheetDetails = false;
  bool infiniteLoading = false;
  bool cardsExpanded = true;

  @override
  void initState() {
    super.initState();
    context.read<ClinicsCubit>().loadList();
    _buildScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      backgroundColor: AppTheme.GREY_COLOR_LIGHT,
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 4,
        ),
        child: Stack(
          children: [
            _handleClinicList(),
            _handleLoading(),
          ],
        ),
      ),
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/logo.png',
        width: 120,
      ),
      flexibleSpace: Container(
        decoration:
            const BoxDecoration(gradient: AppTheme.PRIMARY_COLOR_GRADIENT),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.aspect_ratio),
          onPressed: () {
            setState(() {
              cardsExpanded = !cardsExpanded;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: _logout,
        )
      ],
    );
  }

  Widget _handleClinicList() {
    return BlocConsumer<ClinicsCubit, ClinicsState>(
      listener: (context, state) {
        setState(() => {
              infiniteLoading = state.loading == true && state.response != null
            });
      },
      builder: (context, state) {
        if (state.loading == true && state.response == null) {
          return const Center(
            child: ClinicLoading(),
          );
        }

        List<Clinic> clinics = state.response!.data!;
        return ListView.builder(
          controller: scrollController,
          itemCount: clinics.length,
          itemBuilder: (_, int index) {
            return ClinicCard(
              clinic: clinics[index],
              expanded: cardsExpanded,
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (_) {
                    return DetailsPage(clinic: clinics[index]);
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _handleLoading() {
    return AnimatedAlign(
      alignment: Alignment(0, infiniteLoading ? 1 : 4),
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
      child: const ClinicLoading(),
    );
  }

  _logout() {
    context.read<AuthCubit>().logout();
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  _buildScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        ClinicResponse? response = context.read<ClinicsCubit>().state.response;
        if (response != null &&
            response.totalElements! > response.data!.length) {
          final page = response.pageNumber! + 1;
          context.read<ClinicsCubit>().loadList(page: page);
        }
      }
    });
  }
}
