import 'package:flutter/material.dart';

class SingleTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorMessage;
  final Widget? label;
  final bool password;

  const SingleTextField({
    super.key,
    this.controller,
    this.errorMessage,
    this.label,
    this.password = false
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: colorScheme.onSurface,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: TextField(
              controller: controller,
              obscureText: password,
              autocorrect: false,
              enableSuggestions: !password,
              decoration: InputDecoration(
                border: InputBorder.none,
                label: label,
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 32,
            maxHeight: 32,
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: _errorWidget(theme, colorScheme)),
        ),
      ],
    );
  }

  Widget? _errorWidget(ThemeData theme, ColorScheme colorScheme) {
    if (errorMessage?.isNotEmpty ?? false) {
      return Text(
        errorMessage!,
        style: theme.textTheme.bodySmall?.apply(
          color: colorScheme.error,
        ),
      );
    }
    return null;
  }
}
