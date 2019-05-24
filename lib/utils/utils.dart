import 'package:flutter/material.dart';
import 'package:app/widget/custome_router.dart';
import 'package:intl/intl.dart';
//公共方法
class Utils {
  //解析会议图片
  parseImageUrl(String url) {
    String imgUrl= "https://xh.2188.com.cn" +
        url.replaceAll("[\"", "").replaceAll("\"]", "").replaceAll("\\", "");
    return imgUrl;
  }
  //会议状态
   meetingStatus(String status) {
    // /((1:待签到;2:审核拒绝;3:审核中;4:参会中;5:已结束))
    String meetingStatus = "审核中";
    if (status == "1") {
      meetingStatus = "待签到";
    } else if (status == "2") {
      meetingStatus = "审核拒绝";
    } else if (status == "3") {
      meetingStatus = "审核中";
    } else if (status == "4") {
      meetingStatus = "参会中";
    } else if (status == "5") {
      meetingStatus = "已结束";
    }
    return meetingStatus;
  }
  pushOtherPage(BuildContext context,Widget widget)
  {
    Navigator.of(context).push(CustomRoute(widget));
  }
  
  String formatDate(timestamp) {
    // var create = new DateTime.fromMicrosecondsSinceEpoch(int.parse(date)*100);
    //  print(create); HH:mm a
     var now = new DateTime.now();
    var format = new DateFormat('yyyy-MM-dd');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';
    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {

        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }
    return time;
  }
}
