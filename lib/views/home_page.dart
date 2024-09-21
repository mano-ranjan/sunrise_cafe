import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunrise_cafe/models/item_model.dart';
import 'package:sunrise_cafe/utils/cart_number_widget.dart';
import 'package:sunrise_cafe/utils/constants.dart';
import 'package:sunrise_cafe/utils/header_icons.dart';
import 'package:sunrise_cafe/utils/inner_shadow_widget.dart';
import 'package:sunrise_cafe/utils/main_tab_widget.dart';
import 'package:sunrise_cafe/utils/other_tab_widget.dart';
import 'package:sunrise_cafe/utils/special_tab_widget.dart';
import 'package:sunrise_cafe/views/cart_screen.dart'; // Add this import

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;
  List<ItemModel> addedItems = [];
  List<ItemModel> previousItems = [];
  @override
  void initState() {
    _tabController = TabController(length: 8, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF1F1F1),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 36,
              ),
              headerSection(),
              // const CartNumberWidget(),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                // labelStyle: TextStyleConstants.centerTextBlack14W600,
                indicatorWeight: 2,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: ColorConstants.tabGreen,
                indicatorColor: ColorConstants.tabGreen,
                // unselectedLabelStyle: TextStyleConstants.basic14W400,
                // unselectedLabelColor: ColorConstants.sheetHandleGrey,
                labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                tabs: [
                  Tab(
                    text: StringConstants.special,
                  ),
                  Tab(
                    text: StringConstants.main,
                  ),
                  Tab(
                    text: StringConstants.desserts,
                  ),
                  Tab(
                    text: StringConstants.beverages,
                  ),
                  Tab(
                    text: StringConstants.special,
                  ),
                  Tab(
                    text: StringConstants.main,
                  ),
                  Tab(
                    text: StringConstants.desserts,
                  ),
                  Tab(
                    text: StringConstants.beverages,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SpecialTabWidget(
                      addedItems: addedItems,
                      onAddToCart: (item) {
                        setState(() {
                          addedItems.add(item);
                        });
                      },
                    ),
                    MainTabWidget(),
                    OtherTabWidget(),
                    OtherTabWidget(),
                    SpecialTabWidget(
                      addedItems: addedItems,
                      onAddToCart: (item) {
                        setState(() {
                          addedItems.add(item);
                        });
                      },
                    ),
                    MainTabWidget(),
                    OtherTabWidget(),
                    OtherTabWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 67,
          child: BottomNavigationBar(
            backgroundColor: Color(0xffF1F1F1),
            fixedColor: ColorConstants.tabGreen,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: HeaderIcon(
                  assetPath: AssetConstants.boltIcon,
                  size: 32,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: InnerShadowWidget(
                  isCircle: false,
                  childWidget: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(AssetConstants.bookOpenIcon),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          addedItems: addedItems,
                          previousItems: previousItems,
                          onUpdateAddedItems: (items) {
                            print("added items $items");
                            setState(() {
                              addedItems = items;
                            });
                          },
                          onUpdatePreviousItems: (items) {
                            print("previous items $items");
                            previousItems = items;
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        HeaderIcon(
                          assetPath: AssetConstants.shoppingBagIcon,
                          size: 32,
                        ),
                        Visibility(
                          visible: addedItems.isNotEmpty,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: ColorConstants.tomatoRed,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  addedItems.length.toString(),
                                  style: TextStyleConstants.white10W500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerSection() {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          StringConstants.cafeName,
          style: TextStyleConstants.greyText16W700,
        ),
        const Spacer(),
        HeaderIcon(
          assetPath: AssetConstants.recordVoiceIcon,
        ),
        const SizedBox(
          width: 16,
        ),
        HeaderIcon(assetPath: AssetConstants.tagIcon)
      ],
    );
  }
}
