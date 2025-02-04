import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mymodel.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  //final TextEditingController _search=TextEditingController();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                size: 30,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/profile.jpg',
                ),
                radius: 20,
              )
            ],
          ),
        ),
        body: SafeArea(
            child: Stack(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Consumer<MyModel>(
                      builder: (context, item, child) {
                        return TextField(
                          //controller: _search,
                          onChanged: (text) {
                            item.search(text);
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 20,
                              ),
                              prefixIconConstraints: BoxConstraints(
                                maxHeight: 20,
                                minWidth: 30,
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Text(
                      'All ToDos',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Consumer<MyModel>(builder: (context, item, child) {
                    return Expanded(
                      child: ListView(
                        children: item.searched.reversed
                            .map((toDo) => ListItem(text: toDo, myitem: item))
                            .toList(),
                      ),
                    );
                  })
                ],
              )),
          Consumer<MyModel>(builder: (context, item, child) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      flex: 6,
                      child: Container(
                        margin:
                            EdgeInsets.only(bottom: 20, right: 15, left: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0,
                              )
                            ]),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: InputBorder.none,
                              hintText: 'Add item',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )),
                        ),
                      )),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.only(
                        bottom: 21,
                        right: 10,
                      ),
                      child: IconButton(
                        onPressed: () {
                          item.add_todo(_controller.text);
                          _controller.clear();
                        },
                        icon: Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          })
        ])),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final text;
  final myitem;

  ListItem({super.key, required this.text, required this.myitem});

  @override
  Widget build(BuildContext context) {
    var icon = Icons.check_box_outline_blank;
    var text_style = TextStyle();
    if (myitem.completed.contains(text)) {
      icon = Icons.check_box;
      text_style = TextStyle(decoration: TextDecoration.lineThrough);
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Card(
        margin: EdgeInsets.all(0),
        child: ListTile(
          onTap: () {},
          leading: IconButton(
            onPressed: () {
              if (!myitem.completed.contains(text)) {
                myitem.finished(text);
              } else {
                myitem.unfinished(text);
              }
            },
            icon: Icon(
              icon,
              color: Colors.blue,
            ),
          ),
          title: Text(text, style: text_style),
          trailing: IconButton(
            onPressed: () {
              myitem.delete(text);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
