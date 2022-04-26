import 'package:cashrich_demo/controller/main_controller.dart';
import 'package:cashrich_demo/pages/show_charts.dart';
import 'package:cashrich_demo/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCoins extends StatefulWidget {
  const ListCoins({Key? key}) : super(key: key);

  @override
  State<ListCoins> createState() => _ListCoinsState();
}

class _ListCoinsState extends State<ListCoins> {
  final coinCode = Get.arguments;
  int coins = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff363333),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "CoinRich",
          style: TextStyle(fontSize: 26),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: ListTile(
                    onTap: () {
                      MainController.instance.updateShowPage();
                      setState(() {});
                    },
                    title: const Text(
                      "Show Chart",
                      style: TextStyle(
                        color: Color(0xffd7c736),
                      ),
                    ),
                    leading: Obx(
                      () => Icon(
                        MainController.instance.isList.value ? Icons.pie_chart : Icons.list,
                        color: Color(0xffd7c736),
                      ),
                    ),
                    horizontalTitleGap: 0,
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => Text(
                        "Count: ${MainController.instance.models.length}",
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
            Container(
              child: MainController.instance.isList.value
                  ? Expanded(
                      child: Obx(
                        () => ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: MainController.instance.models.length,
                          itemBuilder: (_, index) {
                            return ListItem(
                              model: MainController.instance.models[index],
                            );
                          },
                        ),
                      ),
                    )
                  : const Expanded(
                      child: ShowChart(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
