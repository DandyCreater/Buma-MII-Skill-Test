import 'package:buma_mii_skill_test/features/dashboard/domain/entity/dashboard_menu_resp_entity.dart';

class DashboardMenuRespModel {
  List<Menu> menu;

  DashboardMenuRespModel({
    required this.menu,
  });

  factory DashboardMenuRespModel.fromJson(Map<String, dynamic> json) =>
      DashboardMenuRespModel(
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };

  DashboardMenuRespEntity toEntity() {
    return DashboardMenuRespEntity(
        menu: menu.map((e) => e.toEntity()).toList());
  }
}

class Menu {
  String menuType;
  List<Item> item;

  Menu({
    required this.menuType,
    required this.item,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        menuType: json["menuType"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menuType": menuType,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };

  MenuEntity toEntity() {
    return MenuEntity(
        menuType: menuType, item: item.map((e) => e.toEntity()).toList());
  }
}

class Item {
  String id;
  String menuName;
  String imageUrl;

  Item({
    required this.id,
    required this.menuName,
    required this.imageUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        menuName: json["menuName"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menuName": menuName,
        "imageUrl": imageUrl,
      };

  ItemEntity toEntity() {
    return ItemEntity(
      id: id,
      menuName: menuName,
      imageUrl: imageUrl,
    );
  }
}
