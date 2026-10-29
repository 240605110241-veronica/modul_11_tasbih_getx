import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/tasbih_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final TasbihController controller =
    Get.put(TasbihController());

    return Scaffold(
      backgroundColor:
      const Color.fromARGB(255, 119, 210, 145),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'TASBIH DIGITAL',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),

              Obx(
                    () => Text(
                  '${controller.counter.value.round()}',
                  style: const TextStyle(
                    fontSize: 150,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Obx(
                      () => Column(
                    children: [
                      LinearProgressIndicator(
                        value:
                        controller.progress.value / 100,
                        backgroundColor: Colors.white54,
                        color: Colors.amberAccent.shade400,
                        minHeight: 15,
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${controller.counter.value.round()} '
                            '/ ${controller.maxCount.toInt()}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 60),

              ClipRRect(
                borderRadius:
                BorderRadius.circular(50),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: controller.incrementCounter,
                    borderRadius:
                    BorderRadius.circular(50),
                    child: const Padding(
                      padding: EdgeInsets.all(30),
                      child: Icon(
                        Icons.fingerprint,
                        size: 100,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                'Tekan untuk menghitung tasbih',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: controller.resetCounter,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.refresh_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
