import 'package:flutter/material.dart';
import 'package:hackathonfront/component/seller_add_item.dart';

import 'package:hackathonfront/screen/sellers/seller_home.dart';
import 'package:hackathonfront/screen/sellers/seller_item_report.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController item_nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController tax_sizeController = TextEditingController();
  TextEditingController tax_typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return SellerHome();
                  }));
                },
                child: Text('Home'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return AddItem();
                  }));
                },
                child: Text('Add item'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return SellerItemReport();
                  }));
                },
                child: Text('Report'),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  SellerAddItem(
                    controller: itemNameController,
                    hintText: 'Item name',
                  ),
                  SellerAddItem(
                    controller: priceController,
                    hintText: 'Price',
                  ),
                  SellerAddItem(
                    controller: quantityController,
                    hintText: 'Quantity',
                  ),
                  SellerAddItem(
                    controller: typeController,
                    hintText: 'Type',
                  ),
                  SellerAddItem(
                    controller: item_nameController,
                    hintText: 'Item Name',
                  ),
                  SellerAddItem(
                    controller: descriptionController,
                    hintText: 'Tax_Size',
                  ),
                  SellerAddItem(
                    controller: tax_sizeController,
                    hintText: 'Tax_Size',
                  ),
                  SellerAddItem(
                    controller: tax_typeController,
                    hintText: 'Tax_Type',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          addItemToDb(
                            description: descriptionController.text.trim(),
                            item_name: item_nameController.text.trim(),
                            name: itemNameController.text.trim(),
                            price: priceController.text.trim(),
                            quantity: quantityController.text.trim(),
                            tax_size: tax_sizeController.text.trim(),
                            tax_type: tax_typeController.text.trim(),
                            type: typeController.text.trim(),
                          );
                        },
                        child: Text('Add item'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addItemToDb({
    required String name,
    required String quantity,
    required String price,
    required String type,
    required String item_name,
    required String description,
    required String tax_type,
    required String tax_size,
  }) async {
    var url = 'http://127.0.0.1:8000/api/addItem';

//Gettting the user uuid from the device storage for identifying item for later use
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? uuid = prefs.getString('uuid');

    Map<String, dynamic> jbody = {
      'uuid': uuid,
      'name': name,
      'quantity': quantity,
      'price': price,
      'type': type,
      'item_name': item_name,
      'description': description,
      'tax_type': tax_type,
      'tax_size': tax_size
    };

    var resut = await http.post(Uri.parse(url), body: jbody);

    if (resut.statusCode == 201) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return SellerHome();
      }));
    }
    print(resut.statusCode);
    print(resut);
  }
}
