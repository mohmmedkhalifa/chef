import 'models/ads.dart';
import 'models/message.dart';
import 'models/restaurant.dart';

List<Ads> ads = [
  Ads(
    title: 'مطلوب شيف للعمل',
    dateTime: 'منذ 5 د',
    description: '''يعلن مطعم جولدن عن حاجته لشيف متخصص في الطبخ العربي''',
    imageUrl: 'assets/images/rest1.png',
    owner: 'مطعم جولدن',
    ownerId: 3,
  ),
  Ads(
    title: 'يعلن مطعم العوافي عن حاجته إلى طباخ',
    dateTime: 'منذ 6 د',
    description:
        '''يلعن مطعم العوافي عن حاجته إلى طباخ خبرة لا تقل عن خمس سنوات في مجال الطبخ، يرجى إرسال السيرة الذاتية''',
    imageUrl: 'assets/images/rest2.png',
    owner: 'مطعم العوافي',
    ownerId: 1,
  ),
  Ads(
    title: 'يعلن مطعم العوافي عن حاجته إلى طباخ',
    dateTime: 'منذ 6 د',
    description:
        '''يلعن مطعم العوافي عن حاجته إلى طباخ خبرة لا تقل عن خمس سنوات في مجال الطبخ، يرجى إرسال السيرة الذاتية''',
    imageUrl: 'assets/images/rest2.png',
    owner: 'مطعم العوافي',
    ownerId: 1,
  ),
  Ads(
    title: 'يعلن مطعم العوافي عن حاجته إلى طباخ',
    dateTime: 'منذ 6 د',
    description:
        '''يلعن مطعم العوافي عن حاجته إلى طباخ خبرة لا تقل عن خمس سنوات في مجال الطبخ، يرجى إرسال السيرة الذاتية''',
    imageUrl: 'assets/images/rest2.png',
    owner: 'مطعم العوافي',
    ownerId: 1,
  ),
  Ads(
    title: 'يعلن مطعم العوافي عن حاجته إلى طباخ',
    dateTime: 'منذ 6 د',
    description:
        '''يلعن مطعم العوافي عن حاجته إلى طباخ خبرة لا تقل عن خمس سنوات في مجال الطبخ، يرجى إرسال السيرة الذاتية''',
    imageUrl: 'assets/images/rest2.png',
    owner: 'مطعم العوافي',
    ownerId: 1,
  ),
  Ads(
    title: 'يعلن مطعم العوافي عن حاجته إلى طباخ',
    dateTime: 'منذ 6 د',
    description:
        '''يلعن مطعم العوافي عن حاجته إلى طباخ خبرة لا تقل عن خمس سنوات في مجال الطبخ، يرجى إرسال السيرة الذاتية''',
    imageUrl: 'assets/images/rest2.png',
    owner: 'مطعم العوافي',
    ownerId: 1,
  ),
  Ads(
    title: 'بحاجة إلى شيف على وجه السرعة',
    dateTime: 'منذ 7 د',
    description:
        '''يعلن حمص عكا عن حاجته إلى شيف على وجه السرعة، خبرة متوسطة، يرجى ارسال السيرة الذاتية على الإيميل''',
    imageUrl: 'assets/images/rest3.png',
    owner: 'مطعم حمص عكا',
    ownerId: 7,
  ),
  Ads(
    title: 'مطلوب طباخ يجيد عمل الشاورما',
    dateTime: 'منذ 10 د',
    description:
        '''يعلن مطبخ الأسرة عن حاجته إلى طباخ/طباخة يجيد/تجيد صناعة الشاورما''',
    imageUrl: 'assets/images/rest4.png',
    owner: 'مطبخ الأسرة',
    ownerId: 2,
  ),
  Ads(
    title: 'بحاجة إلى مجموعة من الطباخين',
    dateTime: 'منذ 11 د',
    description:
        '''يعلن فندق الهنا إلى حاجته إلى مجموعة من الطباخين بعدد 6، ذوي خبرة في مجال الطبخ لا تقل عن 3 سنوات، يرجى إرسال السيرة الذاتية على الإيميل''',
    imageUrl: 'assets/images/rest5.png',
    owner: 'مطعم العوافي',
    ownerId: 5,
  ),
  Ads(
    title: 'بحاجة إلى مجموعة من الطباخين',
    dateTime: 'منذ 11 د',
    description:
        '''يعلن فندق الهنا إلى حاجته إلى مجموعة من الطباخين بعدد 6، ذوي خبرة في مجال الطبخ لا تقل عن 3 سنوات، يرجى إرسال السيرة الذاتية على الإيميل''',
    imageUrl: 'assets/images/rest5.png',
    owner: 'مطعم العوافي',
    ownerId: 5,
  ),
  Ads(
    title: 'يعلن مخبز المدينة عن حاجته إلى خباز',
    dateTime: 'منذ 15 د',
    description:
        '''يعلن مخبز المدينة عن حاجته إلى خباز للعمل داخل المخبز بدوام جزئي 8 ساعات''',
    imageUrl: 'assets/images/rest6.png',
    owner: 'مخبز المدينة',
    ownerId: 4,
  ),
  Ads(
    title: 'مطلوب شيف بعدد 2 للعمل داخل فندق',
    dateTime: 'منذ 20 د',
    description:
        '''يعلن فندق النعيم عن حاجته لشيف بعدد 2، متخصصون في الطبخ الغربي، يرجى إرسال السيرة الذاتية''',
    imageUrl: 'assets/images/rest7.png',
    owner: 'فندق جلوريا',
    ownerId: 6,
  ),
  Ads(
    title: 'مطلوب شيف بعدد 2 للعمل داخل فندق',
    dateTime: 'منذ 20 د',
    description:
        '''يعلن فندق النعيم عن حاجته لشيف بعدد 2، متخصصون في الطبخ الغربي، يرجى إرسال السيرة الذاتية''',
    imageUrl: 'assets/images/rest7.png',
    owner: 'فندق جلوريا',
    ownerId: 6,
  ),
  Ads(
    title: 'مطلوب شيف بعدد 2 للعمل داخل فندق',
    dateTime: 'منذ 20 د',
    description:
        '''يعلن فندق النعيم عن حاجته لشيف بعدد 2، متخصصون في الطبخ الغربي، يرجى إرسال السيرة الذاتية''',
    imageUrl: 'assets/images/rest7.png',
    owner: 'فندق جلوريا',
    ownerId: 6,
  ),
];

