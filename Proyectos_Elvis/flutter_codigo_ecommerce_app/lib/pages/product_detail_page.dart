import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
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
          "Detalle del producto",
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
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.09),
                      offset: Offset(0, 7),
                      blurRadius: 10)
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/d131fe3f1f154d369ae2a9f900fc71ee_9366/Zapatillas_Nite_Jogger_Blanco_BD7676_04_standard.jpg")),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Adidas",
                    style: TextStyle(color: Colors.black54, fontSize: 20.0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 5.0),
                  child: Text(
                    "NITE JOGGER",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: Colors.black87,
                  size: 22,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "S./ 999.00",
                    style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffd3d3d3),
                            borderRadius: BorderRadius.circular(14)),
                        child: Icon(
                          CupertinoIcons.minus,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xfff2f2f2),
                            borderRadius: BorderRadius.circular(14)),
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xff222831),
                            borderRadius: BorderRadius.circular(14)),
                        child: Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Descripción general",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Inspiradas en las Nite Jogger de 1976, estas zapatillas irradian un estilo retro con sus detalles reflectantes. El exterior de malla y nylon antidesgarre está adornado con revestimientos de gamuza. La mediasuela Boost mejorada te ofrece una pisada más cómoda en todo momento. Inspiradas en las Nite Jogger de 1976, estas zapatillas irradian un estilo retro con sus detalles reflectantes. El exterior de malla y nylon antidesgarre está adornado con revestimientos de gamuza. La mediasuela Boost mejorada te ofrece una pisada más cómoda en todo momento."
                      "Inspiradas en las Nite Jogger de 1976, estas zapatillas irradian un estilo retro con sus detalles reflectantes. El exterior de malla y nylon antidesgarre está adornado con revestimientos de gamuza. La mediasuela Boost mejorada te ofrece una pisada más cómoda en todo momento. Inspiradas en las Nite Jogger de 1976, estas zapatillas irradian un estilo retro con sus detalles reflectantes. El exterior de malla y nylon antidesgarre está adornado con revestimientos de gamuza. La mediasuela Boost mejorada te ofrece una pisada más cómoda en todo momento.",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
