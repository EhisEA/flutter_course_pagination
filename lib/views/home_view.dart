import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_course_pagination/models/passager.dart';
import 'package:flutter_course_pagination/services/service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // to indicate communication with server
  bool isLoading = false;
  // hold items gotten from server
  List<PassengerDataModel> items = [];
  // for tracking page
  int page = 0;
  // for monitoring scrolling
  ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !isLoading) {
        getData();
        print("ended page is stil $page}");
      }
      // current position
      // print(_scrollController.position.pixels);
      // minmum position
      // print(_scrollController.position.minScrollExtent);
      //maximum position
      // print(_scrollController.position.maxScrollExtent);
    });
    getData();
  }

  getData() async {
    //indicat that it getting data
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isLoading = true;
    });
    print(page);
    //get list from server
    List<PassengerDataModel> newItems = await ApiService().getItems(page: page);
    //add the item to list thats is been used by UI
    items.addAll(newItems);
    //set page number to next page
    page = ++page;
    //alternative
    // page += 1;
    // indicate that it done getting data
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: getData,
          icon: const Icon(Icons.get_app),
        )
      ]),
      // backgroundColor: Colors.black,

      body: isLoading && items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : items.isEmpty
              ? const Center(
                  child: Text("No Data"),
                )
              : ListView.builder(
                  // controller: _scrollController,
                  itemCount: items.length + 1,
                  itemBuilder: (context, index) {
                    if ((items.length == index)) {
                      getData();
                      return const Center(child: CircularProgressIndicator());
                    }

                    return ListTile(
                      title: Text(
                        "$index ${items[index].name}",
                      ),
                    );
                  }),
    );
  }
}
