import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotify/providers/quotes_providers.dart';
import 'package:flutter/services.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';

class main_screen extends StatelessWidget {
  final quotesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('')));
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Consumer(
            builder: (context, ref, child) {
              final quote = ref.watch(quoteProvider);
              return Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: quotesController,
                            onFieldSubmitted: (val) {
                              ref
                                  .read(quoteProvider.notifier)
                                  .getSearch(val.toLowerCase());
                              quotesController.clear();
                            },
                            decoration: InputDecoration(
                                hintText: 'Search for Quotes',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RaisedButton(
                                        onPressed: () {
                                          ref
                                              .read(quoteProvider.notifier)
                                              .getSearch('age');
                                        },
                                        color: Colors.black,
                                        child: Text(
                                          "Age",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.5,
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          ref
                                              .read(quoteProvider.notifier)
                                              .getSearch('beauty');
                                        },
                                        color: Colors.black,
                                        child: Text(
                                          "Beauty",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.5,
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          ref
                                              .read(quoteProvider.notifier)
                                              .getSearch('car');
                                        },
                                        color: Colors.black,
                                        child: Text(
                                          "Car",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.5,
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          ref
                                              .read(quoteProvider.notifier)
                                              .getSearch('dad');
                                        },
                                        color: Colors.black,
                                        child: Text(
                                          "Dad",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.5,
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          ref
                                              .read(quoteProvider.notifier)
                                              .getSearch('experience');
                                        },
                                        color: Colors.black,
                                        child: Text(
                                          "Experience",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.5,
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          ref
                                              .read(quoteProvider.notifier)
                                              .getSearch('failure');
                                        },
                                        color: Colors.black,
                                        child: Text(
                                          "Failure",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.5,
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          ref
                                              .read(quoteProvider.notifier)
                                              .getSearch('great');
                                        },
                                        color: Colors.black,
                                        child: Text(
                                          "Age",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.5,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  quote.isEmpty
                      ? Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.purple,
                                  ),
                                ),
                                Text('Searching......')
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: quote.length,
                                itemBuilder: (context, index) {
                                  final dat = quote[index];
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Card(
                                      color: Colors.black,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    dat.text,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    dat.author,
                                                    style: TextStyle(
                                                      letterSpacing: 2,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              1.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          IconButton(
                                                            color: Colors.black,
                                                            icon: Icon(
                                                                Icons.share),
                                                            onPressed: () {
                                                              Share.share(
                                                                  dat.text);
                                                            },
                                                          ),
                                                          IconButton(
                                                            color: Colors.black,
                                                            icon: Icon(
                                                                Icons.copy),
                                                            onPressed: () {
                                                              FlutterClipboard
                                                                      .copy(dat
                                                                          .text)
                                                                  .then((value) =>
                                                                      SnackBar(
                                                                          content:
                                                                              Text('Copied')));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Card(),
                                                        Center(
                                                          child: Card(
                                                            color: Colors.grey,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.5),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    dat.categoty
                                                                        .toUpperCase(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            9),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            // quote.isEmpty?Container():quote[0].text='no_data'?Container():Container(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
