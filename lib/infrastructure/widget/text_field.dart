import 'package:stream/domain/library.dart';

class StreamTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final void Function()? onTap;
  final Widget? suffixIcon;

  const StreamTextField({
    this.title,
    this.controller,
    this.suffixIcon,
    this.hintText,
    this.onTap,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!, style: textStyle.displaySmall),
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          textAlignVertical: TextAlignVertical.top,
          style: textStyle.bodyLarge,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        )
      ],
    );
  }
}
