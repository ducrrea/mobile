import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/registro_model.dart';

class RegistroController {
  static Database? _database;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Inicializa ou recupera a instância do banco SQLite
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'senai_checkin.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE registros(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            data_hora TEXT,
            latitude REAL,
            longitude REAL,
            observacao TEXT,
            caminho_foto TEXT
          )
          ''',
        );
      },
    );
  }

  // Operações do CRUD
  Future<int> inserirRegistro(RegistroModel registro) async {
    final db = await database;
    int resultado = await db.insert('registros', registro.toMap());
    await tocarSomConfirmacao();
    return resultado;
  }

  Future<List<RegistroModel>> obterRegistros() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('registros', orderBy: 'id DESC');
    return List.generate(maps.length, (i) => RegistroModel.fromMap(maps[i]));
  }

  // Gestão de Permissões e Hardware
  Future<bool> solicitarPermissoes() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.location,
    ].request();

    return statuses[Permission.camera]!.isGranted &&
           statuses[Permission.location]!.isGranted;
  }

  Future<Position?> obterLocalizacaoAtual() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<String?> capturarFoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    return photo?.path;
  }

  Future<void> tocarSomConfirmacao() async {
    try {
      // Toca um efeito sonoro indicando sucesso no registro
      await _audioPlayer.play(UrlSource('https://assets.mixkit.co/active_storage/sfx/2869/2869-preview.mp3'));
    } catch (e) {
      // Caso ocorra falha de rede/áudio, a operação principal não é interrompida
    }
  }
}