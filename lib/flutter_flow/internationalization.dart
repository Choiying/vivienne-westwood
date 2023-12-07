import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans', 'zh_Hant'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
    String? zh_HantText = '',
  }) =>
      [enText, zh_HansText, zh_HantText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '3kugjicm': {
      'en': 'Shop our lastest arrivals',
      'zh_Hans': '选购我们最新到货的商品',
      'zh_Hant': '選購我們最新到貨的商品',
    },
    '1hshnfhb': {
      'en': 'WOMENSWEAR',
      'zh_Hans': '女装',
      'zh_Hant': '女裝',
    },
    'm7mn4wmv': {
      'en': 'MENSWEAR',
      'zh_Hans': '男装',
      'zh_Hant': '男裝',
    },
    'upszd7w9': {
      'en': 'Culture lives through con',
      'zh_Hans': '文化通过骗局而生存',
      'zh_Hant': '文化透過騙局而生存',
    },
    'ji3datv8': {
      'en': 'Heritage',
      'zh_Hans': '遗产',
      'zh_Hant': '遺產',
    },
    'myuuxnya': {
      'en': '17/04/23',
      'zh_Hans': '17/04/23',
      'zh_Hant': '17/04/23',
    },
    'ev2o2h9v': {
      'en':
          '\nCorsets\n\nAs ever synonymous with the notion of Renaissance – a French term, originally evoking rebirth – Vivienne was always one to look to the past for inspiration. ‘When you explore the past, you enter the future,’ she once expressed. Her 18th century-inspired corsets were symbolic of this vision and her keen interest in history.\n\n',
      'zh_Hans':
          '紧身胸衣\n\n作为文艺复兴（法语术语，最初表示重生）概念的代名词，薇薇安总是从过去寻找灵感。 “当你探索过去时，你就进入了未来，”她曾经表示。她的 18 世纪风格紧身胸衣象征着这一愿景和她对历史的浓厚兴趣。',
      'zh_Hant':
          '緊身胸衣\n\n作為「文藝復興」概念（法語術語，原意為重生）的代名詞，薇薇安總是從過去尋找靈感。 「當你探索過去時，你就進入了未來，」她曾經表示。她的 18 世紀風格緊身胸衣象徵著這個願景和她對歷史的濃厚興趣。',
    },
    'c5bu1h69': {
      'en': 'Read Article\n\n\n',
      'zh_Hans': '阅读文章',
      'zh_Hant': '閱讀文章',
    },
    '4pc4gqs8': {
      'en': 'See More Articles\n\n\n',
      'zh_Hans': '查看更多文章',
      'zh_Hant': '看更多文章',
    },
    'zf2kc16t': {
      'en': 'Discover',
      'zh_Hans': '发现',
      'zh_Hant': '發現',
    },
    '9yr3wukx': {
      'en': '\n\nHeritage',
      'zh_Hans': '遗产',
      'zh_Hant': '遺產',
    },
    'sig2bewk': {
      'en':
          '\nVivienne Westwood began designing in 1971 along with her then partner Malcolm McLaren in London. At the time they used their shop at 430 Kings Road, London, to showcase their ideas and designs. With their changing ideas of fashion came the change of not only the name of the shop but also the décor. It was in 1976 when Westwood and McLaren defined the street culture of Punk with Seditionaries.\n\n',
      'zh_Hans':
          'Vivienne Westwood 于 1971 年与当时的合作伙伴 Malcolm McLaren 在伦敦开始设计。当时他们利用位于伦敦国王路 430 号的商店来展示他们的想法和设计。随着他们对时尚观念的改变，不仅店名发生了变化，装潢也发生了变化。 1976 年，Westwood 和 McLaren 用 Seditionaries 定义了朋克街头文化。',
      'zh_Hant':
          'Vivienne Westwood 於 1971 年與當時的合作夥伴 Malcolm McLaren 在倫敦開始設計。當時他們利用位於倫敦國王路 430 號的商店來展示他們的想法和設計。隨著他們對時尚觀念的改變，不僅店名發生了變化，裝潢也改變了。 1976 年，Westwood 和 McLaren 用 Seditionaries 定義了龐克街頭文化。',
    },
    '67d71d98': {
      'en': 'Read Article\n\n',
      'zh_Hans': '阅读文章',
      'zh_Hant': '閱讀文章',
    },
    '51rz4q4y': {
      'en': 'See More Articles\n\n',
      'zh_Hans': '查看更多文章',
      'zh_Hant': '看更多文章',
    },
    '62g658jp': {
      'en': '@viviennewestwood',
      'zh_Hans': '@viviennewestwood',
      'zh_Hant': '@viviennewestwood',
    },
    '2qrr7rii': {
      'en': 'WORLDWIDE\n    DELIVERY\n\n',
      'zh_Hans': '全世界\n    送货',
      'zh_Hant': '全世界\n    送貨',
    },
    'n8jhs4x8': {
      'en': 'COMMITTED TO\n SUSTAINABILITY\n\n',
      'zh_Hans': '承诺\n 可持续发展',
      'zh_Hant': '承諾\n 永續發展',
    },
    '46pyd0fv': {
      'en': 'SAFE & SECURE \n    PAYMENTS\n\n',
      'zh_Hans': '安全可靠\n    付款',
      'zh_Hant': '安全可靠\n    付款',
    },
    'j5clbhg5': {
      'en': 'CRAFT AND\n  HERITAGE\n\n',
      'zh_Hans': '工艺和\n  遗产',
      'zh_Hant': '工藝和\n  遺產',
    },
    'q45whtbg': {
      'en': '\n\nSUBSCRIBE TO OUR NEWSLETTER\n',
      'zh_Hans': '订阅我们的新闻',
      'zh_Hant': '訂閱我們的新聞',
    },
    '4j5fsxj8': {
      'en': 'Enter your email',
      'zh_Hans': '输入你的电子邮箱',
      'zh_Hant': '輸入你的電子郵件信箱',
    },
    'hsf4pufb': {
      'en': '\n\nFIND US ON',
      'zh_Hans': '找到我们',
      'zh_Hant': ' 找到我們',
    },
    'rqe6my0m': {
      'en': 'CUSTOMER CARE',
      'zh_Hans': '客户关怀',
      'zh_Hant': '客戶關懷',
    },
    'oiv1xbhc': {
      'en': 'COMPANY',
      'zh_Hans': '公司',
      'zh_Hant': '公司',
    },
    '2mm6prgp': {
      'en': 'Secure Checkout',
      'zh_Hans': '安全支付',
      'zh_Hant': '安全支付',
    },
    'li2hjuho': {
      'en': '© 2023 Vivienne Westwood',
      'zh_Hans': '© 2023 薇薇安·韦斯特伍德',
      'zh_Hant': '© 2023 薇薇安韋斯特伍德',
    },
    'czl7lge2': {
      'en':
          'Enjoy Complimentary Shipping Worldwide by using code: \nFREESHIPPING at checkout. Valid for a limited time only.',
      'zh_Hans': '使用代码享受全球免费送货：\n结账时免运费。仅在有限时间内有效。',
      'zh_Hant': '使用代碼享受全球免費送貨：\n結帳時免運費。僅在有限時間內有效。',
    },
    '2yhmpxds': {
      'en': 'Home',
      'zh_Hans': '主頁',
      'zh_Hant': '主頁',
    },
  },
  // Womens
  {
    'f5x5rw4n': {
      'en': 'WOMENS',
      'zh_Hans': '女士',
      'zh_Hant': '女士',
    },
    'pyaz9yaq': {
      'en': 'View all',
      'zh_Hans': '查看全部',
      'zh_Hant': '查看全部',
    },
    'wzul6yh9': {
      'en':
          'Explore our selection of Autumn-Winter 2023/24\nwomenswear. Inspired by the nomadic lifestyle of travelers, styles borrow from antique wardrobes, faded tapestries and old Hollywood tailoring.  A brushstroke print is applied across tailored suits, organic denim and dresses - while knitwear pieces are patched together, screen-printed and hand-painted. Floral motifs and jacquards sit alongside velvet and leopard prints, evoking the eclectic interiors of travelling caravans. ',
      'zh_Hans':
          '探索我们精选的 2023/24 秋冬系列\n女装。受到旅行者游牧生活方式的启发，风格借鉴了古董衣柜、褪色的挂毯和老式好莱坞剪裁。笔触印花被运用在定制西装、有机牛仔布和连衣裙上，而针织单品则是拼凑在一起、丝网印刷和手绘的。花卉图案和提花图案与天鹅绒和豹纹图案并存，让人想起旅行大篷车不拘一格的内饰。',
      'zh_Hant':
          '探索我們精選的 2023/24 秋冬系列\n女裝。受到旅行者遊牧生活方式的啟發，風格借鑒了古董衣櫃、褪色的掛毯和老式好萊塢剪裁。筆觸印花應用於訂製西裝、有機牛仔布和連身裙，而針織單品則採用拼湊、絲網印刷和手繪的方式。花卉圖案和提花圖案與天鵝絨和豹紋圖案並存，讓人想起旅行大篷車不拘一格的內部。',
    },
    'tiyfuj8f': {
      'en': 'CLOTHING',
      'zh_Hans': '衣服',
      'zh_Hant': '衣服',
    },
    'n3xi0ubx': {
      'en': 'JEWELLERY',
      'zh_Hans': '首饰',
      'zh_Hant': '首飾',
    },
    '75vfmvqb': {
      'en': 'BAGS',
      'zh_Hans': '包',
      'zh_Hant': '包',
    },
    'qcfgdoh3': {
      'en': 'SHOES',
      'zh_Hans': '鞋',
      'zh_Hant': '鞋',
    },
    'eif95i13': {
      'en': 'WORLDWIDE\n    DELIVERY\n\n',
      'zh_Hans': '全世界\n    送货',
      'zh_Hant': '全世界\n    送貨',
    },
    'yj48k2ln': {
      'en': 'COMMITTED TO\n SUSTAINABILITY\n\n',
      'zh_Hans': '承诺\n 可持续发展',
      'zh_Hant': '承諾\n 永續發展',
    },
    'a5t40vej': {
      'en': 'SAFE & SECURE \n    PAYMENTS\n\n',
      'zh_Hans': '安全可靠\n    付款',
      'zh_Hant': '安全可靠\n    付款',
    },
    'p8s5kzq0': {
      'en': 'CRAFT AND\n  HERITAGE\n\n',
      'zh_Hans': '工艺和\n  遗产',
      'zh_Hant': '工藝和\n  遺產',
    },
    'speypb03': {
      'en': '\n\nSUBSCRIBE TO OUR NEWSLETTER\n',
      'zh_Hans': '订阅我们的新闻',
      'zh_Hant': '訂閱我們的新聞',
    },
    'gfiwhvx1': {
      'en': 'Enter your email',
      'zh_Hans': '输入你的电子邮箱',
      'zh_Hant': '輸入你的電子郵件信箱',
    },
    'iizo6r8t': {
      'en': '\n\nFIND US ON',
      'zh_Hans': ' 找到我们',
      'zh_Hant': ' 找到我們',
    },
    'enfgbvat': {
      'en': 'CUSTOMER CARE',
      'zh_Hans': '客户关怀',
      'zh_Hant': '客戶關懷',
    },
    '3mll8ctv': {
      'en': 'COMPANY',
      'zh_Hans': '公司',
      'zh_Hant': '公司',
    },
    'kkkikjsa': {
      'en': 'Secure Checkout',
      'zh_Hans': '安全支付',
      'zh_Hant': '安全支付',
    },
    'h1xjsqq3': {
      'en': '© 2023 Vivienne Westwood',
      'zh_Hans': '© 2023 薇薇安·韦斯特伍德',
      'zh_Hant': '© 2023 薇薇安韋斯特伍德',
    },
    'klgaf2im': {
      'en':
          'Enjoy Complimentary Shipping Worldwide by using code: \nFREESHIPPING at checkout. Valid for a limited time only.',
      'zh_Hans': '使用代码享受全球免费送货：\n结账时免运费。仅在有限时间内有效。',
      'zh_Hant': '使用代碼享受全球免費送貨：\n結帳時免運費。僅在有限時間內有效。',
    },
    'xyxhxpzj': {
      'en': 'Home',
      'zh_Hans': '主頁',
      'zh_Hant': '主頁',
    },
  },
  // Mens
  {
    'qelnl9dl': {
      'en': 'MENS',
      'zh_Hans': '男士',
      'zh_Hant': '男士',
    },
    'rr8f6l3q': {
      'en': 'View all',
      'zh_Hans': '查看全部',
      'zh_Hant': '看全部',
    },
    'z5cyg2b0': {
      'en':
          'Explore our selection of Autumn-Winter 2023/24 menswear. Inspired by the nomadic lifestyle of travelers, styles borrow from antique wardrobes, faded tapestries and old Hollywood tailoring.  From earthy tartans to ripped denim and classic suit pieces. The result is a collection that combines eras, styles and cultures in a melting pot of inspirations. ',
      'zh_Hans':
          '探索我们精选的 2023/24 秋冬男装。受到旅行者游牧生活方式的启发，风格借鉴了古董衣柜、褪色的挂毯和老式好莱坞剪裁。从朴实的格子呢到破洞牛仔布和经典西装单品。其结果是一个集合了时代、风格和文化的灵感大熔炉。',
      'zh_Hant':
          '探索我們精選的 2023/24 秋冬男裝。受到旅行者遊牧生活方式的啟發，風格借鑒了古董衣櫃、褪色的掛毯和老式好萊塢剪裁。從樸實的格紋到破洞牛仔布和經典西裝單品。結果是一個集合了時代、風格和文化的靈感大熔爐。',
    },
    'twxe4atw': {
      'en': 'SHOES',
      'zh_Hans': '鞋',
      'zh_Hant': '鞋',
    },
    '6fh0vktk': {
      'en': 'CLOTHING',
      'zh_Hans': '衣服',
      'zh_Hant': '衣服',
    },
    '30nrrska': {
      'en': 'ACCESSORIES',
      'zh_Hans': '配件',
      'zh_Hant': '配件',
    },
    'immx4qib': {
      'en': 'JEWELLERY',
      'zh_Hans': '首饰',
      'zh_Hant': '首飾',
    },
    '0i26wfn8': {
      'en': 'WORLDWIDE\n    DELIVERY\n\n',
      'zh_Hans': '全世界\n    送货',
      'zh_Hant': '全世界\n    送貨',
    },
    'fxutzv1k': {
      'en': 'COMMITTED TO\n SUSTAINABILITY\n\n',
      'zh_Hans': '承诺\n 可持续发展',
      'zh_Hant': '承諾\n 永續發展',
    },
    'e4ynz27w': {
      'en': 'SAFE & SECURE \n    PAYMENTS\n\n',
      'zh_Hans': '安全可靠\n    付款',
      'zh_Hant': '安全可靠\n    付款',
    },
    'hv3glgse': {
      'en': 'CRAFT AND\n  HERITAGE\n\n',
      'zh_Hans': '工艺和\n  遗产',
      'zh_Hant': '工藝和\n  遺產',
    },
    'ncm0sieh': {
      'en': '\n\nSUBSCRIBE TO OUR NEWSLETTER\n',
      'zh_Hans': '订阅我们的新闻',
      'zh_Hant': '訂閱我們的新聞',
    },
    'xx41u5lk': {
      'en': 'Enter your email',
      'zh_Hans': '输入你的电子邮箱',
      'zh_Hant': '輸入你的電子郵件信箱',
    },
    'dulwhdkl': {
      'en': '\n\nFIND US ON',
      'zh_Hans': '在 - 找到我们',
      'zh_Hant': '在 - 找到我們',
    },
    'mk33u21c': {
      'en': 'CUSTOMER CARE',
      'zh_Hans': '客户关怀',
      'zh_Hant': '客戶關懷',
    },
    'ge4z7zkn': {
      'en': 'COMPANY',
      'zh_Hans': '公司',
      'zh_Hant': '公司',
    },
    'qxwckepy': {
      'en': 'Secure Checkout',
      'zh_Hans': '安全支付',
      'zh_Hant': '安全支付',
    },
    'o63kyzto': {
      'en': '© 2023 Vivienne Westwood',
      'zh_Hans': '© 2023 薇薇安·韦斯特伍德',
      'zh_Hant': '© 2023 薇薇安韋斯特伍德',
    },
    '5186ngjv': {
      'en':
          'Enjoy Complimentary Shipping Worldwide by using code: \nFREESHIPPING at checkout. Valid for a limited time only.',
      'zh_Hans': '使用代码享受全球免费送货：\n结账时免运费。仅在有限时间内有效。',
      'zh_Hant': '使用代碼享受全球免費送貨：\n結帳時免運費。僅在有限時間內有效。',
    },
    '695yesyi': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // NEWARRIVALS
  {
    'x6i0cc9r': {
      'en': 'NEW ARRIVALS',
      'zh_Hans': '新品上市',
      'zh_Hant': '新品上市',
    },
    'vqk2c54u': {
      'en':
          'Shop our latest arrivals in womenswear, \nmenswear, bags, accessories and footwear.',
      'zh_Hans': '选购我们最新推出的女装，\n男装、箱包、配饰和鞋类。',
      'zh_Hant': '選購我們最新推出的女裝，\n男裝、箱包、配件和鞋類。',
    },
    '3ybyolex': {
      'en': 'Button',
      'zh_Hans': '按钮',
      'zh_Hant': '按鈕',
    },
    '5jlb8ek3': {
      'en': 'Menswear',
      'zh_Hans': '男装',
      'zh_Hant': '男裝',
    },
    'arnn0k7h': {
      'en': 'Bags',
      'zh_Hans': '包',
      'zh_Hant': '包包',
    },
    'whbvu8jg': {
      'en': 'Shoes',
      'zh_Hans': '鞋',
      'zh_Hant': '鞋',
    },
    'iedu0vid': {
      'en': 'Womenswear',
      'zh_Hans': '女装',
      'zh_Hant': '女裝',
    },
    '25gkrm1f': {
      'en': 'MAN. LOELIA LARGE PEARL BRACELET',
      'zh_Hans': '男人。 LOELIA 大号珍珠手链',
      'zh_Hant': '男人。 LOELIA 大號珍珠手鍊',
    },
    'idahfwzu': {
      'en': '€250',
      'zh_Hans': '250 欧元',
      'zh_Hant': '250 歐元',
    },
    'puu9d9x3': {
      'en': 'HEBO TOP',
      'zh_Hans': '赫博TOP',
      'zh_Hant': '赫博TOP',
    },
    'j26dch6c': {
      'en': '€210',
      'zh_Hans': '210 欧元',
      'zh_Hant': '210 歐元',
    },
    'oxjaxbsh': {
      'en': 'MEGHAN KILT',
      'zh_Hans': '梅根·短裙',
      'zh_Hant': '梅根短裙',
    },
    'x94jv217': {
      'en': '€800',
      'zh_Hans': '800 欧元',
      'zh_Hant': '800 歐元',
    },
    '54cjpfcr': {
      'en': 'WOMENS',
      'zh_Hans': '女性的',
      'zh_Hant': '女性的',
    },
    'u38w7bj1': {
      'en': 'View all',
      'zh_Hans': '查看全部',
      'zh_Hant': '看全部',
    },
    '4rrhfpoc': {
      'en': 'BAGS & ACCESSORIES',
      'zh_Hans': '包袋及配饰',
      'zh_Hant': '包包及配件',
    },
    '43iy3jo6': {
      'en': 'View all',
      'zh_Hans': '查看全部',
      'zh_Hant': '看全部',
    },
    '754r80p4': {
      'en': 'MENS',
      'zh_Hans': '男士',
      'zh_Hant': '男士',
    },
    'tnlmjhvw': {
      'en': 'View all',
      'zh_Hans': '查看全部',
      'zh_Hant': '看全部',
    },
    'pjng8d1c': {
      'en': 'JEWELLERY',
      'zh_Hans': '首饰',
      'zh_Hant': '首飾',
    },
    'uu8vl19e': {
      'en': 'View all',
      'zh_Hans': '查看全部',
      'zh_Hant': '看全部',
    },
    'kf75lxl9': {
      'en': 'WORLDWIDE\n    DELIVERY\n\n',
      'zh_Hans': '全世界\n    送货',
      'zh_Hant': '全世界\n    送貨',
    },
    '0jhkb0za': {
      'en': 'COMMITTED TO\n SUSTAINABILITY\n\n',
      'zh_Hans': '承诺\n 可持续发展',
      'zh_Hant': '承諾\n 永續發展',
    },
    '7fnvx14d': {
      'en': 'SAFE & SECURE \n    PAYMENTS\n\n',
      'zh_Hans': '安全可靠\n    付款',
      'zh_Hant': '安全可靠\n    付款',
    },
    '2ecyae1c': {
      'en': 'CRAFT AND\n  HERITAGE\n\n',
      'zh_Hans': '工艺和\n  遗产',
      'zh_Hant': '工藝和\n  遺產',
    },
    'ykk68fzf': {
      'en': '\n\nSUBSCRIBE TO OUR NEWSLETTER\n',
      'zh_Hans': '订阅我们的新闻',
      'zh_Hant': '訂閱我們的新聞',
    },
    '06zprui7': {
      'en': 'Enter your email',
      'zh_Hans': '输入你的电子邮箱',
      'zh_Hant': '輸入你的電子郵件信箱',
    },
    '6i96fbnw': {
      'en': '\n\nFIND US ON',
      'zh_Hans': '在 - 找到我们',
      'zh_Hant': '在 - 找到我們',
    },
    '5h9qt527': {
      'en': 'CUSTOMER CARE',
      'zh_Hans': '客户关怀',
      'zh_Hant': '客戶關懷',
    },
    'cvmpmz92': {
      'en': 'COMPANY',
      'zh_Hans': '公司',
      'zh_Hant': '公司',
    },
    'cip8322l': {
      'en': 'Secure Checkout',
      'zh_Hans': '安全支付',
      'zh_Hant': '安全支付',
    },
    'y84t0k00': {
      'en': '© 2023 Vivienne Westwood',
      'zh_Hans': '© 2023 薇薇安·韦斯特伍德',
      'zh_Hant': '© 2023 薇薇安韋斯特伍德',
    },
    'pk7mls5x': {
      'en':
          'Enjoy Complimentary Shipping Worldwide by using code: \nFREESHIPPING at checkout. Valid for a limited time only.',
      'zh_Hans': '使用代码享受全球免费送货：\n结账时免运费。仅在有限时间内有效。',
      'zh_Hant': '使用代碼享受全球免費送貨：\n結帳時免運費。僅在有限時間內有效。',
    },
    'h712z10j': {
      'en': 'Home',
      'zh_Hans': '主頁',
      'zh_Hant': '主頁',
    },
  },
  // Gift
  {
    'rq49g0gz': {
      'en': 'GIFTS',
      'zh_Hans': '礼物',
      'zh_Hant': '禮物',
    },
    'ktasdzkl': {
      'en': 'BEA CORSET CARDI',
      'zh_Hans': 'BEA 紧身胸衣开衫',
      'zh_Hant': 'BEA 緊身胸衣開襟衫',
    },
    'rqmimgh7': {
      'en': '€1,005',
      'zh_Hans': '1,005 欧元',
      'zh_Hant': '1,005 歐元',
    },
    'o7tnd802': {
      'en': 'ELEVATED GHILLIE',
      'zh_Hans': '高架吉利',
      'zh_Hant': '高架吉利',
    },
    'vysiq6f8': {
      'en': '€870',
      'zh_Hans': '870 欧元',
      'zh_Hant': '870 歐元',
    },
    '9liureu9': {
      'en': 'KITT BUCKET BAG',
      'zh_Hans': 'Kitt 水桶包',
      'zh_Hant': 'Kitt 水桶包',
    },
    'is5e3zvw': {
      'en': '€480',
      'zh_Hans': '480 欧元',
      'zh_Hant': '480 歐元',
    },
    '66qcyp4b': {
      'en': 'RAY TROUSERS',
      'zh_Hans': '雷纹长裤',
      'zh_Hant': '雷紋長褲',
    },
    'n5c0mztn': {
      'en': '€845',
      'zh_Hans': '845 欧元',
      'zh_Hant': '845 歐元',
    },
    'xei4g3md': {
      'en': 'PEARL DROP EARRINGS',
      'zh_Hans': '珍珠耳坠',
      'zh_Hant': '珍珠耳環',
    },
    'diuvyjsp': {
      'en': '€220',
      'zh_Hans': '220 欧元',
      'zh_Hant': '220 歐元',
    },
    'w3oqp4vj': {
      'en': 'LONG GINNIE PENCIL DRESS',
      'zh_Hans': 'Ginnie 长款铅笔连衣裙',
      'zh_Hant': 'Ginnie 長鉛筆連身裙',
    },
    'doip22a4': {
      'en': '€1,055',
      'zh_Hans': '1,055 欧元',
      'zh_Hant': '1,055 歐元',
    },
    '9ehn5zqj': {
      'en': 'THIERRY DRESS',
      'zh_Hans': '蒂埃里连衣裙',
      'zh_Hant': '蒂埃里連身裙',
    },
    'fhllwmb0': {
      'en': '€1,980',
      'zh_Hans': '1,980 欧元',
      'zh_Hant': '1,980 歐元',
    },
    '0wit4i69': {
      'en': 'GRANNY FRAME PURSE',
      'zh_Hans': '奶奶框钱包',
      'zh_Hant': '奶奶框錢包',
    },
    '3uvosbcg': {
      'en': '€450',
      'zh_Hans': '450 欧元',
      'zh_Hant': '450 歐元',
    },
    'equa5j1t': {
      'en': '2 BUTTON KRALL',
      'zh_Hans': '2 按钮克拉尔',
      'zh_Hant': '2 按鈕克拉爾',
    },
    'fuxkwtz7': {
      'en': '€250',
      'zh_Hans': '250 欧元',
      'zh_Hant': '250 歐元',
    },
    'ix00xb7v': {
      'en': 'HUMPHREY TROUSERS',
      'zh_Hans': '汉弗莱长裤',
      'zh_Hant': '漢弗萊長褲',
    },
    '0wafl0cz': {
      'en': '€875',
      'zh_Hans': '875 欧元',
      'zh_Hant': '875 歐元',
    },
    'i9pqpldu': {
      'en': '50X200 MADRAS CHECK BI COL. SC',
      'zh_Hans': '50X200 马德拉斯检查双色。 SC',
      'zh_Hant': '50X200 馬德拉斯檢查雙色。 SC',
    },
    'clyty2ie': {
      'en': '€210',
      'zh_Hans': '210 欧元',
      'zh_Hant': '210 歐元',
    },
    '9vdbkh9n': {
      'en': 'PHONE CROSSBODY BAG',
      'zh_Hans': '手机斜挎包',
      'zh_Hant': '手機斜背包',
    },
    'lb3j3tqb': {
      'en': '€365',
      'zh_Hans': '365 欧元',
      'zh_Hant': '365 歐元',
    },
    'n3v26w1w': {
      'en': 'NEW SMALL ORB PENDANT',
      'zh_Hans': '新款小球吊坠',
      'zh_Hant': '新款小球吊墜',
    },
    'u81lgsq3': {
      'en': '€260',
      'zh_Hans': '260 欧元',
      'zh_Hant': '260 歐元',
    },
    'nayo26qd': {
      'en': 'GRANNY FRAME PURSE',
      'zh_Hans': '奶奶框钱包',
      'zh_Hant': '奶奶框錢包',
    },
    'xkqttjpl': {
      'en': '€250',
      'zh_Hans': '250 欧元',
      'zh_Hant': '250 歐元',
    },
    'w1i0g98b': {
      'en': 'Sold out',
      'zh_Hans': '售罄',
      'zh_Hant': '售罄',
    },
    'r9f6nwxh': {
      'en': '€70',
      'zh_Hans': '70 欧元',
      'zh_Hant': '70 歐元',
    },
    'syx8tm0k': {
      'en': 'OVERSIZED MADRAS HIGH SOCK',
      'zh_Hans': '超大马德拉斯高筒袜',
      'zh_Hant': '超大馬德拉斯高筒襪',
    },
    'xtum8glp': {
      'en': '€180',
      'zh_Hans': '180 欧元',
      'zh_Hant': '180 歐元',
    },
    'zzu78ln1': {
      'en': 'SM. LINE ORB BUCKLE/BRASS',
      'zh_Hans': 'SM。线球扣/黄铜',
      'zh_Hant': 'SM。線球扣/黃銅',
    },
    'rm1useu9': {
      'en': 'WORLDWIDE\n    DELIVERY\n\n',
      'zh_Hans': '全世界\n    送货',
      'zh_Hant': '全世界\n    送貨',
    },
    'hkc95a1b': {
      'en': 'COMMITTED TO\n SUSTAINABILITY\n\n',
      'zh_Hans': '承诺\n 可持续发展',
      'zh_Hant': '承諾\n 永續發展',
    },
    '0etlhmah': {
      'en': 'SAFE & SECURE \n    PAYMENTS\n\n',
      'zh_Hans': '安全可靠\n    付款',
      'zh_Hant': '安全可靠\n    付款',
    },
    'p0tbkvo2': {
      'en': 'CRAFT AND\n  HERITAGE\n\n',
      'zh_Hans': '工艺和\n  遗产',
      'zh_Hant': '工藝和\n  遺產',
    },
    '1ufkg1s1': {
      'en': '\n\nSUBSCRIBE TO OUR NEWSLETTER\n',
      'zh_Hans': '订阅我们的新闻',
      'zh_Hant': '訂閱我們的新聞',
    },
    '53hvevtr': {
      'en': 'Enter your email',
      'zh_Hans': '输入你的电子邮箱',
      'zh_Hant': '輸入你的電子郵件信箱',
    },
    '5ehaouyl': {
      'en': '\n\nFIND US ON',
      'zh_Hans': '在 - 找到我们',
      'zh_Hant': '在 - 找到我們',
    },
    's96quzxn': {
      'en': 'CUSTOMER CARE',
      'zh_Hans': '客户关怀',
      'zh_Hant': '客戶關懷',
    },
    'r5d1ru5b': {
      'en': 'COMPANY',
      'zh_Hans': '公司',
      'zh_Hant': '公司',
    },
    'h2mersgd': {
      'en': 'Secure Checkout',
      'zh_Hans': '安全支付',
      'zh_Hant': '安全支付',
    },
    'twg7um3l': {
      'en': '© 2023 Vivienne Westwood',
      'zh_Hans': '© 2023 薇薇安·韦斯特伍德',
      'zh_Hant': '© 2023 薇薇安韋斯特伍德',
    },
    'lyap29dv': {
      'en':
          'Enjoy Complimentary Shipping Worldwide by using code: \nFREESHIPPING at checkout. Valid for a limited time only.',
      'zh_Hans': '使用代码享受全球免费送货：\n结账时免运费。仅在有限时间内有效。',
      'zh_Hant': '使用代碼享受全球免費送貨：\n結帳時免運費。僅在有限時間內有效。',
    },
    '46kq0p88': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // Miscellaneous
  {
    'iprctqes': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'yix6qtu0': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'j4fmvuxz': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'rr1f3xob': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '6wza4aku': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'm2mziun3': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'dutjoha7': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'iizum3fc': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'lpbebtxn': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '75tt410t': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'k4nrod7y': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'e5rz0fk9': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'r3um4r34': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'se03bdln': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '432z13zx': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'uugwjnzg': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'dymz2ihm': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '6cmkz7cr': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'a1dv4l61': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '6doug5af': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'b5ckp18z': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'e6p936w1': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'z90ee7f2': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
