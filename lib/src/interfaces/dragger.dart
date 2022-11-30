import 'package:flutter/gestures.dart';

abstract class Dragger {
  void drag(double dx, double dy);

  void onScaleStart(ScaleStartDetails details);

  void onScaleUpdate(ScaleUpdateDetails details);

  void onScaleStop(ScaleEndDetails details);

  void onEventCallbackRegister(void Function() callback);

  bool isDraggingNow();
}
