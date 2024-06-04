import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:hackathonfront/screen/sellers/seller_add_item.dart';
import 'package:hackathonfront/screen/sellers/seller_edit_item.dart';
import 'package:hackathonfront/screen/sellers/seller_item_report.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SellerHome extends StatefulWidget {
  SellerHome({super.key});

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  List<dynamic> items = [];
  List itemForDisplay = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPersonItems();
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
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.1),
          ),
          itemCount: itemForDisplay.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SellerEditItem(
                      description: itemForDisplay[index]['description'],
                      itemName: itemForDisplay[index]['name'],
                      name: itemForDisplay[index]['name'],
                      price: itemForDisplay[index]['price'].toString(),
                      quantity: itemForDisplay[index]['quantity'].toString(),
                      taxSize: itemForDisplay[index]['tax_size'].toString(),
                      taxType: itemForDisplay[index]['tax_type'],
                      type: itemForDisplay[index]['type'],
                      uuid: itemForDisplay[index]['uuid'].toString(),
                    ),
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 80,
                margin: EdgeInsets.all(25),
                color: Colors.black12,
                child: GridTile(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(itemForDisplay[index]['name']),
                      SizedBox(
                        height: 10,
                      ),
                      Text(itemForDisplay[index]['quantity'].toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(itemForDisplay[index]['price'].toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(itemForDisplay[index]['created_at'].toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(itemForDisplay[index]['description']),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> getPersonItems() async {
    //Gettting the user uuid from the device storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? uuid = prefs.getString('uuid');

    print(uuid);
    List localList = [];
    var uri = 'http://127.0.0.1:8000/api/getUserItems/$uuid';

    var response = await http.get(Uri.parse(uri));

    var responseArray = jsonDecode(response.body);

    items = List.from(responseArray);

    for (int i = 0; i <= items.length - 1; i++) {
      localList.add(responseArray[i]);
    }

    setState(() {
      itemForDisplay.addAll(localList);
    });
  }
}
