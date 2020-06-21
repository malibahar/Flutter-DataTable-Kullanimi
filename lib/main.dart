import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Ödevi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Datatable Kullanımı'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<Users> users; //Kullanıcıları içerisinde tutacağımız List tanımlaması yapıyoruz
  List<Users> selectedUsers;
  //Tanımlanan kullanıcıları döngü ile listelerken aktarım yapacağımız seçili kullanıcılar List tipinde tanımlanır
  bool sort; //Sıralama için boolean tipinde değişken tanımlaması yapılıyor
  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = Users.getUsers();
    onSortColum(0, sort);
    //### başlangıç sıralamasını statik olarak büyükten küçüğe yapıyoruz (zorunlu değil)
    //### users dizisine Users sınıfı içerisinde bulunan getUsers fonksiyonu ile atama yapıyoruz.
    super.initState();
    //oluşturulan değişkenlere veri atamalarını gerçekleştiriyoruz.
  }
  onSortColum(int columnIndex, bool ascending) {
      if (ascending) {
        users.sort((a, b) => a.name.compareTo(b.name));
      } else {
        users.sort((a, b) => b.name.compareTo(a.name));
      }
      //ascending değişkenini sorgulayıp
      //users lsitesinde name alanına göre sıralama yapıyoruz.
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datatable Kullanımı"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: DataTable(
              sortAscending: sort,
              //### sıralama için başlangıç değerini false olarak belirledik
              sortColumnIndex: 0,
              //### sıralama için kullanılacak alanı belirliyoruz.
              //### (0. indis ad ve soyad)###
              columns: [
                DataColumn(
                    label: Text("Ad Soyad", style: TextStyle(fontSize: 16)),
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        sort = !sort;
                      });
                      onSortColum(columnIndex, ascending);
                    }),
                    //### veri alanlarından ad soyad sütununu oluşuturup;
                    //### basıldığı zaman için sıralama fonksiyonunu çağırıyoruz.
                    //### sort değişkeninin tersini alıyoruz.
                DataColumn(
                    label: Text("Doğum Tarihi", style: TextStyle(fontSize: 16)),
                    ),
                    //### veri alanlarından doğum tarihi sütununu oluşturuyoruz.
              ],
              rows: users
                  .map(
                    (user) => DataRow(
                    selected: selectedUsers.contains(user),
                    //### users değişkenine göre satırları oluşturup,
                    //### her döngü için users içinde bir veri setini user değişkenine aktarıyoruz.
                    cells: [
                      DataCell(
                        TextField(
                          controller:
                          TextEditingController()..text = user.name,
                          //### TextField nesnesinin içerisine user.name değikenini yazdırıyoruz.
                          onChanged: (text) {
                            print("Ad Soyad Değişti: $text");
                            user.name = text;
                          },
                          //### TextField nesnesi için onChanged fonksiyounu oluşturup,
                          //### değişiklik olduğu zaman user.name değişkenini güncelliyoruz.
                        ),
                      ),
                      DataCell(
                        Text(user.birth),
                      ),
                    ]),
                    //### veri listelemesinde satırlar içerisinde hücreleri oluşturuyoruz
              ).toList(),
              //### verileri listelemek satırları oluşturuyoruz.
            ),
          ),
        ),
      ),
    );
  }
}
class Users {
  String name;
  String birth;
  Users({this.name, this.birth});
  //### Users isimli bir sınıf oluşturuyoruz.
  //### Users sınıfı içerisinde gerekli değişken tanımlamalarını yapıyoruz.
  static List<Users> getUsers() {
    return <Users>[
      Users(name: "Muhammed Ali Bahar", birth: "10.10.1995"),
      Users(name: "Atahan	Adanır", birth: "10.10.1995"),
      Users(name: "Zeynep	Ağca", birth: "02.06.1990"),
      Users(name: "Ahmet Kara", birth: "02.06.1990"),
      Users(name: "Sevinç	Ak", birth: "25.12.1998"),
      Users(name: "Büşra Akbulut", birth: "25.12.1998"),
      Users(name: "Eylül Çetinkaya", birth: "15.01.1985"),
      Users(name: "Mehmetcan	Akay", birth: "15.01.1985"),
      Users(name: "Ecem Hatice	Akova", birth: "15.01.1985"),
      Users(name: "Serdar Kaan	Barbaros", birth: "15.01.1985"),
      Users(name: "Gökmen	Battal", birth: "15.01.1985"),
      Users(name: "Tubanur	Dereli", birth: "15.01.1985"),
      Users(name: "Ziya	Doğramacı", birth: "15.01.1985"),
      Users(name: "Tarık	Güven", birth: "15.01.1985"),
    ];
  }
  //### getUsers isimli bir fonksiyon oluşturup bu fonksiyon içerisinde statik veri atamalarını gerçekleştiriyoruz.
}