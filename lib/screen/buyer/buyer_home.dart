import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hackathonfront/screen/buyer/item_detail.dart';

import 'package:hackathonfront/screen/sellers/seller_add_item.dart';
import 'package:hackathonfront/screen/sellers/seller_edit_item.dart';
import 'package:hackathonfront/screen/sellers/seller_item_report.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BuyerHome extends StatefulWidget {
  BuyerHome({super.key});

  @override
  State<BuyerHome> createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<BuyerHome> {
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
                    return BuyerHome();
                  }));
                },
                child: Text('Home'),
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart),
                  ),
                  Positioned(
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              )
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
            return Container(
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
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return ItemDetail(
                                description: itemForDisplay[index]
                                        ['description']
                                    .toString(),
                                name: itemForDisplay[index]['name'].toString(),
                                price:
                                    itemForDisplay[index]['price'].toString(),
                                quantity: itemForDisplay[index]['quantity']
                                    .toString(),
                                tax_size: itemForDisplay[index]['tax_size']
                                    .toString(),
                              );
                            }));
                          },
                          child: Text('Buy now'),
                        ),
                      ),
                    ),
                  ],
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
