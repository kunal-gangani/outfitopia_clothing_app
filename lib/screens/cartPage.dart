import 'package:flutter/material.dart';
import 'package:outfitopia_clothing_app/globals/globals.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int qty = 1;
  double shippingCharges = 40.00;
  double importCharges = 70.00;
  double total = 0;
  double grossTotal  = 0;

  void sumOfAllProd() {
    for (var e in cartList) {
      total += e['price'] * e['qty'];
    }
    grossTotal = total + importCharges + shippingCharges;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int cartItems = cartList.length;
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Cart",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: (cartList.isEmpty)
          ? const Center(
              child: Text("Add some products to Cart first"),
            )
          : Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ...cartList.map(
                        (e) => Container(
                          width: w,
                          height: h * 0.15,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.blueGrey, width: 2),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.network(
                                  e['thumbnail'],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                e['title'],
                                                style: TextStyle(
                                                  fontSize:
                                                      textScaler.scale(16),
                                                ),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                    size: 35,
                                                  ),
                                                  SizedBox(
                                                    width: w * 0.01,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartList.remove(e);
                                                        setState(() {});
                                                      },
                                                      child: const Icon(
                                                        Icons.remove_circle,
                                                        color: Colors.grey,
                                                        size: 35,
                                                      ))
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "\$ ${e['price'].toString()}",
                                              style: TextStyle(
                                                fontSize: textScaler.scale(18),
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (e['qty'] > 1) {
                                                    e['qty']--;
                                                  } else {
                                                    cartList.remove(e);
                                                  }
                                                  sumOfAllProd();
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: h * 0.05,
                                                  width: w * 0.1,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 2),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: h * 0.05,
                                                width: w * 0.1,
                                                color: Colors.blueGrey,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "1",
                                                  style: TextStyle(
                                                      fontSize:
                                                          textScaler.scale(16),
                                                      color: Colors.white),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  if (e['stock'] > e['qty']) {
                                                    e['qty']++;
                                                  }
                                                  sumOfAllProd();
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: h * 0.05,
                                                  width: w * 0.1,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 2),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.05,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: w,
                          height: h * 0.075,
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.blueGrey, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Enter Coupon Code",
                                      style: TextStyle(
                                          fontSize: textScaler.scale(16),
                                          color: Colors.grey),
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.blueGrey,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Apply",
                                      style: TextStyle(
                                        fontSize: textScaler.scale(16),
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          height: h * 0.3,
                          width: w,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.blueGrey, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Items ($cartItems)",
                                    style: TextStyle(
                                        fontSize: textScaler.scale(16),
                                        color: Colors.grey.shade600),
                                  ),
                                  Text(
                                    "\$ 1499.0",
                                    style: TextStyle(
                                      fontSize: textScaler.scale(16),
                                      letterSpacing: 2,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.025,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shipping Charges",
                                    style: TextStyle(
                                        fontSize: textScaler.scale(16),
                                        color: Colors.grey.shade600),
                                  ),
                                  Text(
                                    "\$ $shippingCharges",
                                    style: TextStyle(
                                        fontSize: textScaler.scale(16),
                                        letterSpacing: 2,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.025,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Import Charges",
                                    style: TextStyle(
                                        fontSize: textScaler.scale(16),
                                        color: Colors.grey.shade600),
                                  ),
                                  Text(
                                    "\$ $importCharges",
                                    style: TextStyle(
                                        fontSize: textScaler.scale(16),
                                        letterSpacing: 2,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.025,
                              ),
                              const Divider(
                                color: Colors.blueGrey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: TextStyle(
                                        fontSize: textScaler.scale(16),
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$ 1609.0",
                                    style: TextStyle(
                                        fontSize: textScaler.scale(16),
                                        letterSpacing: 2,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
