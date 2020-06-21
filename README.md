# datatablekullanimi

DataTable (İsim ve Doğum Yılından oluşan sıralaması değiştirilebilen ve isimleri editable olan datatable)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Flutter DataTable Kullanımı
DataTable: Excel sayfalarına benzeyen bir yapıya sahip olan; satır ve sütunlardan oluşur, veri listelemeleri için kullanılır. Sütunlar veri alanlarını, satırlar ise verileri oluşturur. DataTable sayesinde tablonun sıralaması değiştirilebilir, satır seçim işlemi ve buna bağlı olaylar gerçekleştirilebilir. 
DataTable sütunlar ve satırlarda oluşur. column özelliği DataColumn dizisini alır ve rows özelliği de DataRow dizisini alır. Her DataRow, DataCell dizisini alan hücre özelliğine sahiptir.
DataColumn özelliği Widget değerini alır. DataCell ayrıca widget'ı bir değer olarak alır. Bu sayede metin, resim, simge, onay kutusu veya başka herhangi bir widget hücreler içerisinde kullanılabilir.

    DataTable(
        columns: [DataColumn(label: Text(Sıra)), DataColumn(label: Text('Ad')), ], 
        rows: [DataRow(
             cells: [DataCell(Text('1')),DataCell(Text('Muhammed Ali')),])
    ],)
Örnek kod yapısında da görüldüğü üzere sütunlar aracılığıyla veri alanları belirlenir. Sonrasında da satır ile veriler eklenir. Satırlar içerisinde hücreler oluşturulup, her hücre içerisine sütun karşılığında ki veri eklenir.

    DataTable ({    
    Özellik Değer,
    @zorunlu List<DataColumn> columns,
    int sortColumnIndex,
    bool sortAscending: true,
    ValueSetter<bool> onSelectAll,
    double dataRowHeight: kMinInteractiveDimension,
    double headingRowHeight: 56.0,
    double horizontalMargin: 24.0,
    double columnSpacing: 56.0,
    bool showCheckboxColumn: true,
    double dividerThickness: 1.0,
    @zorunlu List<DataRow> rows
    })
DataTable widget’ının aldığı özellikler yukarıda ki gibi olmalıdır. Burada rows ve columns bölümleri zorunludur. Diğerleri ise isteklerinize göre düzenleyebilirsiniz. 

Columns: List tipinde bir dizi değeri almaktadır. Belirtilmesi zorunludur.

Rows: List titpinde bir dizi değeri almaktadır. Belirtilmesi zorunludur.

SortColumnIndex: Verilerin sıralaması için kullanılacak veri alanını belirtmektedir. Oluşturulan tablonun sütun indisi eklenerek belirlenir. 0 ve column dizisi uzunluğu arasında bir değer almaktadır.

SortAscendin: Oluşturulan listenin sıralamasını belirtir true/false değer almaktadır. True değeri küçükten büyüğe, false değer, büyükten küçüğe sıralama yapmaktadır.

OnSelectAll: Oluşturulan listede tüm alanların seçilmesi durumda (Tablonun başında bulun hepsini seç onay kutucuğu işaretlendiği zaman) yapılacak işlemleri belirtir.

DataRowHeight: Veri alanlarının başlık bölümü için satır yüksekliğini ayarlamaktadır.

HorizontalMargin: Yatay dış boşluk değerini ayarlamaktadır. 

ColumnSpacing: Sütunların genişliklerini ayarlamak için kullanılmaktadır.

ShowCheckboxColumn: Satırlar için checkedbox eklemektedir. Not; Mevcut sürümde bulunmamaktadır, sürüm değiştirmek gerekmektedir. Bu yüzden bunun yerine onSelectChanged fonksiyonu kullanılmaktadır.

Flutter DataTable Widget Örnek Uygulama:

 
 
 
 		        
