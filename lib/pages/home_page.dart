import 'package:cashrich_demo/controller/main_controller.dart';
import 'package:cashrich_demo/pages/list_coin_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  @override
  void initState() {
    Get.put(MainController());
    super.initState();
  }

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
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: textController,
                cursorColor: Colors.white.withOpacity(0.7),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  filled: true,
                  hintText: "Enter Coin Symbol",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const ListCoins(), arguments: textController.text);
                  MainController.instance.getData(textController.text);
                  //textController.text = "";
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffd7c736),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: const [
                      Flexible(
                        child: Center(
                          child: Text(
                            "Search",
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
