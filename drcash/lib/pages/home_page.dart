import 'package:drcash/core/routes.dart';
import 'package:drcash/ui/rounded_bottom_sheet/rounded_bottom_sheet.dart';
import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  bool showBottomSheetDetails = false;

  final List<Shadow> shadows = [
    const Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 10.0,
      color: Colors.black45,
    ),
  ];

  @override
  void initState() {
    super.initState();
    buildScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      backgroundColor: AppTheme.GREY_COLOR_LIGHT,
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 4,
        ),
        child: ListView.builder(
          controller: scrollController,
          itemCount: 10,
          itemBuilder: (_, int index) {
            return _getCard();
          },
        ),
      ),
    );
  }

  AppBar _getAppBar() {
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
          icon: const Icon(Icons.exit_to_app),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, Routes.login),
        )
      ],
    );
  }

  Card _getCard() {
    BorderRadius borderRadius = BorderRadius.circular(8);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return _getBottomSheet();
            },
          );
        },
        // onTap: () => Navigator.pushNamed(context, Routes.details),
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Clinica treinamento 03',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.PRIMARY_COLOR_DARK,
                ),
              ),
              const Text(
                'Estética geral',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.PRIMARY_COLOR_DARK,
                ),
              ),
              const Divider(color: AppTheme.START_COLOR),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Brasília - DF',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.START_COLOR,
                    ),
                  ),
                  _getStatus(status: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getStatus({required bool status, Color? color}) {
    Color statusColor = status ? AppTheme.START_COLOR : Colors.redAccent;
    String statusText = status ? 'Ativo' : 'Inativo';
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 12,
          color: statusColor,
        ),
        Text(
          statusText,
          style: TextStyle(
            fontSize: 12,
            color: color ?? statusColor,
          ),
        ),
      ],
    );
  }

  RoundedBottomSheet _getBottomSheet() {
    return RoundedBottomSheet(
      height: 360,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Clinica treinamento 03',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: shadows,
                  ),
                ),
                _getStatus(status: false, color: Colors.white),
              ],
            ),
            const Text(
              'Estética geral',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(
                  Icons.pin_drop,
                  size: 14,
                  color: Colors.white,
                ),
                Text(
                  'Brasília - DF',
                  style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('');
                },
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.PRIMARY_COLOR_DARK,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone),
                    SizedBox(width: 4),
                    Text('Entrar em contato'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        print('CHEGOU NO FINAL');
      }
    });
  }
}
