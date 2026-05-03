import 'package:bookly/controllers/top_nav_controller.dart';
import 'package:bookly/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';

class TopNavWidget extends StatelessWidget implements ObstructingPreferredSizeWidget, PreferredSizeWidget {
  final String pageTitle;
  //function to call without args that doesnt return anything
  final TopNavController menuController;

  const TopNavWidget({
    super.key,
    required this.pageTitle,
    required this.menuController
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(pageTitle),
      leading: CupertinoButton(
        onPressed: menuController.toggle,
        child: const Icon(
          CupertinoIcons.bars,
          color: ThemeColors.magenta
        ),
      ),
      trailing: CupertinoButton(
        onPressed: () {print("profile pressed");},
        child: const Icon(
          CupertinoIcons.settings,
          color: ThemeColors.magenta,
        ),
      ),
    );
  }

  //need to set the preferred size for how tall the nav bar should be since when importing it cant read the details of class to know it extends the cupertino nav bar
  @override
  Size get preferredSize => const CupertinoNavigationBar().preferredSize;
  //tell the classes importing it to not put content under the nav bar
  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}