import 'package:flutter/material.dart';

void main() => runApp(const ZadAlMoamenApp());

const deepGreen = Color(0xFF102B22);
const cardGreen = Color(0xFF1D4433);
const gold = Color(0xFFD8B967);
const cream = Color(0xFFF3E7C5);

class ZadAlMoamenApp extends StatelessWidget {
  const ZadAlMoamenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'زاد المؤمن',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: deepGreen,
        colorScheme: const ColorScheme.dark(
          primary: gold,
          secondary: gold,
          surface: cardGreen,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  static const sections = [
    ('القرآن الكريم', Icons.menu_book_rounded),
    ('الأدعية', Icons.volunteer_activism_outlined),
    ('الزيارات', Icons.mosque_outlined),
    ('المسبحة', Icons.fingerprint_rounded),
    ('مواقيت الصلاة', Icons.access_time_rounded),
    ('اتجاه القبلة', Icons.explore_outlined),
    ('التقويم والمناسبات', Icons.calendar_month_rounded),
    ('القراء والتلاوات', Icons.headphones_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: deepGreen,
          title: const Row(
            children: [
              Icon(Icons.nights_stay_rounded, color: gold),
              SizedBox(width: 10),
              Text(
                'زاد المؤمن',
                style: TextStyle(
                  color: cream,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: gold,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardGreen,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: gold),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'السلام عليكم ورحمة الله وبركاته',
                    style: TextStyle(color: gold, fontSize: 13),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'أهلاً بك في رحاب الإيمان',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: cream,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'رفيقك للقرآن والذكر والأعمال اليومية',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: deepGreen,
                    size: 30,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مواقيت الصلاة',
                          style: TextStyle(
                            color: deepGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'سيتم ربط المواقيت بالموقع وطريقة الحساب',
                          style: TextStyle(
                            color: deepGreen,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'الخدمات الإسلامية',
              style: TextStyle(
                color: cream,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sections.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.65,
              ),
              itemBuilder: (context, index) {
                final item = sections[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    setState(() => selectedIndex = index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardGreen,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: selectedIndex == index
                            ? gold
                            : gold.withOpacity(.25),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item.$2, color: gold, size: 29),
                        const SizedBox(height: 8),
                        Text(
                          item.$1,
                          style: const TextStyle(
                            color: cream,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'اللهم صلِّ على محمد وآل محمد',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: gold,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: const Color(0xFF0B211A),
          indicatorColor: gold.withOpacity(.18),
          selectedIndex: 0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              label: 'القرآن',
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark_border),
              label: 'المحفوظات',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              label: 'الإعدادات',
            ),
          ],
        ),
      ),
    );
  }
}
