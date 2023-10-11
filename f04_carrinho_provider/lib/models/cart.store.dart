import 'package:f04_carrinho_provider/models/catalog.dart';
import 'package:f04_carrinho_provider/models/item.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'cart.store.g.dart';

class CartModelX = _CartModelX with _$CartModelX;

abstract class _CartModelX with Store {
  late CatalogModel _catalog;

  _CartModelX(this._catalog);

  @observable
  ObservableList<int> _itemIds = ObservableList<int>();

  @computed
  CatalogModel get catalog => _catalog;

  @computed
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  @computed
  int get totalPrice =>
      items.fold(0, (total, itemCorrente) => total + itemCorrente.price);

  @action
  void add(Item item) {
    _itemIds.add(item.id);
  }

  @action
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

/* class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    //notifica ouvintes
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, itemCorrente) => total + itemCorrente.price);

  void add(Item item) {
    _itemIds.add(item.id);

    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);

    notifyListeners();
  }
}
 */