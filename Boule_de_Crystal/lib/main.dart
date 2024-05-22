import 'package:flutter/material.dart';
import 'database/database_helper.dart';
import 'models/zodiac_sign.dart';
import 'models/chinese_zodiac_sign.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  runApp(const MyApp());
}

Future<void> initializeDatabase() async {
  final dbHelper = DatabaseHelper();

  // Signes du zodiaque
  List<ZodiacSign> zodiacSigns = [
    ZodiacSign(libelle: 'Bélier', dateDebut: '21-mars', dateFin: '19-avr', description: 'Le bélier est le premier signe du zodiaque. Il symbolise l\'impulsion, la virilité, le courage, l\'énergie et l\'indépendance. Il a pour élément le feu.'),
    ZodiacSign(libelle: 'Taureau', dateDebut: '20-avr', dateFin: '20-mai', description: 'Le signe du taureau se situe entre l\'équinoxe du printemps et le solstice d\'été. Il est généralement associé à une grande puissance de travail, la sensualité ainsi qu\'à une tendance exagérée pour les plaisirs. Son élément est la terre.'),
    ZodiacSign(libelle: 'Gémeaux', dateDebut: '21-mai', dateFin: '21-juin', description: 'Généralement représenté sous la forme de deux enfants se tenant par la main, le troisième signe du zodiaque symbolise les contacts humains, les transports, les communications ainsi que la polarité. Il est associé à l\'air.'),
    ZodiacSign(libelle: 'Cancer', dateDebut: '22-juin', dateFin: '22-juil', description: 'Le signe du cancer se situe juste après le solstice d\'été. Il a pour signification le retrait sur soi, la timidité, la ténacité ainsi que la sensibilité. Il est associé à l\'élément de l\'eau.'),
    ZodiacSign(libelle: 'Lion', dateDebut: '23-juil', dateFin: '22-août', description: 'Ce signe situé en plein milieu de l\'été a pour symbole la joie de vivre, l\'ambition, l\'élévation et l\'orgueil. Son élément est le feu.'),
    ZodiacSign(libelle: 'Vierge', dateDebut: '23-août', dateFin: '22-sept', description: 'Le signe de la vierge se place avant l\'équinoxe d\'automne. Il est symbole de travail, de moisson, de dextérité manuelle et de minutie. Il est associé à l\'élément terres.'),
    ZodiacSign(libelle: 'Balance', dateDebut: '23-sept', dateFin: '23-oct', description: 'Lorsqu\'il entre dans ce signe, le soleil est au point médian de l\'année astronomique. Il représente l\'équilibre, la justice, la mesure. Il a pour élément l\'air.'),
    ZodiacSign(libelle: 'Scorpion', dateDebut: '24-oct', dateFin: '22-nov', description: 'Le huitième signe du zodiaque est associé à la résistance. Son élément est l\'eau. Il est présenté comme le signe le plus passionné du zodiaque. À tendance sombre, le scorpion peut avoir une tendance à l\'autodestruction.'),
    ZodiacSign(libelle: 'Sagittaire', dateDebut: '23-nov', dateFin: '22-déc', description: 'Le signe du sagittaire se place juste avant le solstice d\'hiver. Il a pour symbole le mouvement, les réflexes vifs, les instincts nomades ainsi que l\'indépendance. Il s\'agit du dernier signe de feuilles.'),
    ZodiacSign(libelle: 'Capricorne', dateDebut: '23-déc', dateFin: '20-janv', description: 'Le signe du capricorne commence au solstice d\'hiver. Il est le symbole de la fin d\'un cycle mais aussi de la naissance d\'un cycle nouveau. Il est associé à la patience, la persévérance, la prudence, la réalisation ainsi que le sens du devoir. Il a pour élément la terre.'),
    ZodiacSign(libelle: 'Verseau', dateDebut: '21-janv', dateFin: '19-févr', description: 'Le signe du verseau a pour symbole la fraternité, l\'indifférence aux choses matérielles, la coopération et la solidarité collective. Il s\'agit d\'un signe lié à l\'air.'),
    ZodiacSign(libelle: 'Poissons', dateDebut: '20-févr', dateFin: '20-mars', description: 'Le dernier signe du zodiaque symbolise l\'émotivité, l\'hypersensibilité, l\'angoisse ou encore l\'imagination. Il est associé à l\'eau.'),
  ];

  for (var sign in zodiacSigns) {
    await dbHelper.insertZodiacSign(sign);
  }

  List<ChineseZodiacSign> chineseZodiacSigns = [
    ChineseZodiacSign(year: 1980, animal: 'Chèvre', description: 'Les Chèvres sont calmes, doux et sympathiques. ...'),
    ChineseZodiacSign(year: 1981, animal: 'Singe', description: 'Les Singes sont vifs, intelligents et curieux. ...'),
    ChineseZodiacSign(year: 1982, animal: 'Coq', description: 'Les Coqs sont observateurs et travailleurs et ils sont toujours courageux. ...'),
    ChineseZodiacSign(year: 1983, animal: 'Chien', description: 'Les Chiens sont mignons, honnêtes et prudents. ...'),
    ChineseZodiacSign(year: 1984, animal: 'Cochon', description: 'Les Cochons sont sentimentals, généreux et studieux. ...'),
    ChineseZodiacSign(year: 1985, animal: 'Rat', description: 'Les rats sont intelligents, débrouillards, versatiles et gentils. ...'),
    ChineseZodiacSign(year: 1986, animal: 'Buffle', description: 'Les buffles sont studieux, fiables, forts, et déterminés. ...'),
    ChineseZodiacSign(year: 1987, animal: 'Tigre', description: 'Les tigres sont braves, confiants et des compétiteurs. ...'),
    ChineseZodiacSign(year: 1988, animal: 'Lapin', description: 'Les lapins sont silencieux, élégants, gentils et responsables. ...'),
    ChineseZodiacSign(year: 1989, animal: 'Serpent', description: 'Les Serpents sont énigmatiques, intelligents et clairvoyants. ...'),
    ChineseZodiacSign(year: 1990, animal: 'Cheval', description: 'Les chevaux sont énergiques, actifs et animés. ...'),
    ChineseZodiacSign(year: 1991, animal: 'Chèvre', description: 'Les Chèvres sont calmes, doux et sympathiques. ...'),
    ChineseZodiacSign(year: 1992, animal: 'Singe', description: 'Les Singes sont vifs, intelligents et curieux. ...'),
    ChineseZodiacSign(year: 1993, animal: 'Coq', description: 'Les Coqs sont observateurs et travailleurs et ils sont toujours courageux. ...'),
    ChineseZodiacSign(year: 1994, animal: 'Chien', description: 'Les Chiens sont mignons, honnêtes et prudents. ...'),
    ChineseZodiacSign(year: 1995, animal: 'Cochon', description: 'Les Cochons sont sentimentals, généreux et studieux. ...'),
    ChineseZodiacSign(year: 1996, animal: 'Rat', description: 'Les rats sont intelligents, débrouillards, versatiles et gentils. ...'),
    ChineseZodiacSign(year: 1997, animal: 'Buffle', description: 'Les buffles sont studieux, fiables, forts, et déterminés. ...'),
    ChineseZodiacSign(year: 1998, animal: 'Tigre', description: 'Les tigres sont braves, confiants et des compétiteurs. ...'),
    ChineseZodiacSign(year: 1999, animal: 'Lapin', description: 'Les lapins sont silencieux, élégants, gentils et responsables. ...'),
    ChineseZodiacSign(year: 2000, animal: 'Dragon', description: 'Les Dragons sont confiants, intelligents et enthousiastes. ...'),
    ChineseZodiacSign(year: 2001, animal: 'Serpent', description: 'Les Serpents sont énigmatiques, intelligents et clairvoyants. ...'),
    ChineseZodiacSign(year: 2002, animal: 'Cheval', description: 'Les chevaux sont énergiques, actifs et animés. ...'),
    ChineseZodiacSign(year: 2003, animal: 'Chèvre', description: 'Les Chèvres sont calmes, doux et sympathiques. ...'),
    ChineseZodiacSign(year: 2004, animal: 'Singe', description: 'Les Singes sont vifs, intelligents et curieux. ...'),
    ChineseZodiacSign(year: 2005, animal: 'Coq', description: 'Les Coqs sont observateurs et travailleurs et ils sont toujours courageux. ...'),
    ChineseZodiacSign(year: 2006, animal: 'Chien', description: 'Les Chiens sont mignons, honnêtes et prudents. ...'),
    ChineseZodiacSign(year: 2007, animal: 'Cochon', description: 'Les Cochons sont sentimentals, généreux et studieux. ...'),
    ChineseZodiacSign(year: 2008, animal: 'Rat', description: 'Les rats sont intelligents, débrouillards, versatiles et gentils. ...'),
    ChineseZodiacSign(year: 2009, animal: 'Buffle', description: 'Les buffles sont studieux, fiables, forts, et déterminés. ...'),
    ChineseZodiacSign(year: 2010, animal: 'Tigre', description: 'Les tigres sont braves, confiants et des compétiteurs. ...'),
    ChineseZodiacSign(year: 2011, animal: 'Lapin', description: 'Les lapins sont silencieux, élégants, gentils et responsables. ...'),
    ChineseZodiacSign(year: 2012, animal: 'Dragon', description: 'Les Dragons sont confiants, intelligents et enthousiastes. ...'),
    ChineseZodiacSign(year: 2013, animal: 'Serpent', description: 'Les Serpents sont énigmatiques, intelligents et clairvoyants. ...'),
    ChineseZodiacSign(year: 2014, animal: 'Cheval', description: 'Les chevaux sont énergiques, actifs et animés. ...'),
    ChineseZodiacSign(year: 2015, animal: 'Chèvre', description: 'Les Chèvres sont calmes, doux et sympathiques. ...'),
    ChineseZodiacSign(year: 2016, animal: 'Singe', description: 'Les Singes sont vifs, intelligents et curieux. ...'),
    ChineseZodiacSign(year: 2017, animal: 'Coq', description: 'Les Coqs sont observateurs et travailleurs et ils sont toujours courageux. ...'),
    ChineseZodiacSign(year: 2018, animal: 'Chien', description: 'Les Chiens sont mignons, honnêtes et prudents. ...'),
    ChineseZodiacSign(year: 2019, animal: 'Cochon', description: 'Les Cochons sont sentimentals, généreux et studieux. ...'),
    ChineseZodiacSign(year: 2020, animal: 'Rat', description: 'Les rats sont intelligents, débrouillards, versatiles et gentils. ...'),
  ];

  for (var sign in chineseZodiacSigns) {
    await dbHelper.insertChineseZodiacSign(sign);
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
