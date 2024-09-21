import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunrise_cafe/models/item_model.dart';
import 'package:sunrise_cafe/utils/add_to_cart_widget.dart';
import 'package:sunrise_cafe/utils/breaker_widget.dart';
import 'package:sunrise_cafe/utils/constants.dart';
import 'package:sunrise_cafe/utils/inner_shadow_widget.dart';

class SpecialTabWidget extends StatefulWidget {
  final List<ItemModel> addedItems;
  final Function(ItemModel) onAddToCart;
  const SpecialTabWidget({
    super.key,
    required this.onAddToCart,
    required this.addedItems,
  });

  @override
  State<SpecialTabWidget> createState() => _SpecialTabWidgetState();
}

class _SpecialTabWidgetState extends State<SpecialTabWidget> {
  List<ItemModel> _items = [];
  List<ItemModel> addedItems = [];

  Future<void> _loadData() async {
    final String response =
        await rootBundle.loadString('assets/jsons/food_file.json');
    final responseList = json.decode(response) as List;
    responseList.map((e) {
      _items.add(ItemModel.fromJson(e));
    }).toList();
    // list.map((e) => DocumentModel.fromJson(e)).toList()
    print("the data is : $_items");
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant SpecialTabWidget oldWidget) {
    // TODO: implement didUpdateWidget
    addedItems = widget.addedItems;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 21,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 122,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF000000).withOpacity(0.5), // #000000
                      const Color(0x52000000).withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Welcome to\nSunrise Cafe",
                      style: TextStyleConstants.white16W500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          BreakerWidget(
            isExpanded: true,
            title: "Today’s Special",
            onTap: (isExpanded) {},
          ),
          const SizedBox(
            height: 16,
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              mainAxisSpacing: 16.0, // Spacing between rows
              crossAxisSpacing: 8.0, // Spacing between columns
              childAspectRatio: 0.85, // Aspect ratio of each item
            ),
            itemCount: _items.length, // Use the length of your widget list
            // Use the length of your widget list
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => CategoryScreen(
                  //       categoryName: data.data!.category![index].tinycatName!,
                  //       pageNumber: "",
                  //     ),
                  //   ),
                  // );
                },
                child: Container(
                  color: const Color(0xffF6F6F6),
                  height: 250,
                  // width: 160,
                  child: InnerShadowWidget(
                    isCircle: false,
                    childWidget: Column(
                      children: [
                        SizedBox(
                          height: 128,
                          width: double.infinity,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AssetConstants.vegIcon,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                _items[index].name!,
                                style: TextStyleConstants.greyText13W500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹${_items[index].price}",
                                style: TextStyleConstants.greyText13W500,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              AddCartWidget(
                                onPressed: () {
                                  widget.onAddToCart(_items[index]);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // Disable scrolling if needed
          )
        ],
      ),
    );
  }
}
