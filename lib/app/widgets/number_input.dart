import 'package:flutter/material.dart';

class NumberInput extends StatefulWidget {
  final int value;
  final void Function(int value) onChange;

  const NumberInput({required this.value, required this.onChange, super.key});

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  late final x = TextEditingController(text: "${widget.value}".padLeft(2, "0"));

  @override
  void didUpdateWidget(covariant NumberInput oldWidget) {
    x.text = "${widget.value}".padLeft(2, "0");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).focusColor),
        borderRadius: BorderRadius.circular(8),
      ),
      width: 48,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MaterialButton(
            // color: Theme.of(context).primaryColor,
            onPressed: () {
              widget.onChange(widget.value + 1);
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
            child: const Icon(
              Icons.add,
              // color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(color: Theme.of(context).focusColor),
              ),
            ),
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: x,
              onSubmitted: (value) {
                widget.onChange(int.parse(value));
              },
            ),
          ),
          MaterialButton(
            // color: Theme.of(context).primaryColor,
            onPressed: () {
              widget.onChange(widget.value - 1);
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
            child: const Icon(
              Icons.remove,
              // color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
