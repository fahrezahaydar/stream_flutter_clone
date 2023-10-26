import 'package:stream/domain/library.dart';

//Text Sizes
const double bodyLarge = 16;
const double bodyMedium = 14;
const double bodySmall = 12;

const double titleLarge = 48;
const double titleMedium = 36;
const double titleSmall = 24;

const double displayLarge = 28;
const double displayMedium = 20;
const double displaySmall = 16;

const double buttonSmall = 16;
const double buttonMeduim = 20;
const double buttonLarge = 24;

//Padding and Margin Sizes
const double spacerXs = 5.0;
const double spacerS = 10.0;
const double spacerM = 20.0;
const double spacerL = 30.0;
const double spacerXl = 40.0;

class VerticalSpace extends StatelessWidget {
  final double? height;
  const VerticalSpace(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HorizontalSpace extends StatelessWidget {
  final double? width;
  const HorizontalSpace(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
