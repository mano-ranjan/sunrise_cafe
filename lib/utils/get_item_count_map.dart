import 'package:sunrise_cafe/models/item_model.dart';

Map<ItemModel, int> getItemCountMap(List<ItemModel> itemList) {
  Map<ItemModel, int> itemCountMap = {};

  for (var item in itemList) {
    if (itemCountMap.containsKey(item)) {
      itemCountMap[item] = itemCountMap[item]! + 1;
    } else {
      itemCountMap[item] = 1;
    }
  }

  return itemCountMap;
}
