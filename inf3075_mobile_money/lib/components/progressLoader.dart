import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';

class ProgressLoader extends StatelessWidget {
  final Widget child;
  final bool isAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color>? valueColor;

  ProgressLoader({
    Key? key,
    required this.child,
    required this.isAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (isAsyncCall) {
      final model = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(
              dismissible: false,
              color: color,
            ),
          ),
          const Center(
            child: CircularProgressIndicator(
              backgroundColor: PRIMARY_COLOR,
            ),
          ),
        ],
      );
      widgetList.add(model);
    }
    return Stack(
      children: widgetList,
    );
  }
}
