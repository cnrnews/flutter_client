import 'package:flutter/material.dart';
import 'package:app/widget/frosted_glass_demo.dart';
import 'package:app/widget/wrap_widget.dart';
import 'package:app/widget/expansion_panel_list.dart';
import 'package:app/widget/clipPathWidget.dart';
import 'package:app/widget/draggble_demo.dart';
import 'package:app/widget/flutter_tooltip.dart';
import 'package:app/widget/listview_widget.dart';
import 'package:app/widget/meeting_listview_demo.dart';
import 'package:app/widget/boxdecoration.dart';
import 'package:app/widget/richtext.dart';
import 'package:app/widget/text.dart';
import 'package:app/widget/size_box.dart';
import 'package:app/widget/gridview_widget.dart';
import 'package:app/widget/pageview.dart';
import 'package:app/widget/sliver.dart';
import 'package:app/widget/widget_button.dart';
import 'package:app/widget/widget_input.dart';
import 'package:app/widget/dialog_demo.dart';
import 'package:app/widget/detail.dart';
import 'package:app/widget/draggable_widget.dart';
List<SettingItem> items = [
  SettingItem('毛玻璃', new FrostedGlassWidget()),
  SettingItem('Wrap布局', new WrapWidget()),
  SettingItem('菜单管理', new ExpansionPanelListWidget()),
  SettingItem('贝塞尔曲线', new ClipperWidget()),
  SettingItem('ToolTip控件', new ToolTipDemo()),
  SettingItem('Draggable控件', new DraggableDemo()),
  SettingItem('ListViewWidget', new ListViewWidget()),
  SettingItem('GridViewWidget', new GridViewWidget()),
  SettingItem('会议列表', new MeetingListViewWidget()),
  SettingItem('BoxDecoration', new BoxDecorationWidget()),
  SettingItem('行内多样式文本', new RichTextDemo()),
  SettingItem('行内多样式文本2', new TextDemo()),
  SettingItem('固定尺寸', new SizeBoxDemo()),
  SettingItem('PageView', new PageViewDemo()),
  SettingItem('Sliver', new SliverDemo()),
  SettingItem('Flutter Button', new WidgetButton()),
  SettingItem('输入组件', new InputWidgetDemo()),
  SettingItem('弹出框', new DialogDemo()),
  SettingItem('detail', new PagerDetail()),
  SettingItem('DraggableWidget', new DraggableWidget()),
  
];
const searchList = ["jiejie-大长腿", "jiejie-水蛇腰", "gege1-帅气欧巴", "gege2-小鲜肉"];
const recentSuggest = ["推荐-1", "推荐-2"];
class Picture {
  String title;
  String url;
  String click;
  String address;
  String date;
  String detail;
  List<String> tag;
  Picture(this.title, this.url, this.click, this.address, this.date, this.tag,this.detail);
}

