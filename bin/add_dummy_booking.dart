#!/usr/bin/env dart

import 'dart:io';
import 'package:args/args.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oh_db_models/oh_db_models.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('projectId', abbr: 'p', help: 'Firebase project ID', mandatory: true)
    ..addOption('apiKey', abbr: 'k', help: 'Firebase API key', mandatory: true)
    ..addOption('appId', abbr: 'a', help: 'Firebase app ID', mandatory: true)
    ..addOption('messagingSenderId', abbr: 'm', help: 'Firebase messaging sender ID', mandatory: true)
    ..addOption('collection', abbr: 'c', help: 'Firestore collection name', defaultsTo: 'bookings')
    ..addFlag('help', abbr: 'h', help: 'Show usage information', negatable: false);

  late ArgResults argResults;
  try {
    argResults = parser.parse(arguments);
  } catch (e) {
    print('Error parsing arguments: $e');
    print(parser.usage);
    exit(1);
  }

  if (argResults['help'] as bool) {
    print('Add dummy booking to Firestore');
    print('');
    print('Usage: dart run bin/add_dummy_booking.dart [options]');
    print('');
    print(parser.usage);
    print('');
    print('Example:');
    print('  dart run bin/add_dummy_booking.dart -p myproject -k api_key -a app_id -m sender_id');
    exit(0);
  }

  final projectId = argResults['projectId'] as String;
  final apiKey = argResults['apiKey'] as String;
  final appId = argResults['appId'] as String;
  final messagingSenderId = argResults['messagingSenderId'] as String;
  final collection = argResults['collection'] as String;

  print('Initializing Firebase...');
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
    ),
  );

  print('Adding dummy booking to collection "$collection"...');
  try {
    final firestore = FirebaseFirestore.instance;
    await addDummyBookingToFirestore(firestore, collection);
    print('✅ Dummy booking added successfully!');
    print('Document ID: booking_12345');
  } catch (e) {
    print('❌ Error adding dummy booking: $e');
    exit(1);
  }
}