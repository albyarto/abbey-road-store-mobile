# Abbey Road Store

Abbey Road Store adalah aplikasi e-commerce yang menjual berbagai hal tentang The Beatles.

## Tugas
<details>
  <summary>
  <b>Tugas 7</b>
  </summary>

  ### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
  **Stateless widget** adalah widget yang tidak memiliki keadaan internal yang dapat berubah selama siklus hidupnya. Artinya, widget ini tidak dapat memperbarui atau mengubah tampilannya setelah pertama 
  kali dirender. Contoh penggunaannya adalah untuk elemen-elemen UI yang tetap, seperti teks atau ikon statis. Sebaliknya, **stateful widget** adalah widget yang memiliki keadaan internal dan bisa berubah 
  ubah selama aplikasi berjalan. Stateful widget dapat merespons interaksi pengguna atau perubahan data dengan memperbarui tampilannya secara dinamis. Perbedaan utama antara stateless dan stateful widget 
  adalah bahwa stateless widget hanya dirender sekali, sedangkan stateful widget dapat dirender ulang ketika terjadi perubahan pada statusnya.
  
  ### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
  Pada proyek ini, beberapa widget yang digunakan misalnya adalah Text, dan Button. Text digunakan untuk menampilkan tulisan statis pada layar, seperti nama aplikasi atau informasi nama,kelas,dan npm. 
  Button digunakan untuk membuat tombol interaktif yang dapat ditekan pengguna, yang sementara hanya memunculkan _Snackbar_ dengan tulisan "Kamu telah menekan tombol ...".
  
  ### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
  Fungsi **setState()** digunakan dalam stateful widget untuk memberitahu Flutter bahwa ada perubahan pada keadaan internal widget, sehingga widget perlu dirender ulang. Variabel-variabel yang dapat 
  terdampak oleh **setState()** adalah variabel-variabel yang disimpan dalam state dan digunakan untuk mengelola kondisi UI, seperti nilai-nilai counter, status loading, atau tampilan tertentu yang berubah 
  tergantung pada aksi pengguna atau data yang didapatkan dari server.
  
  ### Jelaskan perbedaan antara const dengan final.
  Perbedaan antara **const** dan **final** di Flutter adalah bahwa **const** digunakan untuk variabel atau objek yang bersifat konstan pada saat kompilasi dan tidak dapat berubah selama aplikasi berjalan.    **Final**, di sisi lain, mengunci nilai variabel hanya setelah diinisialisasi dan dapat diatur saat runtime, tetapi setelah diatur nilainya tidak bisa diubah.
  
  ### Cara mengimplementasikan checklist-checklist tugas 7.
  #### Checklist 1: Membuat program flutter

  Pada direktori yang ingin digunakan untuk menyimpan aplikasi flutter, jalankan program dibawah ini.

  ```flutter create abbey_road_store```

  #### Checklist 2&3: Membuat tombol sederhana dan Mengimplementasikan warna-warna yang berbeda untuk setiap tombol

  Di class `MyHomePage`, ubah return pada widget `build` untuk memunculkan tombol.

  ```
  return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Abbey Road Co." dengan teks putih dan tebal.
        title: const Text(
          'Abbey Road Co.',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Abbey Road Store',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  ```

  Tambahkan juga widget `ItemCard`.

  ```
  class ItemHomepage {
      final String name;
      final IconData icon;
      final Color color; // Menambahkan properti warna
  
      ItemHomepage(this.name, this.icon, this.color);
  }

  class ItemCard extends StatelessWidget {
    // Menampilkan kartu dengan ikon dan nama.
  
    final ItemHomepage item;  
    
    const ItemCard(this.item, {super.key}); 
  
    @override
    Widget build(BuildContext context) {
      return Material(
         // Menggunakan warna dari item.
        color: item.color,
        // Membuat sudut kartu melengkung.
        borderRadius: BorderRadius.circular(12),
        
        child: InkWell(
          // Aksi ketika kartu ditekan.
          onTap: () {
            // Menampilkan pesan SnackBar saat kartu ditekan.
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
              );
          },
          // Container untuk menyimpan Icon dan Text
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                // Menyusun ikon dan teks di tengah kartu.
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
  ```
  Field untuk tombol-tombolnya
  ```
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.inventory, Colors.blue[600]!),
    ItemHomepage("Tambah Produk", Icons.add,Colors.green[600]!),
    ItemHomepage("Logout", Icons.logout, Colors.red[600]!),
  ];
  ```
  #### Checklist 4: Memunculkan _snackbar_ ketika tombol di klik
  
  Tambahkan properti berikut pada bagian `return Material` pada class `ItemCard`.
  
  ```
  onTap: () {
            // Menampilkan pesan SnackBar saat kartu ditekan.
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
              );
          },
  ```
