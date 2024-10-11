import 'package:flutter/material.dart';
import 'package:projectgetx/utils/constants/Theme.dart';

class TableCellSettings extends StatelessWidget {
  String title = "";
  Function onTap;
  TableCellSettings({super.key, required this.title, this.onTap = _doNothing});

  static void _doNothing() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap(),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: NowUIColors.text)),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_forward_ios,
                  color: NowUIColors.text, size: 14),
            )
          ],
        ),
      ),
    );
  }
}
