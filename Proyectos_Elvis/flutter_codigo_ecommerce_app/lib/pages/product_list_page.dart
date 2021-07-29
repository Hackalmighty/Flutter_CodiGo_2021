import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_ecommerce/models/brand_model.dart';
import 'package:flutter_codigo_ecommerce/pages/product_detail_page.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListStatePage createState() => _ProductListStatePage();
}

class _ProductListStatePage extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff383838),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Lista de productos",
          style: TextStyle(
            color: Color(0xff383838),
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        actions: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Icon(
                  CupertinoIcons.cart,
                ),
              ),
              Positioned(
                top: 9,
                right: 6,
                child: Container(
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.redAccent),
                  child: Text(
                    "+9",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          IconButton(icon: Icon(CupertinoIcons.person), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 0.99,
              children: [1, 2, 3, 4, 5, 6, 7, 8]
                  .map(
                    (e) => GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailPage()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Color(0xff222831),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14.0),
                                  topRight: Radius.circular(14.0),
                                  bottomRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/d131fe3f1f154d369ae2a9f900fc71ee_9366/Zapatillas_Nite_Jogger_Blanco_BD7676_04_standard.jpg")),
                              ),
                            ),
                            SizedBox(height: 3.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Adidas",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0),
                                    ),
                                    Text(
                                      "NITE JOGGER",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "S/. 999.00",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Icon(
                                  CupertinoIcons.add,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
