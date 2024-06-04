import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hackathonfront/component/seller_text_field.dart';
import 'package:hackathonfront/screen/sellers/seller_add_item.dart';
import 'package:hackathonfront/screen/sellers/seller_home.dart';
import 'package:hackathonfront/screen/sellers/seller_item_report.dart';

class SellerEditItem extends StatefulWidget {
  SellerEditItem(
      {super.key,
      required this.name,
      required this.quantity,
      required this.price,
      required this.description,
      required this.taxType,
      required this.taxSize,
      required this.itemName,
      required this.type,
      required this.uuid});

  final name;
  final quantity;
  final price;
  final description;
  final taxType;
  final taxSize;
  final itemName;
  final type;
  final uuid;

  @override
  State<SellerEditItem> createState() => _SellerEditItemState();
}

class _SellerEditItemState extends State<SellerEditItem> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController item_nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController tax_sizeController = TextEditingController();
  TextEditingController tax_typeController = TextEditingController();
  bool isEnabled = false;
  final List<String> items = <String>[
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
  ];

  @override
  void initState() {
    super.initState();
    itemNameController = TextEditingController();
    priceController.text = widget.name;
    quantityController.text = widget.quantity;
    typeController.text = widget.type;
    item_nameController.text = widget.itemName;
    descriptionController.text = widget.description;
    tax_sizeController.text = widget.taxSize;
    tax_typeController.text = widget.taxType;
  }

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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              isEnabled = !isEnabled;
                            });
                          },
                          child: Text('Enable')),
                      TextButton(onPressed: () {}, child: Text('Update')),
                      TextButton(onPressed: () {}, child: Text('Delete')),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  SellerTextField(
                    controller: itemNameController,
                    enable: isEnabled,
                  ),
                  SellerTextField(
                    controller: quantityController,
                    enable: isEnabled,
                  ),
                  SellerTextField(
                    controller: priceController,
                    enable: isEnabled,
                  ),
                  SellerTextField(
                    controller: typeController,
                    enable: isEnabled,
                  ),
                  SellerTextField(
                    controller: item_nameController,
                    enable: isEnabled,
                  ),
                  SellerTextField(
                    controller: descriptionController,
                    enable: isEnabled,
                  ),
                  SellerTextField(
                    controller: tax_typeController,
                    enable: isEnabled,
                  ),
                  SellerTextField(
                    controller: tax_sizeController,
                    enable: isEnabled,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
