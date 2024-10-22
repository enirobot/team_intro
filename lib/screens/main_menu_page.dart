import 'package:flutter/material.dart';
import 'package:team_intro/constants.dart';
import 'package:team_intro/models/page_info.dart';
import 'package:team_intro/widgets/menu_button.dart';

class MainMenuPage extends StatelessWidget {
  final List<PageInfo> pages;
  final Function(int) onPageSelected;

  const MainMenuPage({
    super.key,
    required this.pages,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < pages.length; i++) ...[
            if (i > 0) const SizedBox(height: AppConstants.spaceBetweenButtons),
            MenuButton(
              text: pages[i].title,
              onPressed: () => onPageSelected(i + 1),
            ),
          ],
        ],
      ),
    );
  }
}