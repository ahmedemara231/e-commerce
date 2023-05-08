import 'dart:developer';
import 'package:flutter/material.dart';
List cart = [];
class ItemDetails extends StatefulWidget {
  Map<String,dynamic> itemModel;
   ItemDetails({Key? key,
    required this.itemModel
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
   int cartLength = cart.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16),
            child: Text('Cart : $cartLength',
              style: const TextStyle(
                  color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: ()
            {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${widget.itemModel['image']}'),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${widget.itemModel['price']}',
                style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${widget.itemModel['description']}',
                style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400
              ),),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: ()
                  {
                    cart.add(widget.itemModel);
                    log('${cart.length}');
                    setState(() {
                      cartLength ++;
                    });
                  },
                  color: Colors.yellow[600],
                  child: const Text('Add to cart',style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  ),),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.orange,
                  child: const Text(
                    'Buy Now',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