List posts = [
  Picture(
      '行人天桥海滩',
      'https://goss.veer.com/creative/vcg/veer/800water/veer-319939578.jpg',
      '12',
      '杭州云栖小镇国际会展中心',
      '2019-04-26 08:00 至 2019-04-28 18:00',
      List()..add('心里沙龙')..add('技术讲座'),
      "栀子花（学名：Gardenia jasminoides），又名栀子、黄栀子。属双子叶植物纲、茜草科、栀子属常绿灌木，枝叶繁茂，叶色四季常绿，花芳香，是重要的庭院观赏植物。单叶对生或三叶轮生，叶片倒卵形，革质，翠绿有光泽。浆果卵形，黄色或橙色。除观赏外，其花、果实、叶和根可入药，有泻火除烦，清热利尿，凉血解毒之功效。花可做茶之香料，果实可消炎祛热。是优良的芳香花卉。栀子花喜光照充足且通风良好的环境，但忌强光曝晒。宜用疏松肥沃、排水良好的酸性土壤种植。可用扦插、压条、分株或播种繁殖。"),
  Picture(
      '在一个码头的木小屋在热带海',
      'https://goss.veer.com/creative/vcg/veer/800water/veer-305087837.jpg',
      '32',
      '杭州云栖小镇国际会展中心',
      '2019-04-26 08:00 至 2019-04-28 18:00',
      List()..add('技术论坛')..add('技术讲座'),
      "栀子花（学名：Gardenia jasminoides），又名栀子、黄栀子。属双子叶植物纲、茜草科、栀子属常绿灌木，枝叶繁茂，叶色四季常绿，花芳香，是重要的庭院观赏植物。单叶对生或三叶轮生，叶片倒卵形，革质，翠绿有光泽。浆果卵形，黄色或橙色。除观赏外，其花、果实、叶和根可入药，有泻火除烦，清热利尿，凉血解毒之功效。花可做茶之香料，果实可消炎祛热。是优良的芳香花卉。栀子花喜光照充足且通风良好的环境，但忌强光曝晒。宜用疏松肥沃、排水良好的酸性土壤种植。可用扦插、压条、分株或播种繁殖。"),
  Picture(
      '躺在木地板上的黄色拉布拉多猎犬狗',
      'https://goss.veer.com/creative/vcg/veer/800water/veer-313611935.jpg',
      '32',
      '杭州云栖小镇国际会展中心',
      '2019-04-26 08:00 至 2019-04-28 18:00',
      List()..add('技术论坛')..add('科学讲座'),"栀子花（学名：Gardenia jasminoides），又名栀子、黄栀子。属双子叶植物纲、茜草科、栀子属常绿灌木，枝叶繁茂，叶色四季常绿，花芳香，是重要的庭院观赏植物。单叶对生或三叶轮生，叶片倒卵形，革质，翠绿有光泽。浆果卵形，黄色或橙色。除观赏外，其花、果实、叶和根可入药，有泻火除烦，清热利尿，凉血解毒之功效。花可做茶之香料，果实可消炎祛热。是优良的芳香花卉。栀子花喜光照充足且通风良好的环境，但忌强光曝晒。宜用疏松肥沃、排水良好的酸性土壤种植。可用扦插、压条、分株或播种繁殖。"),
  Picture(
      '太阳在日落期间在山上设置光线',
      'https://goss.veer.com/creative/vcg/veer/800water/veer-313612836.jpg',
      '22',
      '杭州云栖小镇国际会展中心',
      '2019-04-26 08:00 至 2019-04-28 18:00',
      List()..add('知识演讲')..add('技术讲座'),
      "栀子花（学名：Gardenia jasminoides），又名栀子、黄栀子。属双子叶植物纲、茜草科、栀子属常绿灌木，枝叶繁茂，叶色四季常绿，花芳香，是重要的庭院观赏植物。单叶对生或三叶轮生，叶片倒卵形，革质，翠绿有光泽。浆果卵形，黄色或橙色。除观赏外，其花、果实、叶和根可入药，有泻火除烦，清热利尿，凉血解毒之功效。花可做茶之香料，果实可消炎祛热。是优良的芳香花卉。栀子花喜光照充足且通风良好的环境，但忌强光曝晒。宜用疏松肥沃、排水良好的酸性土壤种植。可用扦插、压条、分株或播种繁殖。"),
  Picture(
      '太阳从山上升起',
      'https://goss.veer.com/creative/vcg/veer/800water/veer-315343289.jpg',
      '42',
      '杭州云栖小镇国际会展中心',
      '2019-04-26 08:00 至 2019-04-28 18:00',
      List()..add('知识演讲')..add('线下交流'),
      "栀子花（学名：Gardenia jasminoides），又名栀子、黄栀子。属双子叶植物纲、茜草科、栀子属常绿灌木，枝叶繁茂，叶色四季常绿，花芳香，是重要的庭院观赏植物。单叶对生或三叶轮生，叶片倒卵形，革质，翠绿有光泽。浆果卵形，黄色或橙色。除观赏外，其花、果实、叶和根可入药，有泻火除烦，清热利尿，凉血解毒之功效。花可做茶之香料，果实可消炎祛热。是优良的芳香花卉。栀子花喜光照充足且通风良好的环境，但忌强光曝晒。宜用疏松肥沃、排水良好的酸性土壤种植。可用扦插、压条、分株或播种繁殖。"),
       Picture(
      '行人天桥海滩',
      'https://goss.veer.com/creative/vcg/veer/800water/veer-319939578.jpg',
      '12',
      '杭州云栖小镇国际会展中心',
      '2019-04-26 08:00 至 2019-04-28 18:00',
      List()..add('心里沙龙')..add('技术讲座'),
      "栀子花（学名：Gardenia jasminoides），又名栀子、黄栀子。属双子叶植物纲、茜草科、栀子属常绿灌木，枝叶繁茂，叶色四季常绿，花芳香，是重要的庭院观赏植物。单叶对生或三叶轮生，叶片倒卵形，革质，翠绿有光泽。浆果卵形，黄色或橙色。除观赏外，其花、果实、叶和根可入药，有泻火除烦，清热利尿，凉血解毒之功效。花可做茶之香料，果实可消炎祛热。是优良的芳香花卉。栀子花喜光照充足且通风良好的环境，但忌强光曝晒。宜用疏松肥沃、排水良好的酸性土壤种植。可用扦插、压条、分株或播种繁殖。"),
  Picture(
      '在一个码头的木小屋在热带海',
      'https://goss.veer.com/creative/vcg/veer/800water/veer-305087837.jpg',
      '32',
      '杭州云栖小镇国际会展中心',
      '2019-04-26 08:00 至 2019-04-28 18:00',
      List()..add('技术论坛')..add('技术讲座'),"栀子花（学名：Gardenia jasminoides），又名栀子、黄栀子。属双子叶植物纲、茜草科、栀子属常绿灌木，枝叶繁茂，叶色四季常绿，花芳香，是重要的庭院观赏植物。单叶对生或三叶轮生，叶片倒卵形，革质，翠绿有光泽。浆果卵形，黄色或橙色。除观赏外，其花、果实、叶和根可入药，有泻火除烦，清热利尿，凉血解毒之功效。花可做茶之香料，果实可消炎祛热。是优良的芳香花卉。栀子花喜光照充足且通风良好的环境，但忌强光曝晒。宜用疏松肥沃、排水良好的酸性土壤种植。可用扦插、压条、分株或播种繁殖。"),
 Picture(
      '在一个码头的木小屋在热带海',
      'https://goss.veer.com/creative/vcg/veer/800water/veer-305087837.jpg',
      '32',
      '杭州云栖小镇国际会展中心',
      '2019-04-26 08:00 至 2019-04-28 18:00',
      List()..add('技术论坛')..add('技术讲座'),"栀子花（学名：Gardenia jasminoides），又名栀子、黄栀子。属双子叶植物纲、茜草科、栀子属常绿灌木，枝叶繁茂，叶色四季常绿，花芳香，是重要的庭院观赏植物。单叶对生或三叶轮生，叶片倒卵形，革质，翠绿有光泽。浆果卵形，黄色或橙色。除观赏外，其花、果实、叶和根可入药，有泻火除烦，清热利尿，凉血解毒之功效。花可做茶之香料，果实可消炎祛热。是优良的芳香花卉。栀子花喜光照充足且通风良好的环境，但忌强光曝晒。宜用疏松肥沃、排水良好的酸性土壤种植。可用扦插、压条、分株或播种繁殖。"),
 
];

