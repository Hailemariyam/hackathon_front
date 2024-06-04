import 'package:flutter/material.dart';
import 'package:increment_decrement_form_field/increment_decrement_form_field.dart';

class ItemDetail extends StatefulWidget {
  ItemDetail({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.tax_size,
  });

  final String name;
  final String price;
  final String description;
  String quantity;
  final String tax_size;

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int _quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("Item order detail"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 550,
          height: 400,
          color: Colors.white12,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    color: Colors.grey,
                    width: 400,
                    height: 500,
                    child: Column(
                      children: [
                        Container(height: 20, child: Text(widget.name)),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 20,
                                child: Text(widget.description),
                              ),
                              Container(
                                height: 20,
                                child: Text('this is price: ${widget.price}'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text('Selected Quantity: ${_quantity}'),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  IncrementDecrementFormField<int>(
                                    initialValue: 0,
                                    displayBuilder: (value, field) {
                                      return Text(
                                        value == null ? "0" : value.toString(),
                                      );
                                    },
                                    onDecrement: (currentValue) {
                                      var dec = currentValue! - 1;
                                      if (dec.isNegative) {
                                        dec = 0;
                                      }
                                      setState(() {
                                        _quantity = dec;
                                      });
                                      return dec;
                                    },
                                    onIncrement: (currentValue) {
                                      var inc = currentValue! + 1;
                                      setState(() {
                                        _quantity = inc;
                                      });
                                      return inc;
                                    },
                                  ),
                                ],
                              ),
                              Container(
                                height: 20,
                                child: Text(
                                    'this is tax size : ${widget.tax_size}'),
                              ),
                               SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 5),
                                  color:
                                      const Color.fromARGB(255, 141, 210, 143),
                                  height: 30,
                                  child: Text('Pay now'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
