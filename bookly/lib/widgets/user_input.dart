import 'package:bookly/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';

class UserInput extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String placeholder;
  final IconData icon;

  const UserInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.placeholder,
    required this.icon
  });

  @override
  State<UserInput> createState() => _UserInputState();
}


class _UserInputState extends State<UserInput> {
  @override
  void initState() {
    super.initState();

    widget.focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: CupertinoTextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        placeholder: widget.placeholder,
        prefix: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(widget.icon),
        ),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: widget.focusNode.hasFocus
                ? ThemeColors.purple
                : ThemeColors.teal,
          ),
        ),
      ),
    );
  }
}