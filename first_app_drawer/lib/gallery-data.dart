import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryData extends StatefulWidget {
  final String keyWord;
  GalleryData(this.keyWord);
  @override
  _GalleryDataState createState() => _GalleryDataState();
}

class _GalleryDataState extends State<GalleryData> {
  List<dynamic> data;
  int currentPage = 1;
  int pageSize = 10;
  int totalPages = 0;
  ScrollController _scrollController = new ScrollController();
  dynamic dataGallery;
  List<dynamic> hits = new List();
  getData(url) {
    http.get(url).then((resp) {
      setState(() {
        dataGallery = json.decode(resp.body);
        hits = dataGallery['hits'];
        if (dataGallery['totalHits'] % this.pageSize == 0)
          this.totalPages = dataGallery['totalHits'] ~/ this.pageSize;
        else
          this.totalPages =
              1 + (dataGallery['totalHits'] / this.pageSize).floor();
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    this.loadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          ++currentPage;
          this.loadData();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void loadData() {
    String url = 'https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b' +
        '707d0429&q=${widget.keyWord}&'+
        'page=$currentPage&per_page=$pageSize';
    print(url);
    this.getData(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.keyWord}, Page $currentPage/$totalPages'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: (dataGallery == null)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dataGallery == null ? 0 : dataGallery.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              hits[index]['tags'],
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Image.network(
                          hits[index]['webformatURL'],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
    );
  }
}
