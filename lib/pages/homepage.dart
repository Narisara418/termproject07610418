

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termproject07610418/model/setdata.dart';
import 'package:termproject07610418/pages/shop_detail_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _isLoading = false;
  late PageController _pageController;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Sweet Shop'),),
      body: Stack(
        children: [
          ListView.builder(
      padding: EdgeInsets.symmetric(
      horizontal: screenWidth > 600 ? (screenWidth - 650) / 2 : 8.0,
      vertical: screenWidth > 600 ? 16.0 : 8.0,
    ),
            itemCount: SweetShop.length,
            itemBuilder: (context, index) {
              return (index==0)
              ? Image.asset('assets/images/img1.png', width: 20.0)
              : _buildListItem(context, index-1);
            },
          ),
          if (_isLoading)
            const Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
  Widget _buildListItem(BuildContext context, int index) {
    var sweetShop = SweetShop[index];

    return Card(
      color: Colors.deepOrange.shade50,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      shadowColor: Colors.black.withOpacity(0.2),
      child: InkWell(
        onTap: () {
          _handleClickItem(index);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 100.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                sweetShop.LogoSweetshop,
                width: 150.0,
                height: 150.0,
                fit: BoxFit.scaleDown,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          sweetShop.NameSweetshop,
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          sweetShop.Situation,
                          style: TextStyle(fontSize: 15.0),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleClickItem(int shopIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Shopdetailpage(shopIndex: shopIndex)),
    );
  }

}
