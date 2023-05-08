import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatsInfoEditCard extends StatefulWidget {
  StatsInfoEditCard({
    super.key,
    required this.progress,
    required this.leadingText,
    required this.lastText,
    required this.isShowActionButtons,
    required this.onTapDeleteButton,
    required this.onTapAddButton,
  });

  final double progress;
  final String leadingText;
  final String lastText;
  final bool isShowActionButtons;
  final VoidCallback onTapDeleteButton;
  final VoidCallback onTapAddButton;

  @override
  State<StatsInfoEditCard> createState() => _StatsInfoEditCardState();
}

class _StatsInfoEditCardState extends State<StatsInfoEditCard> {
  double progressValue = 0.20;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                // height: 34,
                child: TextFormField(
                  // controller: textEditingController,
                  cursorColor: Colors.black,
                  maxLines: 1, textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1,
                  ),
                  initialValue: widget.leadingText,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  // onChanged: onChangeValue,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 28,
                width: 300 * progressValue.toDouble(),
                color: Colors.deepPurple,
              ),
              const SizedBox(width: 8),
              Container(
                width: 88,
                // height: 34,
                child: TextFormField(
                  // controller: textEditingController,
                  cursorColor: Colors.black,
                  maxLines: 1, textAlign: TextAlign.left,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                  ],
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1,
                  ),
                  initialValue: widget.lastText,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  // onChanged: onChangeValue,
                ),
              ),
            ],
          ),
          Container(
            // color: Colors.red,
            child: Row(
              children: [
                widget.isShowActionButtons
                    ? IconButton(
                        onPressed: widget.onTapAddButton,
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.add_box_rounded,
                        ),
                      )
                    : const SizedBox(),
                IconButton(
                  onPressed: widget.onTapDeleteButton,
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                  ),
                ),
                Container(
                  width: 50,
                  // height: 34,
                  // color: Colors.red,
                  child: TextFormField(
                    // controller: textEditingController,
                    cursorColor: Colors.black,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                    ], // Only numbers can be entered
                    style: const TextStyle(
                      fontSize: 18,

                      // height: 1,
                    ),
                    initialValue: "20",
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isEmpty) return;
                      if (0 < double.parse(value) && double.parse(value) > 100) {
                        progressValue = 1; // 1 == 100%
                        setState(() {});
                        return;
                      }

                      try {
                        progressValue = (double.parse(value) / 100);
                      } catch (e) {
                        print(e);
                      }

                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                    ),
                    // onChanged: onChangeValue,
                  ),
                ),
                Icon(Icons.percent)
              ],
            ),
          )
        ],
      ),
    );
  }
}
