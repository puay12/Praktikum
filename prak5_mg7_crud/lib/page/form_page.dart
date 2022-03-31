import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prak5_mg7_crud/page/detail_page.dart';

class FormPage extends StatefulWidget {
  static const routeName = '/form';

  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _jamController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('tmpt_wisata');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Wishlist",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                child: Text('Simpan Tempat Wisata'),
                onPressed: () async {
                  final String? nama = _namaController.text;
                  final double? harga = double.tryParse(_hargaController.text);
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
                        await _productss.add({
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
        ),
      ), 
    );
  }
}
