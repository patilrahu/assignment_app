import 'package:assignment_app/helper/shared_prefernce_helper.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> getAllImages = [];
  @override
  void initState() {
    super.initState();
    final imagesData = SharedPrefernceHelper.customSharedPreferences
        .getValue<List<String>>(SharedPrefernceHelper.saveListofImage);
    if (imagesData != null) {
      setState(() {
        getAllImages.addAll(imagesData);
      });
    } else {
      print('data fetch failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            title: const Text(
              'Images History',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            )),
        body: getAllImages.isEmpty
            ? const Center(
                child: SizedBox(
                    height: 50, width: 50, child: CircularProgressIndicator()),
              )
            : ListView.builder(
                itemCount: getAllImages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          margin: const EdgeInsets.all(20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              getAllImages[index],
                              fit: BoxFit.contain,
                              height: 200,
                            ),
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton(
                            onPressed: () {
                              SharedPrefernceHelper.customSharedPreferences
                                  .saveValue(
                                      SharedPrefernceHelper.saveListofImage,
                                      [getAllImages[index]]);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black, elevation: 0),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              ],
                            )),
                      )
                    ],
                  );
                },
              ));
  }
}
