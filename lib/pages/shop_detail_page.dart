import 'package:flutter/material.dart';
import 'package:termproject07610418/model/setdata.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Shopdetailpage extends StatefulWidget {
  final int shopIndex;

  const Shopdetailpage({Key? key, required this.shopIndex}) : super(key: key);

  @override
  State<Shopdetailpage> createState() => _FOODDetailPageState();
}

class _FOODDetailPageState extends State<Shopdetailpage> {
  late int _shopIndex;

  @override
  void initState() {
    super.initState();
    _shopIndex = widget.shopIndex;
  }

  @override
  Widget build(BuildContext context) {
    var shopItem = SweetShop[_shopIndex];

    return Scaffold(
      appBar: AppBar(title: Text('${shopItem.NameSweetshop}')),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            shopItem.LogoSweetshop,
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              shopItem.NameSweetshop,
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              shopItem.title,
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                ImageSlideshow(
                  width: double.infinity,
                  height: 300,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,

                  children: [
                    Image.network(
                      shopItem.ImageSweetshop1,
                      width: 400.0,
                      height: 200.0,
                      fit: BoxFit.scaleDown,
                    ),
                    Image.network(
                      shopItem.ImageSweetshop2,
                      width: 400.0,
                      height: 200.0,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },
                  autoPlayInterval: 3000,

                  /// Loops back to first slide.
                  isLoop: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "MenuSignature",
                        style: TextStyle(fontSize: 35.0, color: Colors.red),
                      ),
                    ),
                    Icon(
                      Icons.celebration, // รูปไอคอน
                      size: 60.0, // ขนาดไอคอน
                      color: Colors.pink, // สีไอคอน
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32, bottom: 16),
                      child: Text(
                        shopItem.Menusignature,
                        style: TextStyle(fontSize: 30.0, color: Colors.green),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        shopItem.titleSig,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    )
                  ],
                ),
                ImageSlideshow(
                  width: double.infinity,
                  height: 300,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,

                  children: [
                    Image.network(
                      shopItem.ImageMenu,
                      width: 400.0,
                      height: 400.0,
                      fit: BoxFit.scaleDown,
                    ),
                    Image.network(
                      shopItem.ImageMenu2,
                      width: 400.0,
                      height: 200.0,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },
                  autoPlayInterval: 3000,

                  /// Loops back to first slide.
                  isLoop: true,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Contack'),
                              content: Text(
                                shopItem.contack,
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              actions: [
                                OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'))
                              ],
                            );
                          });
                    });
                  },
                  child: Text("ช่องทางติดต่อ"),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
            if (_shopIndex > 0)
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () => _handleClickButton(-1),
                    label: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('ก่อนหน้า'),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (_shopIndex < SweetShop.length - 1)
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      onPressed: () => _handleClickButton(1),
                      label: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('ถัดไป'),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('เมนู ${_shopIndex + 1}/${SweetShop.length}'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleClickButton(int value) {
    final newIndex = _shopIndex + value;
    if (newIndex < 0 || newIndex > SweetShop.length - 1) return;

    setState(() {
      _shopIndex += value;
    });
  }
}