List<Restaurant> restaurants = [
  Restaurant(
    imageUrl: 'assets/images/rest7.png',
    owner: 'فندق جلوريا',
    id: 6,
  ),
  Restaurant(
    imageUrl: 'assets/images/rest6.png',
    owner: 'مخبز المدينة',
    id: 4,
  ),
  Restaurant(
    imageUrl: 'assets/images/rest5.png',
    owner: 'مطعم العوافي',
    id: 5,
  ),
  Restaurant(
    imageUrl: 'assets/images/rest4.png',
    owner: 'مطبخ الأسرة',
    id: 2,
  ),
  Restaurant(
    imageUrl: 'assets/images/rest3.png',
    owner: 'مطعم حمص عكا',
    id: 7,
  ),
  Restaurant(
    imageUrl: 'assets/images/rest2.png',
    owner: 'مطعم العوافي',
    id: 1,
  ),
  Restaurant(
    imageUrl: 'assets/images/rest1.png',
    owner: 'مطعم جولدن',
    id: 3,
  ),
];

List<User> users = [
  User(
    from: 'مطعم جولدن',
    to: 'أحمد',
    message: 'تم قبول طلبك في التوظيف داخل المطعم',
    name: 'مطعم جولدن',
    imageUrl: 'assets/images/rest1.png',
  ),
  User(
    from: 'مطعم العوافي',
    to: 'أحمد',
    message: 'يرجى تزويدنا بالسيرة الذاتية',
    name: 'مطعم العوافي',
    imageUrl: 'assets/images/rest2.png',
  ),
  User(
    from: 'مطعم حمص عكا',
    to: 'أحمد',
    message: 'تم رفض طلبك',
    name: 'مطعم حمص عكا',
    imageUrl: 'assets/images/rest3.png',
  ),
];
