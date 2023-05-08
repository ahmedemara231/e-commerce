import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/view/home_screen/4_screens/home/item_details.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isEmpty = true;
  ValueNotifier<List> itemsInCart = ValueNotifier(cart);

  void changeEmpty()
  {
    if(cart.isNotEmpty)
      {
        isEmpty = false;
        log('${cart.isNotEmpty}');
      }
  }
  void listenToCart()
  {
    itemsInCart.addListener(() {
      setState(() {

      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEmpty();
    listenToCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
            onPressed: ()
            {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        title: const Text('Your Cart'),
      ),
      body: isEmpty? const Center(
        child: Text('Your Cart is Empty',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
      ) : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Row(
                children: [
                   SizedBox(
                     width: 120,
                       height: 120,
                       child: Image.network('${cart[index]['image']}')),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${cart[index]['name']}',maxLines: 2,overflow: TextOverflow.ellipsis,),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        Text('${cart[index]['price']}',style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
                        IconButton(
                            onPressed: ()
                            {
                              setState(() {
                                cart.remove('${cart[index]}');
                                log('${cart.length}');
                              });
                            },
                            icon: const Icon(Icons.delete,color: Colors.red,)),
                      ],
                    ),
                  ),
                ],
              ),
              itemCount: cart.length,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: MaterialButton(
                  padding: const EdgeInsets.all(10),
                  onPressed: () {},
                  color: Colors.orange,
                  child: const Text(
                    'Buy Now',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