//user_deail.dart----------begin
class DataBean {
  String id;
  String partId;
  String email;
  String username;
  String password;
  String phone;
  String logo;
  String catename;
  String companyname;
  String position;
  String address;
  String area;
  String checkCode;
  String checkTime;
  String checkTelphone;
  String statuses;
  String type;
  String ctime;
  String utime;
  String loginIp;
  String serialno;
  String token;
  String website;
  String profile;
  String signature;
  String dimecode;
  String pid;
  String remark;
  String level;
  String jpush;
  String isLogin;
  String landline;
  String nickname;
  String itype;
  String note;
  DataBean.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        partId = map['part_id'],
        email = map['email'],
        username = map['username'],
        password = map['password'],
        phone = map['phone'],
        logo = map['logo'],
        catename = map['catename'],
        companyname = map['companyname'],
        position = map['position'],
        address = map['address'],
        area = map['area'],
        checkCode = map['email_check_code'],
        checkTime = map['email_check_time'],
        checkTelphone = map['check_telphone'],
        statuses = map['statuses'],
        type = map['type'],
        ctime = map['ctime'],
        utime = map['utime'],
        loginIp = map['login_ip'],
        serialno = map['serialno'],
        token = map['token'],
        website = map['website'],
        profile = map['profile'],
        signature = map['signature'],
        dimecode = map['dimecode'],
        pid = map['pid'],
        remark = map['remark'],
        level = map['level'],
        jpush = map['jpush'],
        isLogin = map['is_login'],
        landline = map['landline'],
        nickname = map['nickname'],
        note = map['note'],
        itype = map['itype'];
}

