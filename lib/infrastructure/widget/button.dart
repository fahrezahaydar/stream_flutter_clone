import 'package:stream/domain/library.dart';

class PrimaryButton extends StatelessWidget {
  final EdgeInsetsGeometry? outerPadding;
  final String data;
  final void Function()? onPressed;
  final Size? fixedSize;
  const PrimaryButton(
    this.data, {
    this.outerPadding = const EdgeInsets.all(20.0),
    this.fixedSize = const Size.fromHeight(60),
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding!,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(minimumSize: MaterialStateProperty.all(fixedSize)),
        child: Text(data),
      ),
    );
  }
}

class FlatButton extends StatelessWidget {
  final EdgeInsetsGeometry? outerPadding;
  final void Function()? onPressed;
  final ButtonStyle? style;
  final Widget child;

  const FlatButton({
    required this.child,
    this.outerPadding = EdgeInsets.zero,
    this.style,
    required this.onPressed,
    super.key,
  });

  factory FlatButton.icon(
    IconData? icon, {
    ButtonStyle? style,
    required void Function()? onPressed,
    double? size,
    Color? color,
  }) {
    return FlatButton(
      onPressed: onPressed,
      style: style,
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }

  factory FlatButton.text(
    String data, {
    required void Function()? onPressed,
    TextStyle? style,
  }) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        data,
        style: style,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding!,
      child: TextButton(
        onPressed: onPressed,
        style: style,
        child: child,
      ),
    );
  }
}
