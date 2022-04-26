import 'package:cashrich_demo/model/bitcoin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final BitCoinModel model;
  ListItem({Key? key, required this.model}) : super(key: key);

  DateFormat format = DateFormat("dd-MM-yyyy hh:mm a");

  @override
  Widget build(BuildContext context) {
    bool isNegative = model.quote!.uSD!.percentChange24h < 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    "${model.name}",
                    style: const TextStyle(
                      color: Color(0xffd7c736),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      horizontalTitleGap: 0,
                      title: Text(
                        double.parse(model.quote!.uSD!.percentChange24h.toString()).toStringAsFixed(2),
                        style: TextStyle(
                          color: isNegative ? Colors.red : Colors.green,
                        ),
                      ),
                      leading: Icon(
                        isNegative ? Icons.arrow_downward : Icons.arrow_upward,
                        color: isNegative ? Colors.red : Colors.green,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xff363333),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "${model.symbol}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    "Price: \$${double.parse(model.quote!.uSD!.price.toString()).toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "${model.cmcRank}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    model.name!,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Tags"),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: model.tags!.length,
                                      itemBuilder: (c, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            height: 30,
                                            padding: const EdgeInsetsDirectional.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(model.tags![index]),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Last Price Upated",
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  format.format(
                                    DateTime.parse(model.lastUpdated!),
                                  ),
                                  style:
                                      const TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xffd7c736),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Close",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffd7c736),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