</details>

<details>
  <summary>
  <b>Tugas 8</b>
  </summary>

  ### Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
  Const di Flutter digunakan untuk membuat nilai konstan pada waktu kompilasi (compile-time constant). Berikut penjelasan detailnya:
  Keuntungan menggunakan const:
  - Performa lebih baik karena widget const hanya dibuat sekali dan digunakan kembali
  - Menghemat memori karena instance yang sama dipakai ulang
  - Membantu mencegah perubahan yang tidak diinginkan pada nilai
  
  Kapan sebaiknya menggunakan const:
  - Untuk nilai yang tidak akan berubah sepanjang aplikasi berjalan
  - Pada widget yang seluruh propertinya bersifat immutable
  - Pada koleksi data yang tetap (fixed collection)

  Kapan sebaiknya tidak menggunakan const:
  - Pada widget yang propertinya bisa berubah
  - Ketika nilai tergantung pada runtime/waktu eksekusi
  - Saat menggunakan data dinamis
    
  ### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
  Column dan Row adalah layout widget dasar di Flutter untuk mengatur tata letak:
  Column:
  - Mengatur widget secara vertikal (dari atas ke bawah)
  - Cocok untuk daftar vertikal, form, atau konten yang disusun ke bawah

  Contoh implementasi :
  ```
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Item 1'),
      SizedBox(height: 8),
      Text('Item 2'),
      SizedBox(height: 8),
      Text('Item 3'),
    ],
  )
  ```

  Row:
  - Mengatur widget secara horizontal (dari kiri ke kanan)
  - Cocok untuk toolbar, menu horizontal, atau konten yang berjajar

  Contoh implementasi :
  ```
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.star),
      Text('4.5'),
      TextButton(
        onPressed: () {},
        child: Text('Review'),
      ),
    ],
  )
  ```

  ### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
  #### Elemen input Flutter yang digunakan dalam form tugas:
  - TextFormField: Untuk memasukkan nama, jumlah, dan deskripsi produk.
  - ElevatedButton: Untuk menyimpan data setelah form divalidasi.
    
  #### Elemen input Flutter lain yang tidak digunakan:
  - DatePicker: Untuk memilih tanggal.
  - DropdownButtonFormField: Untuk memilih satu opsi dari daftar.
  - Slider: Untuk memilih nilai dalam rentang tertentu.
  - TimePicker: Untuk memilih waktu.
  - Checkbox: Untuk input pilihan ya/tidak.
  - Radio: Untuk memilih satu dari beberapa opsi.
  - Switch: Untuk input boolean (true/false).
    
  ### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
  Pada aplikasi ini, agar membuat tampilan aplikasi konsisten, saya mengatur theme pada berkas `main.dart` seperti di code ini:
  ```
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFF1A237E),
          secondary: Color(0xFF7986CB),
          surface: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: MyHomePage(),
    );
  }
  ```
  ### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
  Pada aplikasi ini, navigasi halaman-halaman menggunakan `left_drawer` dengan Widget Drawer. Untuk navigasi dari drawer ke halaman lain menggunakan push replacement, berikut contoh ke halaman home:
  ```
   onTap: () {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ));
},
  ```
</details>

