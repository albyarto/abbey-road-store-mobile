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
 