class BaseResult {
  String msg;
  int code;
  var data;
  BaseResult.fromJson(Map<String, dynamic> map)
      : msg = map['msg'],
        code = map['code'],
        data = map['result'];
  //DataBean.fromJson(map['result']);
}

class AppBaseResult {
  String msg;
  int code;
  var data;
  AppBaseResult.fromJson(Map<String, dynamic> map)
      : msg = map['msg'],
        code = map['code'],
        data = map['data'];
  //DataBean.fromJson(map['result']);
}

//user_deail.dart----------end
//meeting_deail.dart----------start
class MeetingBean {
  String id;
  String status;
  String title;
  String ctime;
  String etime;
  String qtime;
  String address;
  String xxaddress;
  String companypic;
  String companyname;
  String contact;
  String phone;
  String downfile;
  String uid;
  String cid;
  String addtime;
  String scale;
  String isUser;
  String statuses;
  String agenda;
  String guests;
  String guide;
  String brief;
  String isPrivate;
  String partId;
  String file;
  String click;
  MeetingBean.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        ctime = map['ctime'],
        etime = map['etime'],
        qtime = map['qtime'],
        address = map['address'],
        xxaddress = map['xxaddress'],
        companypic = map['companypic'],
        companyname = map['companyname'],
        contact = map['contact'],
        downfile = map['downfile'],
        isUser = map['is_user'],
        isPrivate = map['is_private'],
        click = map['click'],
        phone = map['phone'],
        uid = map['uid'],
        cid = map['cid'],
        addtime = map['addtime'],
        scale = map['scale'],
        statuses = map['statuses'],
        agenda = map['agenda'],
        guests = map['guests'],
        guide = map['guide'],
        brief = map['brief'],
        partId = map['part_id'],
        file = map['file'];
}

class TabTitle {
  String title;
  int id;
  TabTitle(this.title, this.id);
}

//meeting_deail.dart----------end
//wiper_page.dart----------start
class NoteBean {
  String id;
  String title;
  String bullurl;
  String pic;
  String addtime;
  String wxpic;
  String chick;
  String sort;
  String status;
  NoteBean.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        bullurl = map['bullurl'],
        pic = map['pic'],
        addtime = map['addtime'],
        wxpic = map['wxpic'],
        chick = map['chick'],
        sort = map['sort'],
        status = map['status'];
}

class ResultBean {
  String msg;
  int code;
  var data;
  ResultBean.fromJson(Map<String, dynamic> map)
      : msg = map['msg'],
        code = map['code'],
        data = map['result'];
}

//wiper_page.dart----------end
//推送消息
class PushMsg {
  String id;
  String title;
  String content;
  String addtime;
  String type;
  PushMsg.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        content = map['content'],
        addtime = map['addtime'],
        type = map['type'];
}

//用户公告
class Announcement {
  String countstats;
  String title;
  String userId;
  String id;
  String pic;
  String file;
  String bullurl;
  String content;
  String addtime;

  String username;
  String logo;
  String phone;
  String nickname;
  String companyname;

  Announcement.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        userId = map['user_id'],
        countstats = map['countstats'],
        pic = map['pic'],
        file = map['file'],
        bullurl = map['bullurl'],
        content = map['content'],
        addtime = map['addtime'],
        username = map['username'],
        logo = map['logo'],
        phone = map['phone'],
        nickname = map['nickname'],
        companyname = map['companyname'];
}

//关于APP
class AboutAppBean {
  String appVersion;
  String appInfo;
  String appPhone;
  String appUrl;
  String appCompaney;
  String appAddress;
  AboutAppBean.fromJson(Map<String, dynamic> map)
      : appVersion = map['APP_VERSION'],
        appInfo = map['APP_INFO'],
        appPhone = map['APP_PHONE'],
        appUrl = map['APP_URL'],
        appCompaney = map['APP_COMPANY'],
        appAddress = map['APP_ADDRESS'];
}

//设置
class SettingItem {
  String name;
  Widget widget;
  SettingItem(String name, Widget widget) {
    this.name = name;
    this.widget = widget;
  }
}
