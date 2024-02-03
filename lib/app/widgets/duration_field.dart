import 'package:flutter/material.dart';
import 'package:interval/app/widgets/number_input.dart';

class DurationField extends StatelessWidget {
  final Duration value;
  final void Function(Duration) onDurationChange;

  const DurationField({
    required this.value,
    required this.onDurationChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberInput(
          value: value.inMinutes,
          onChange: handleMinutesChange,
        ),
        const SizedBox(
          width: 6,
        ),
        const Text(
          ":",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          width: 6,
        ),
        NumberInput(
          value: value.inSeconds % 60,
          onChange: handleSecondsChange,
        ),
      ],
    );
  }

  void handleMinutesChange(int minutes) {
    final duration = Duration(
      minutes: minutes,
      seconds: value.inSeconds % 60,
    );
    onDurationChange(duration);
  }

  void handleSecondsChange(int seconds) {
    final duration = Duration(
      minutes: value.inMinutes,
      seconds: seconds,
    );
    onDurationChange(duration);
  }
}