<details>
  <summary>
  <b>Tugas 9</b>
  </summary>

  ### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
  Data JSON yang diterima dari API dapat dipetakan ke dalam objek dengan atribut yang terstruktur, sehingga kita dapat mengaksesnya dengan cara yang lebih intuitif, seperti `data.itemName`, daripada 
  menggunakan indeks atau kunci seperti `data['itemName']`. Selain itu, model membantu memastikan data yang diterima sesuai dengan struktur yang diharapkan, sehingga risiko error akibat ketidaksesuaian 
  tipe data dapat diminimalkan. Tanpa model, error seperti `KeyError` atau `NullPointerException` mungkin terjadi jika struktur data JSON berubah atau tidak sesuai ekspektasi, terutama saat mengakses kunci 
  secara langsung.
  
  ### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
  Library HTTP di Flutter berfungsi sebagai alat komunikasi antara aplikasi dan server menggunakan protokol HTTP. Dalam tugas ini, library ini digunakan untuk mengambil data dari API atau mengirim data ke 
  server. Dengan library HTTP, berbagai jenis permintaan seperti GET, POST, PUT, dan DELETE dapat dilakukan, memungkinkan aplikasi berinteraksi dengan server untuk mendapatkan atau mengirimkan data sesuai 
  kebutuhan.
  
  ### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
  CookieRequest adalah fungsi yang menangani permintaan HTTP sambil mengelola cookie secara otomatis. Fungsi ini menjaga sesi pengguna dengan menyimpan dan mengirimkan cookie yang diperlukan untuk 
  autentikasi. Instance CookieRequest digunakan secara global di seluruh aplikasi, sehingga memastikan konsistensi sesi pengguna di berbagai komponen dan menghindari kode yang berulang.
  
  ### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
  Pengiriman data antara Flutter dan Django melibatkan beberapa tahapan. Pengguna memasukkan data melalui antarmuka Flutter, seperti form atau elemen interaktif lainnya. Data ini kemudian dikirim ke 
  backend Django melalui permintaan HTTP, biasanya dengan metode POST untuk data baru atau GET untuk data yang sudah ada. Di sisi Django, data diproses melalui view dan serializer, memastikan format data 
  sesuai sebelum disimpan ke database. Setelah berhasil diproses, Django mengirimkan respons JSON yang diterima oleh Flutter. Flutter kemudian memproses respons ini menjadi objek yang dapat ditampilkan 
  melalui widget seperti `ListView` atau `Card`. Proses ini memungkinkan transfer data antara frontend Flutter dan backend Django secara aman, terstruktur, dan efisien.
  
  ### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
  **Mekanisme autentikasi Register, Login, dan Logout:**  
  - **Register:** Data seperti username, password, dan konfirmasi password dikirim ke endpoint register melalui permintaan POST JSON. Endpoint ini memanggil fungsi `register` pada `views.py` untuk 
    memvalidasi data, seperti memeriksa kesamaan password dan menghindari duplikasi username. Jika valid, user baru dibuat, dan respons JSON dengan username dikirim kembali ke Flutter.  
  - **Login:** Flutter mengirim POST JSON ke endpoint login, yang memanggil fungsi `login` di `views.py`. Fungsi ini menggunakan `authenticate` untuk memverifikasi username dan password. Jika berhasil, 
    respons JSON dikirimkan ke Flutter, dan pengguna diarahkan ke halaman utama.  
  - **Logout:** Fungsi logout mengirimkan permintaan ke Django untuk menjalankan `auth_logout`. Setelah logout berhasil, Django mengembalikan respons JSON yang diterima Flutter untuk memastikan sesi telah 
    diakhiri.
     
  ### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
  #### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
  1. Membuat sebuah view pada aplikasi baru (authentication) di project django 
     ```python
        ...
        @csrf_exempt
        def register(request):
            if request.method == 'POST':
                data = json.loads(request.body)
                username = data['username']
                password1 = data['password1']
                password2 = data['password2']
        ...
     ```
  2. Membuat stateful page pada umumnya
  3. Membuat form yang berisi input username, password, dan konfirmasi password
  4. Membuat logic button registrasi
     ```dart
      final response = await request.postJson(
       "http://localhost:8000/auth/register/",
       jsonEncode({
         "username": username,
         "password1": password1,
         "password2": password2,
       }));
     ```
  5. Jika registrasi berhasil maka pengguna akan diarahkan ke login page
     ```dart
        ...
          Navigator.pushReplacement(
             context,
             MaterialPageRoute(
                 builder: (context) => const LoginPage()),
          );
        ...
     ```
     
  #### Membuat halaman login pada proyek tugas Flutter.
  1. Membuat view pada aplikasi baru (authentication) di Project Django
     ```python
        @csrf_exempt
        def login(request):
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
     ```
  2. Membuat stateful page pada umumnya
  3. Membuat form yang berisi username dan password
  4. Membuat logic button login
     ```dart
     ...
        ElevatedButton(
          onPressed: () async {
            String username = _usernameController.text;
            String password = _passwordController.text;

            final response = await request
                .login("http://127.0.0.1:8000/auth/login/", {
              'username': username,
              'password': password,
            });

            if (request.loggedIn) {
              String message = response['message'];
              String uname = response['username'];
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage()),
                );
     ...
     ```
  
  #### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
  1. Membuat view login, logout, dan registrasi
  2. Memanggil endpoints melalui request di Flutter
  3. Memproses output JSON
  
  #### Membuat model kustom sesuai dengan proyek aplikasi Django.
  1. Mengecek konten dari `localhost:8000/json`
  2. Generate model dart dengan bantuan website Quicktype
  3. Membuat file baru bernama `product_entry.dart` untuk meletakan model yang telah digenerate sebelumnya
  
  #### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
  1. Membuat page stateful pada umumnya
  2. Membuat function untuk melakukan fetching json:
     ```dart
         Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {

          final response = await request.get('http://127.0.0.1:8000/json/');
          
          // Melakukan decode response menjadi bentuk json
          var data = response;
          
          // Melakukan konversi data json menjadi object ProductEntry
          List<ProductEntry> listProduct = [];
          for (var d in data) {
            if (d != null) {
              listProduct.add(ProductEntry.fromJson(d));
            }
          }
          return listProduct;
        }
     ```
  4. Menggunakan Future Builder pada body dari Scaffold:
     ```dart
     ...
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
     ...
     ```
     Hal ini dilakukan untuk melakukan fetching json secara asyncronus. Ketika data belum terload, maka akan ada loder yang diperlihatkan ke pengguna. Jika data sudah berhasil terload, maka data akan langsung ditampilkan dalam bentuk list.
     
  #### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
  1. Membuat sebuah stateful page pada umumnya
  2. Menyatakan variabel-variabel yang menjadi atribut dari page detail
     ```dart
        int user;
        String name;
        int price;
        String description;
        int amount;
      
        Fields({
            required this.user,
            required this.name,
            required this.price,
            required this.description,
            required this.amount,
        });
     ```
  4. Menghandle jika card product di klik di halaman list product
     ```dart
        ...
        return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
        ...
     ```
  6. Menggunakan atribut untuk ditampilkan pada halaman detail
     ```dart
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${product.fields.name}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              "Desc:\n${product.fields.description}",
              style: const TextStyle(color: Colors.black),
              softWrap:
                  true,
            ),
            const SizedBox(height: 12),
            Text(
              "Price: Rp ${product.fields.price}",
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 12),
            Text(
              "Stock Amount: ${product.fields.amount}",
              style: const TextStyle(color: Colors.black),
            ),
     ```
  
  #### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
  Filter berdasarkan pengguna telah dihandle melalui view show_json di projek django yaitu:
  ```python
     ...
      data = Product.objects.filter(user=request.user)
     ...
  ```
  Dengan filter ini, maka dijamin bahwa produk yang ditampilkan adalah milik pengguna yang sedang login saat ini.
<details>
