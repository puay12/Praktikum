import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prak5_mg7_crud/page/detail_page.dart';
import 'package:prak5_mg7_crud/page/form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const routeName = '/';

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _jamController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('tmpt_wisata');

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _namaController.text = documentSnapshot['nama'];
      _descController.text = documentSnapshot['desc'];
      _lokasiController.text = documentSnapshot['lokasi'];
      _hargaController.text = documentSnapshot['harga_tiket'].toString();
      _jamController.text = documentSnapshot['jam_operasional'];
      _imgController.text = documentSnapshot['img'];
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              // prevent the soft keyboard from covering text fields
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _namaController,
                decoration:
                    const InputDecoration(labelText: 'Nama Tempat Wisata'),
              ),
              TextField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
              ),
              TextField(
                controller: _lokasiController,
                decoration: const InputDecoration(labelText: 'Lokasi'),
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _hargaController,
                decoration: const InputDecoration(
                  labelText: 'Harga Tiket',
                ),
              ),
              TextField(
                controller: _jamController,
                decoration:
                    const InputDecoration(labelText: 'Jam Operasional'),
              ),
              TextField(
                controller: _imgController,
                decoration: const InputDecoration(labelText: 'Link Gambar'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Update'),
                onPressed: () async {
                  final String? nama = _namaController.text;
                  final double? harga =
                      double.tryParse(_hargaController.text);
                  final String? lokasi = _lokasiController.text;
                  final String? jam = _jamController.text;
                  final String? img = _imgController.text;
                  final String? desc = _descController.text;
                  if (nama != null &&
                      harga != null &&
                      lokasi != null &&
                      jam != null &&
                      img != null &&
                      desc != null) {
                      // Update the product
                      await _productss.doc(documentSnapshot!.id).update({
                        "nama": nama,
                        "harga_tiket": harga,
                        "desc": desc,
                        "lokasi": lokasi,
                        "jam_operasional": jam,
                        "img": img
                      });
                    }

                    // Clear the text fields
                    _namaController.text = '';
                    _hargaController.text = '';
                    _descController.text = '';
                    _lokasiController.text = '';
                    _hargaController.text = '';
                    _jamController.text = '';
                    _imgController.text = '';

                    // Hide the bottom sheet
                    Navigator.of(context).pop();
                }
              )
            ],
          ),
        );
      }
    );
  }

  // Deleteing a product by id
  Future<void> _deleteProduct(String productId) async {
    await _productss.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Berhasil menghapus tempat wisata!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist Wisata Indonesia",
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: StreamBuilder(
            stream: _productss.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DetailScreen.routeName, arguments: documentSnapshot);
                        },
                        child:  Row(
                          children: <Widget> [
                            Expanded(
                              flex: 1,
                              child: Image.network(documentSnapshot['img']),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget> [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            documentSnapshot['nama'],
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        // Press this button to edit a single product
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () =>
                                            _update(documentSnapshot)
                                        ),
                                        // This icon button is used to delete a single product
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () =>
                                            _deleteProduct(documentSnapshot.id)
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      documentSnapshot['lokasi'],
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0
                                      ),
                                    ),
                                    Text(
                                      documentSnapshot['desc'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                );
              } else {
                return Text("Gagal wes");
              }
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, FormPage.routeName);
        },
        tooltip: 'Tambah Wishlist',
        child: const Icon(Icons.add),
      ),
    );
  }
}