import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_ecommerce/models/banner_model.dart';
import 'package:flutter_codigo_ecommerce/models/brand_model.dart';
import 'package:flutter_codigo_ecommerce/pages/product_list_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;

  List<BrandModel> listBrand = [
    BrandModel(
        image:
            "https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/esPE/Images/running-ss21-supernova-launch-hp-teaser-carousel-d_tcm202-629773.jpg",
        id: 1,
        brand: "Adidas"),
    BrandModel(
        image:
            "https://static.nike.com/a/images/f_auto/dpr_3.0/h_500,c_limit/g1ljiszo4qhthfpluzbt/nike-joyride.jpg",
        id: 1,
        brand: "Nike"),
    BrandModel(
        image:
            "https://mk0lanoticiapwmx1x6a.kinstacdn.com/wp-content/uploads/2021/03/thundercats-puma-sneakers-fan.jpg",
        id: 1,
        brand: "Puma"),
    BrandModel(
        image:
            "https://media.sivasdescalzo.com/media/wysiwyg/img-menu/S-Menu-Banner-Converse.jpg",
        id: 1,
        brand: "Converse"),
    BrandModel(
        image:
            "https://www.escapeshoes.com/wp-content/uploads/2019/09/Foto-Destaque-Fila-Disruptor-II.png",
        id: 1,
        brand: "Fila"),
    BrandModel(
        image:
            "https://d1zkmbbkp46fmz.cloudfront.net/tOQ1LZUTIWkzIFQhU7SkMvTyOro=/700x700/e/d/5/3/ed53e27ddb04e56c62c872c8db790b67e35c4a97_Saucony_Jazz_Original_Vintage_Green_Green_S70368_203_sm_1.jpg",
        id: 1,
        brand: "Saucony"),
    BrandModel(
        image:
            "https://www.sneakerfiles.com/wp-content/uploads/2014/03/release-reminder-reebok-question-mid-banner-1.jpg",
        id: 1,
        brand: "Reebok"),
  ];

  List<BannerModel> listBanner = [
    BannerModel(
        id: 1,
        image:
            "https://javashop.es/img/cms/Blog/adidas%20superstar/adidas-originals-shoes-banner.jpg",
        description: "",
        active: true),
    BannerModel(
        id: 2,
        image:
            "https://cdn.denimandcloth.com.au/content/uploads/2014/11/18121834/adidas-banner.jpg",
        description: "",
        active: true),
    BannerModel(
        id: 3,
        image:
            "https://www.getoutsideshoes.com/media/catalog/category/adidas_banner.jpg",
        description: "",
        active: true),
    BannerModel(
        id: 4,
        image:
            "https://cooljsonline.com/wp-content/uploads/2018/10/adidas-banner-nmd-cooljs-1.jpg",
        description: "",
        active: true),
    BannerModel(
        id: 5,
        image:
            "https://cdn.dribbble.com/users/3237629/screenshots/12922403/artboard_1_copy_3_4x.jpg",
        description: "",
        active: true),
    BannerModel(
        id: 6,
        image:
            "https://www.potq.net/wp-content/uploads/2015/03/publipost-banner-2.jpg",
        description: "",
        active: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf6f3),
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff383838),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hola Manolo",
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
            //Buscador
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 15, right: 15),
              child: TextField(
                style: TextStyle(color: Colors.black54, fontSize: 14.0),
                decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Color(0xffe9e3e3e3))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Color(0xffe9e3e3e3))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Color(0xffe9e3e3e3))),
                    hintText: "Qué quieres comprar?",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Colors.black54,
                      size: 20.0,
                    ),
                    fillColor: Color(0xffe9e3e3),
                    filled: true),
              ),
            ),

            // Categorías

            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Categorías",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListPage()));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: Color(0xff222831),
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 4)),
                            ]),
                        child: Image.asset("assets/images/sneakers-2.png"),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Zapatillas",
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Color(0xff222831),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 4)),
                          ]),
                      child: Image.asset("assets/images/tshirt-2.png"),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Ropa",
                      style: TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Color(0xff222831),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 4)),
                          ]),
                      child: Image.asset("assets/images/cap-2.png"),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Accesorios",
                      style: TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
              ],
            ),
            // Mensaje bienvenida
            SizedBox(
              height: 15,
            ),
            Container(
              height: 100,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xfff76a8c),
                    Color(0xfffd3a69),
                  ]),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/image-1.svg",
                    height: 70.0,
                  ),
                  Flexible(
                    child: Text(
                      "Gracias por pertenecer a esta familia, no olvides canjear tu cupón de bienvenida.",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Promociones",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: 180.0,
                  autoPlay: true,
                  onPageChanged: (index, _) {
                    current = index;
                    setState(() {});
                  }),
              items: listBanner.map((banner) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(banner.image),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listBanner.map((e) {
                  int item = listBanner.indexOf(e);
                  return Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    decoration: BoxDecoration(
                      color: current == item
                          ? Color.fromRGBO(0, 0, 0, 0.6)
                          : Color.fromRGBO(0, 0, 0, 0.2),
                      shape: BoxShape.circle,
                    ),
                  );
                }).toList()),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Marcas",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 1,
              children: listBrand
                  .map(
                    (e) => Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(e.image),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Text(
                        e.brand,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold
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
