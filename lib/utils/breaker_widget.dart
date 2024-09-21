import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunrise_cafe/utils/constants.dart';

class BreakerWidget extends StatefulWidget {
  final String title;
  final bool isExpanded;
  final Function(bool) onTap;

  const BreakerWidget({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  State<BreakerWidget> createState() => _BreakerWidgetState();
}

class _BreakerWidgetState extends State<BreakerWidget> {
  late bool isExpanded;

  @override
  void initState() {
    // TODO: implement initState
    isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: TextStyleConstants.greyText14W500,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Divider(
            color: ColorConstants.greyText.withOpacity(0.2),
            thickness: 1,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
            widget.onTap(isExpanded);
          },
          child: SvgPicture.asset(
            isExpanded
                ? AssetConstants.upArrowIcon
                : AssetConstants.downArrowIcon,
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}
