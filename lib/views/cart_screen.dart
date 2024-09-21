import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunrise_cafe/models/item_model.dart';
import 'package:sunrise_cafe/utils/breaker_widget.dart';
import 'package:sunrise_cafe/utils/cart_number_widget.dart';
import 'package:sunrise_cafe/utils/constants.dart';
import 'package:sunrise_cafe/utils/get_item_count_map.dart';

import 'package:sunrise_cafe/utils/header_icons.dart';
import 'package:sunrise_cafe/utils/inner_shadow_place_order_widget.dart';
import 'package:sunrise_cafe/utils/inner_shadow_widget.dart';

class CartScreen extends StatefulWidget {
  final List<ItemModel> addedItems;
  final List<ItemModel> previousItems;
  final Function(List<ItemModel>) onUpdateAddedItems;
  final Function(List<ItemModel>) onUpdatePreviousItems;
  const CartScreen({
    super.key,
    required this.addedItems,
    required this.previousItems,
    required this.onUpdateAddedItems,
    required this.onUpdatePreviousItems,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<ItemModel, int> _addedItems = {};
  Map<ItemModel, int> _prevOrders = {};
  bool _isCurrentOrderExpanded = true;
  bool _isPreviousOrderExpanded = false;
  @override
  void initState() {
    _addedItems = getItemCountMap(widget.addedItems);
    _prevOrders = getItemCountMap(widget.previousItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 96,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: BreakerWidget(
                      title: "Current Order",
                      isExpanded: _isCurrentOrderExpanded,
                      onTap: (isExpanded) {
                        setState(() {
                          _isCurrentOrderExpanded = isExpanded;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: _addedItems.isNotEmpty && _isCurrentOrderExpanded,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: InnerShadowWidget(
                        isCircle: false,
                        childWidget: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 8,
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 273,
                              minHeight: 50,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 232,
                                    minHeight: 50,
                                  ),
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 24,
                                      );
                                    },
                                    shrinkWrap: true,
                                    itemCount: _addedItems.length,
                                    itemBuilder: (context, index) {
                                      return Visibility(
                                        visible: _addedItems.values
                                                .elementAt(index) >
                                            0,
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                AssetConstants.vegIcon),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(_addedItems.keys
                                                    .elementAt(index)
                                                    .name!),
                                                Text(
                                                    '₹${_addedItems.keys.elementAt(index).price.toString()}'),
                                              ],
                                            ),
                                            const Spacer(),
                                            CartNumberWidget(
                                              number: _addedItems.values
                                                  .elementAt(index),
                                              onIncrement: () {
                                                setState(() {
                                                  _addedItems.update(
                                                    _addedItems.keys
                                                        .elementAt(index),
                                                    (value) {
                                                      // Add one instance of the item to widget.addedItems
                                                      widget.addedItems.add(
                                                          _addedItems.keys
                                                              .elementAt(
                                                                  index));
                                                      widget.onUpdateAddedItems(
                                                          widget.addedItems);
                                                      return value + 1;
                                                    },
                                                  );
                                                });
                                              },
                                              onDecrement: () {
                                                setState(() {
                                                  _addedItems.update(
                                                    _addedItems.keys
                                                        .elementAt(index),
                                                    (value) {
                                                      if (value == 1) {
                                                        // Remove the item from widget.addedItems
                                                        widget.addedItems
                                                            .removeWhere((item) =>
                                                                item.id ==
                                                                _addedItems.keys
                                                                    .elementAt(
                                                                        index)
                                                                    .id);
                                                        _addedItems.remove(
                                                            _addedItems.keys
                                                                .elementAt(
                                                                    index));
                                                        widget
                                                            .onUpdateAddedItems(
                                                                widget
                                                                    .addedItems);
                                                        return 0;
                                                      } else {
                                                        // Remove one instance of the item from widget.addedItems
                                                        int itemIndex = widget
                                                            .addedItems
                                                            .indexWhere((item) =>
                                                                item.id ==
                                                                _addedItems.keys
                                                                    .elementAt(
                                                                        index)
                                                                    .id);
                                                        if (itemIndex != -1) {
                                                          widget.addedItems
                                                              .removeAt(
                                                                  itemIndex);
                                                        }
                                                        widget
                                                            .onUpdateAddedItems(
                                                                widget
                                                                    .addedItems);
                                                        return value - 1;
                                                      }
                                                    },
                                                  );
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Add cooking instruction",
                                    style: TextStyleConstants
                                        .cookingInstruction12W500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: BreakerWidget(
                      title: "Previous Orders",
                      isExpanded: _isPreviousOrderExpanded,
                      onTap: (isExpanded) {
                        setState(() {
                          _isPreviousOrderExpanded = isExpanded;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: _prevOrders.isNotEmpty && _isPreviousOrderExpanded,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: InnerShadowWidget(
                        isCircle: false,
                        childWidget: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 8,
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 273,
                              minHeight: 50,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 273,
                                    minHeight: 50,
                                  ),
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 24,
                                      );
                                    },
                                    shrinkWrap: true,
                                    itemCount: _prevOrders.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          SvgPicture.asset(
                                              AssetConstants.vegIcon),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(_prevOrders.keys
                                                  .elementAt(index)
                                                  .name!),
                                              Text(
                                                  '₹${_prevOrders.keys.elementAt(index).price.toString()}'),
                                            ],
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: 90,
                                            height: 32,
                                            child: Center(
                                              child: Text(
                                                _prevOrders.values
                                                    .elementAt(index)
                                                    .toString(),
                                                style: TextStyleConstants
                                                    .greyText13W500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            Container(
              height: 88,
              decoration: const BoxDecoration(
                color: Color(0xffF1F1F1),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x66AEAEC0),
                    offset: Offset(1.5, 1.5),
                    blurRadius: 3.0,
                  ),
                  BoxShadow(
                    color: Color(0xFFFFFFFF),
                    offset: Offset(-1.0, -1.0),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.onUpdateAddedItems(widget.addedItems);
                        widget.onUpdatePreviousItems(widget.previousItems);
                        Navigator.pop(context);
                      },
                      child: HeaderIcon(
                        assetPath: AssetConstants.arrowLeftIcon,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Place Order",
                      style: TextStyleConstants.greyText20W500,
                    ),
                    const Spacer(),
                    HeaderIcon(
                      assetPath: AssetConstants.waiterIcon,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff459EAF),
                        Color(0xff007991),
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xE5CDCDCD), // #CDCDCDE5
                        offset: Offset(5, 5), // 5px 5px
                        blurRadius: 13, // 13px
                      ),
                      BoxShadow(
                        color: Color(0xE5FFFFFF), // #FFFFFFE5
                        offset: Offset(-5, -5), // -5px -5px
                        blurRadius: 10, // 10px
                      ),
                      BoxShadow(
                        color: Color(0x33CDCDCD), // #CDCDCD33
                        offset: Offset(5, -5), // 5px -5px
                        blurRadius: 10, // 10px
                      ),
                      BoxShadow(
                        color: Color(0x33CDCDCD), // #CDCDCD33
                        offset: Offset(-5, 5), // -5px 5px
                        blurRadius: 10, // 10px
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${_addedItems.values.fold(0, (sum, count) => sum + count)} items",
                          style: TextStyleConstants.white12W500,
                        ),
                        const Spacer(),
                        Text(
                          "PLACE ORDER",
                          style: TextStyleConstants.white13W700,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        InnerShadowPlaceOrderWidget(
                          isCircle: true,
                          onTap: () {
                            widget.onUpdatePreviousItems(
                                widget.previousItems + widget.addedItems);
                            widget.onUpdateAddedItems([]);
                            Navigator.pop(context);
                          },
                          childWidget: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SvgPicture.asset(
                              AssetConstants.arrowRightWhiteIcon,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
