import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app/utils/utils.dart';
import 'package:app/data/asset.dart';

class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<SwiperPage> {
  var dataLi = <NoteBean>[];
  _loadMeetingAdvert() async {
    var api = 'https://xh.2188.com.cn/app/Advert?format=json';
    var param = {};
    try {
      final response = await http.post(api, body: param);
      if (response.statusCode == 200) {
        var result = ResultBean.fromJson(json.decode(response.body)['data']);
        List data = result.data;
        for (int i = 0; i < data.length; i++) {
          dataLi.add(NoteBean.fromJson(data[i]));
        }
        return dataLi;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadMeetingAdvert().then((bean) {
      setState(() {
        dataLi = bean;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (dataLi.length==0) {
      return Container();
    }
    return new Swiper(
      itemBuilder: _swiperBuilder,
      itemCount: dataLi.length,
      itemWidth: 600.0,
      itemHeight: 140.0,
       autoplay: true,
      layout: SwiperLayout.STACK,
    );
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: (Image.network(
        new Utils().parseImageUrl(dataLi[index].pic),
        fit: BoxFit.fill,
      )),
    );
  }
}
