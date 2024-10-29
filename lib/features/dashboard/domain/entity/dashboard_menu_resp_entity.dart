class DashboardMenuRespEntity {
  List<MenuEntity> menu;

  DashboardMenuRespEntity({
    required this.menu,
  });

  factory DashboardMenuRespEntity.fromJson(Map<String, dynamic> json) =>
      DashboardMenuRespEntity(
        menu: List<MenuEntity>.from(
            json["menu"].map((x) => MenuEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}

class MenuEntity {
  String menuType;
  List<ItemEntity> item;

  MenuEntity({
    required this.menuType,
    required this.item,
  });

  factory MenuEntity.fromJson(Map<String, dynamic> json) => MenuEntity(
        menuType: json["menuType"],
        item: List<ItemEntity>.from(
            json["item"].map((x) => ItemEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menuType": menuType,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class ItemEntity {
  String id;
  String menuName;
  String imageUrl;

  ItemEntity({
    required this.id,
    required this.menuName,
    required this.imageUrl,
  });

  factory ItemEntity.fromJson(Map<String, dynamic> json) => ItemEntity(
        id: json["id"],
        menuName: json["menuName"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menuName": menuName,
        "imageUrl": imageUrl,
      };
}
