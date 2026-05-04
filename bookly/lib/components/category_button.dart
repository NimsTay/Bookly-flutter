import 'package:bookly/controllers/category_controller.dart';
import 'package:bookly/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';

class CategoryButtonComponent extends StatefulWidget {
  final String buttonLabel;
  final CategoryController categoryController;

  const CategoryButtonComponent({
    super.key,
    required this.buttonLabel,
    required this.categoryController
  });

  @override
  State<CategoryButtonComponent> createState() => _CategoryButtonComponentState();
}

class _CategoryButtonComponentState extends State<CategoryButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      color: CupertinoColors.systemGrey6,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, //only take up however much needed to avoid taking up more than grid
          children: [
            Icon(widget.categoryController.categoryIconMap[widget.buttonLabel], size: 30),
            Text(widget.buttonLabel, style: TextStyle(color: ThemeColors.purple))
          ]
        )
      ),
      onPressed: () {print("cat pressed");},
    );
  }
}