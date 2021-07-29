import 'package:flutter/material.dart';
import 'package:lista_compras/models/list_item.dart';
import 'package:lista_compras/models/shoping_list.dart';
import 'package:lista_compras/shopping_items_dialog.dart';
import 'package:lista_compras/util/dbhelper.dart';

class ItemsScreen extends StatefulWidget {
  final ShoppingList shoppingList;

  ItemsScreen(this.shoppingList);
  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  DbHelper helper = DbHelper();
  ShoppingItemsDialog itemsDialog;
  List<ListItem> items;

  void initState() {
    super.initState();
    itemsDialog = ShoppingItemsDialog();
    showData();
  }

  Future showData() async {
    await helper.openDb();
    items = await helper.getItems(widget.shoppingList.id);
    setState(() {});
  }

  void eliminarItem(int i) {
    String name = items[i].name;
    helper.deleteItem(items[i]);
    items.removeAt(i);
    setState(() {
      items = items;
    });


  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(

      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.shoppingList.name),
        ),
        body: ListView.builder(
            itemCount: items == null ? 0 : items.length,
            itemBuilder: (c, i) => Dismissible(
              key: Key(items[i].name),
              background: Container(
                color: Colors.blue,
              ),
              onDismissed: (direction){
                String name = items[i].name;
                helper.deleteItem(items[i]);
                setState(() {
                  items.removeAt(i);
                });
              },
              child: ListTile(
                      title: Text(items[i].name),
                      subtitle: Text(items[i].quantity),
                      trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {})
                  ),
            )),


        floatingActionButton: FloatingActionButton(
          child:Icon(
            Icons.add,
          ),
          onPressed: () async {
            showDialog(
                context: context,
                builder: (c) => itemsDialog.buildDialog(
                    c, ListItem(0, widget.shoppingList.id,"",""), true))
                .then((value) => showData());
          },

        ),
      ),
    );
  }
}
