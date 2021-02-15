import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/components/searchbar.dart';
import 'package:task_manager/components/taskcard.dart';
import 'package:task_manager/controller/taskcontroller.dart';

int currentIndex = 0;
TaskController _controller = Get.put(TaskController());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //LIFECYCLE
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[200],
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 8,
              backgroundImage: NetworkImage(
                'https://cdn.dribbble.com/users/4189231/avatars/normal/beac5382e2629adcd8f3bdfa68994fe5.jpg?1570110577',
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Get.snackbar('Actions', 'Shows a Menu',
                    snackPosition: SnackPosition.BOTTOM);
              },
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              Text('Hello, Jessika!'),
              Text('You\'ve got 8 tasks today'),
              Expanded(
                flex: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: SearchBar(),
                ),
              ),
              Expanded(
                flex: 80,
                child: Column(
                  children: [
                    Text('Today'),
                    Expanded(
                      child: PageView.builder(
                        allowImplicitScrolling: true,
                        onPageChanged: _controller.selectedTodayTaskIndex,
                        controller: _controller.pageController,
                        itemCount: taskList.length,
                        itemBuilder: (context, index) => Obx(
                          () => TaskCard(
                            taskList[index],
                            // ignore: unrelated_type_equality_checks
                            _controller.selectedTodayTaskIndex == index
                                ? true
                                : false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 100,
                child: Column(
                  children: [
                    Text('Tomorrow'),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        controller: _controller.pageController,
                        itemCount: taskList.length,
                        itemBuilder: (context, index) => Obx(
                          () => TaskCard(
                            taskList[index],
                            // ignore: unrelated_type_equality_checks
                            _controller.selectedTodayTaskIndex == index
                                ? true
                                : false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
