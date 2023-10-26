import 'package:stream/domain/library.dart';

class Widgets {
  final textStyle = Theme.of(Get.context!).textTheme;
  final color = Theme.of(Get.context!).colorScheme;

  header({required String title, required String subtitle}) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Text(title, style: textStyle.displayMedium),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: textStyle.headlineMedium,
          )
        ]));
  }

  gender(
      {required String title,
      required String value,
      required void Function(String?)? onChanged,
      required List<String> list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textStyle.displaySmall),
        SizedBox(
          height: 56,
          width: Get.width - 40,
          child: DropdownButton<String>(
            value: value,
            onChanged: onChanged,
            items: list.map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender, style: textStyle.labelLarge),
              );
            }).toList(),
            isExpanded: true,
            style: textStyle.bodyLarge,
            underline: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: color.outline))),
            ),
          ),
        ),
      ],
    );
  }

  iconTitleBelow(String data,
      {Widget? child, required void Function()? onPressed, IconData? icon}) {
    return Column(
      children: [
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: color.secondary,
                borderRadius: BorderRadius.circular(12)),
            child: FlatButton.icon(
              icon,
              onPressed: onPressed,
              color: Colors.white,
            )),
        const SizedBox(height: 6),
        Text(data,
            style: textStyle.displaySmall
                ?.copyWith(fontSize: 14, color: Colors.white))
      ],
    );
  }

  contentHeader(
      {required IconData icon,
      required String title,
      Color? color,
      required void Function()? onPressed}) {
    return Container(
      height: 60,
      color: Theme.of(Get.context!).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton.icon(icon, color: Colors.transparent, onPressed: () {}),
          Text(title, style: textStyle.displayMedium),
          FlatButton.icon(icon,
              onPressed: onPressed,
              style: TextButton.styleFrom(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(10)),
              color: Theme.of(Get.context!).colorScheme.onBackground)
        ],
      ),
    );
  }

  profileMenu(String data,
      {EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(horizontal: 20),
      required void Function()? onPressed}) {
    return Container(
      padding: padding,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              data,
              style: textStyle.displaySmall?.copyWith(fontSize: 14),
            ),
            const Spacer(),
            Icon(Icons.chevron_right, color: color.onSurface)
          ],
        ),
      ),
    );
  }

  final theme = Theme.of(Get.context!).colorScheme;

  svg(String name) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Color(0xFFFFD700), // Lighter gold color
            Color(0xFFDAA520), // Darker gold color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      child: SvgPicture.asset(
        "assets/svg/$name",
        alignment: Alignment.centerLeft,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }

  Widget container() => Container(
        width: 375,
        height: 219,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: color.background),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 645,
              height: 662.98,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(0.22),
                    child: Container(
                      width: 539.18,
                      height: 539.61,
                      decoration: ShapeDecoration(
                        color: color.secondaryContainer,
                        shape: const OvalBorder(),
                      ),
                    ),
                  ),
                  Container(
                    width: 498.49,
                    height: 498.12,
                    decoration: ShapeDecoration(
                      color: color.secondaryContainer,
                      shape: const OvalBorder(),
                    ),
                  ),
                  Container(
                    width: 455.67,
                    height: 456.88,
                    decoration: ShapeDecoration(
                      color: color.secondaryContainer,
                      shape: const OvalBorder(),
                    ),
                  ),
                  Container(
                    width: 427.39,
                    height: 426.15,
                    decoration: ShapeDecoration(
                      color: color.secondaryContainer,
                      shape: const OvalBorder(),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(-0.39),
                    child: Container(
                      width: 432.03,
                      height: 432.30,
                      decoration: ShapeDecoration(
                        color: color.secondaryContainer,
                        shape: const OvalBorder(),
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(-0.39),
                    child: Container(
                      width: 384.44,
                      height: 384.69,
                      decoration: ShapeDecoration(
                        color: color.secondaryContainer,
                        shape: const OvalBorder(),
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(-0.39),
                    child: Container(
                      width: 384.44,
                      height: 384.69,
                      decoration: ShapeDecoration(
                        color: color.secondaryContainer,
                        shape: const OvalBorder(),
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(-0.39),
                    child: Container(
                      width: 357.44,
                      height: 357.67,
                      decoration: ShapeDecoration(
                        color: color.secondaryContainer,
                        shape: const OvalBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.stream, color: Colors.white);
  }
}
