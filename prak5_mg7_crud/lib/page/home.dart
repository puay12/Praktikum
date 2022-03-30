import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _jamController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('tmpt_wisata');

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
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
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? nama = _namaController.text;
                    final double? harga =
                        double.tryParse(_hargaController.text);
                    if (nama != null && harga != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _productss
                            .add({"nama": nama, "harga_tiket": harga});
                      }

                      if (action == 'update') {
                        // Update the product
                        await _productss
                            .doc(documentSnapshot!.id)
                            .update({"nama": nama, "harga_tiket": harga});
                      }

                      // Clear the text fields
                      _namaController.text = '';
                      _hargaController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a product by id
  Future<void> _deleteProduct(String productId) async {
    await _productss.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wisata Indonesia",
        ),
      ),
      body: Container(
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
                      child: ListTile(
                        title: Text(documentSnapshot['nama']),
                        subtitle: Text(documentSnapshot['harga_tiket'].toString()),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              // Press this button to edit a single product
                              IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () =>
                                      _createOrUpdate(documentSnapshot)),
                              // This icon button is used to delete a single product
                              IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () =>
                                      _deleteProduct(documentSnapshot.id)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Text("Gagal wes");
              }
            }
          ),
      ),
    );
  }
}
