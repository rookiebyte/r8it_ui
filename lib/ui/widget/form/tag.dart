import 'package:flutter/material.dart';

class TagCheckboxWidget extends StatefulWidget {
  final String name;
  final bool selected;

  const TagCheckboxWidget(
    this.name, {
    super.key,
    this.selected = false,
  });

  @override
  State<TagCheckboxWidget> createState() => _TagCheckboxWidgetState();
}

class _TagCheckboxWidgetState extends State<TagCheckboxWidget> {
  late bool _selected = widget.selected;

  @override
  Widget build(BuildContext context) {
    return TagWidget(
      widget.name,
      selected: _selected,
      onPressed: _selectedSwitch,
    );
  }

  void _selectedSwitch() {
    setState(() {
      _selected = !_selected;
    });
  }
}

class TagWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String name;
  final bool selected;

  const TagWidget(
    this.name, {
    this.onPressed,
    this.selected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorSchema = theme.colorScheme;
    var backgroundColor =
        selected ? colorSchema.primary : colorSchema.onSurface;
    var textStyle = theme.textTheme.labelLarge;
    if (selected) {
      textStyle = textStyle?.copyWith(
        color: colorSchema.background,
      );
    }
    var style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      minimumSize: const Size(0, 0),
      textStyle: textStyle,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Text(
        name,
        style: textStyle,
      ),
    );
  }
}
