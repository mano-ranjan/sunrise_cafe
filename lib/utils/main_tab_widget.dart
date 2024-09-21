import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunrise_cafe/utils/add_to_cart_widget.dart';
import 'package:sunrise_cafe/utils/breaker_widget.dart';
import 'package:sunrise_cafe/utils/constants.dart';
import 'package:sunrise_cafe/utils/inner_shadow_widget.dart';

class MainTabWidget extends StatefulWidget {
  const MainTabWidget({super.key});

  @override
  State<MainTabWidget> createState() => _SpecialTabWidgetState();
}

class _SpecialTabWidgetState extends State<MainTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 19,
        ),
        BreakerWidget(
          title: "Acai bowls",
          isExpanded: true,
          onTap: (isExpanded) {},
        ),
        const SizedBox(
          height: 24,
        ),
        InnerShadowWidget(
          isCircle: false,
          childWidget: Container(
            height: 87,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 71,
                    width: 71,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      child: Image.network(
                        "https://static.toiimg.com/thumb/56868564.cms?imgsize=1948751&width=800&height=800",
                        fit: BoxFit.cover,
                      ), // Access each widget from the list
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sunrise Acai Bowl",
                        style: TextStyleConstants.greyText16W500,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width - 127,
                        child: Row(
                          children: [
                            SvgPicture.asset(AssetConstants.vegIcon),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Acai bowls"),
                            Spacer(),
                            AddCartWidget(onPressed: () {})
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
