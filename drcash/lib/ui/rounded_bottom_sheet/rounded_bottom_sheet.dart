import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';

class RoundedBottomSheet extends StatefulWidget {
  final double height;
  final Widget content;

  const RoundedBottomSheet({
    Key? key,
    required this.height,
    required this.content,
  }) : super(key: key);

  @override
  State<RoundedBottomSheet> createState() => _RoundedBottomSheetState();
}

class _RoundedBottomSheetState extends State<RoundedBottomSheet> {
  Radius borderRadius = const Radius.circular(40.0);
  double imageHeight = 150.0;
  @override
  BottomSheet build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: borderRadius),
      ),
      builder: (BuildContext _) {
        return SizedBox(
          height: widget.height,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              gradient: AppTheme.PRIMARY_COLOR_GRADIENT,
              borderRadius: BorderRadius.vertical(top: borderRadius),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: borderRadius),
                  child: Image.asset(
                    'assets/clinic.jpg',
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: widget.height - imageHeight,
                  width: double.infinity,
                  child: widget.content,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
