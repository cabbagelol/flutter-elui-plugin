/**
 * 房源列表
 */

import 'package:flutter/material.dart';

class HousingList extends StatefulWidget {
  final String title;
  final List data;
  final onTap;

  HousingList({Key key, this.title, @required this.data, this.onTap})
      : super(key: key);

  @override
  _HousingListState createState() => _HousingListState();
}

class _HousingListState extends State<HousingList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        ListView.builder(
          itemCount: widget.data == null ? 0 : widget.data.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                color: Color(0xfff2f2f2),
                padding: EdgeInsets.only(bottom: 1),
                child: Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6.0),
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: (widget.data[index]["rhiUrl"] != null)
                                    ? NetworkImage(
                                        'https://figure.kjwangluo.com/${widget.data[index]["rhiUrl"]}?imageView2/1/w/200/h/200/interlace/1')
                                    : AssetImage('assets/images/bk-cover.png')),
                          ),
                          width: 100,
                          height: 100,
                        ),
                        Container(
                          width: 215,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${widget.data[index]["rhTitle"] ??= "房源标题"}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '${widget.data[index]["rhName"] ?? "房源名称"}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    ' | ',
                                    style: TextStyle(color: Color(0xff999999)),
                                  ),
                                  Text(
                                      '${widget.data[index]["rhAcreage"] ??= '0'}m²',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400))
                                ],
                              ),
                              Text(
                                '${widget.data[index]["rhAddress"] ??= "房源地址"}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '${widget.data[index]["rhtPrice"] ?? 0}',
                                    style: TextStyle(
                                        color: Color(0xfffff57433),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    '元/月',
                                    style: TextStyle(
                                        color: Color(0xfffff57433),
                                        fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(left: 20),
                        )
                      ],
                    )),
              ),
              onTap: () {
                widget.onTap({'value': widget.data[index]});
              },
            );
          },
        )
      ],
    ));
  }
}
