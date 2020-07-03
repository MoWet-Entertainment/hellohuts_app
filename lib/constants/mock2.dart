import 'package:hellohuts_app/models/test.dart';

class Mock2 {
  static var list = [


{
"post_title": "An interior designer decorates her bedroom following a novel design approch An interior designer decorates her bedroom following a novel design approch",
"post_description": "Nondisp fx of lateral end r clavicle, subs for fx w nonunion",
"post_image": "http://dummyimage.com/459x300.bmp/dddddd/000000",
"posted_user": "Adrianna Mensler",
"posted_user_title": "Graphic Designer",
"posted_date": "5/3/2020",
"post_category": "Kids",
"user_avatar": "https://robohash.org/consecteturmagninumquam.jpg?size=50x50&set=set1",
"user_liked":"true"
},
{
"post_title": "Expert tips in Designing your home",
"post_description": "Poisn by crbnc-anhydr inhibtr,benzo/oth diuretc, asslt, init",
"post_image": "http://dummyimage.com/499x300.png/ff4444/ffffff",
"posted_user": "Fernande Petrashkov",
"posted_user_title": "Information Systems Manager",
"posted_date": "5/17/2020",
"post_category": "Shoes",
"user_avatar": "https://robohash.org/accusamusetvoluptas.bmp?size=50x50&set=set1",
"user_liked":"false"
},
{
"post_title": "Seize compelling e-business",
"post_description": "Malignant neoplasm of vulva",
"post_image": "http://dummyimage.com/492x300.png/ff4444/ffffff",
"posted_user": "Haydon Hazlehurst",
"posted_user_title": "Senior Sales Associate",
"posted_date": "3/20/2020",
"post_category": "Kids",
"user_avatar": "https://robohash.org/consecteturnumquamquidem.png?size=50x50&set=set1",
"user_liked":"false"
},
{
"post_title": "Stilize enterprise functionalities",
"post_description": "Disp fx of neck of scapula, l shldr, subs for fx w nonunion",
"post_image": "http://dummyimage.com/484x300.bmp/cc0000/ffffff",
"posted_user": "Dylan MacLennan",
"posted_user_title": "Clinical Specialist",
"posted_date": "5/30/2020",
"post_category": "Computers",
"user_avatar": "https://robohash.org/autipsaquidem.png?size=50x50&set=set1",
"user_liked":"true"
},
{
"post_title": "Orchestrate dynamic deliverables",
"post_description": "Other intraarticular fracture of lower end of right radius",
"post_image": "http://dummyimage.com/487x300.png/cc0000/ffffff",
"posted_user": "Leilah Priestley",
"posted_user_title": "Chief Design Engineer",
"posted_date": "6/24/2020",
"post_category": "Health",
"user_avatar": "https://robohash.org/magnamnecessitatibusnon.png?size=50x50&set=set1",
"user_liked":"true"
},
{
"post_title": "transition one-to-one web services",
"post_description": "Milt op involving fragments from munitions, milt, subs",
"post_image": "http://dummyimage.com/444x300.png/5fa2dd/ffffff",
"posted_user": "Jonah Attwooll",
"posted_user_title": "Food Chemist",
"posted_date": "6/18/2020",
"post_category": "Health",
"user_avatar": "https://robohash.org/illumdoloreseos.png?size=50x50&set=set1",
"user_liked":"false"
},
{
"post_title": "architect holistic markets",
"post_description": "Postprocedural subglottic stenosis",
"post_image": "http://dummyimage.com/456x300.jpg/5fa2dd/ffffff",
"posted_user": "Axe Yeld",
"posted_user_title": "Safety Technician I",
"posted_date": "3/18/2020",
"post_category": "Automotive",
"user_avatar": "https://robohash.org/etetquis.jpg?size=50x50&set=set1",
"user_liked":"false"
},
{
"post_title": "utilize scalable portals",
"post_description": "Aggressive periodontitis, unspecified",
"post_image": "http://dummyimage.com/435x300.jpg/dddddd/000000",
"posted_user": "Ari Di Bartolommeo",
"posted_user_title": "Data Coordiator",
"posted_date": "6/16/2020",
"post_category": "Automotive",
"user_avatar": "https://robohash.org/necessitatibussequivoluptates.png?size=50x50&set=set1",
"user_liked":"true"
},
{
"post_title": "optimize enterprise mindshare",
"post_description": "Pnctr w/o fb of unsp frnt wl of thrx w/o penet thor cav,subs",
"post_image": "http://dummyimage.com/474x300.png/cc0000/ffffff",
"posted_user": "Stacy Harwell",
"posted_user_title": "Financial Analyst",
"posted_date": "2/10/2020",
"post_category": "Tools",
"user_avatar": "https://robohash.org/incidunttotamnam.png?size=50x50&set=set1",
"user_liked":"false"
},
{
"post_title": "deliver e-business models",
"post_description": "Oth injury of unspecified middle and inner ear, subs encntr",
"post_image": "http://dummyimage.com/411x300.bmp/5fa2dd/ffffff",
"posted_user": "Sharity Ockenden",
"posted_user_title": "Media Manager III",
"posted_date": "2/25/2020",
"post_category": "Shoes",
"user_avatar": "https://robohash.org/rerummagnamitaque.jpg?size=50x50&set=set1",
"user_liked":"false"
},
{
"post_title": "whiteboard user-centric functionalities",
"post_description": "Pregnancy related renal disease, second trimester",
"post_image": "http://dummyimage.com/442x300.png/cc0000/ffffff",
"posted_user": "Candide Olech",
"posted_user_title": "Dental Hygienist",
"posted_date": "6/13/2020",
"post_category": "Games",
"user_avatar": "https://robohash.org/odioperferendisaspernatur.jpg?size=50x50&set=set1",
"user_liked":"true"
},
  ];
}

void main() {
  List<FeedModel> list = [];
  final jsonVal = Mock2.list;

  for (var model in jsonVal) {
    var temp = FeedModel.fromJson(model);
    list.add(temp);
  }

  print("Length of the list is: ${list.length}");
}
