import 'dart:core';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Visita {
  String? id;
  String? nameOfVisitor;
  String? photo;
  String? idOfPrisoner;
  String? sexo;
  DateTime? dateOfVisit;
  TimeOfDay? arrivalTime;
  TimeOfDay? leftAt;
  int? estadoVista;
  int? age;
  int? totalVisitas;

  Visita(
      {this.id,
      this.photo,
      this.nameOfVisitor,
      this.idOfPrisoner,
      this.dateOfVisit,
      this.arrivalTime,
      this.leftAt,
      this.estadoVista = 0,
      this.age,
      this.totalVisitas,
      this.sexo});
}

class Prisoner {
  int? id;
  String? name;
  String? crime;
  String? cell;
  String? block;
  String? wing;
  String? prison;
  String? photo;
  DateTime? entryDay;
  DateTime? dayOut;

  Prisoner({
    this.id,
    this.name,
    this.crime,
    this.cell,
    this.block,
    this.wing,
    this.prison,
    this.dayOut,
    this.entryDay,
    this.photo,
  });

  factory Prisoner.empty() {
    return Prisoner(
      id: 0,
      name: '',
      crime: '',
      cell: '',
      block: '',
      wing: '',
      prison: '',
      entryDay: DateTime.now(),
      dayOut: DateTime.parse('20/10/2025'),
      photo: '',
    );
  }
}

var _faker = Faker();

List<Prisoner> presos = List.generate(
  40,
  (index) => Prisoner(
    id: index + 1,
    name: '${_faker.person.firstName()} ${_faker.person.lastName()}',
    crime: index % 2 == 0
        ? 'Homicidio Doloso'
        : index % 3 == 0
            ? 'Roubo'
            : 'Trafico de Drogas',
    cell:
        '${_faker.randomGenerator.fromCharSet("ABCDEFGHIJKLMN", 1)}-${_faker.randomGenerator.integer(100)}',
    block: _faker.randomGenerator.fromCharSet("ABCDEFGHIJKLMN", 1),
    wing: _faker.randomGenerator.fromCharSet("ABCDEFGHIJKLMN", 1),
    prison: 'Cadeia de Viana',
    dayOut: DateTime.parse('2025-10-30'),
    entryDay: DateTime.now(),
    photo: _faker.image.image(
      keywords: ['people'],
      random: true,
    ),
  ),
);

List<Visita> visitas = List.generate(
    80,
    (index) => Visita(
        id: index.toString(),
        nameOfVisitor:
            '${_faker.person.firstName()} ${_faker.person.lastName()}',
        idOfPrisoner:
            '${_faker.randomGenerator.integer(40, min: 1)}', // 40 é igual ao numero de presos se for 41 nunca vai achar um preso pra fazer relação
        dateOfVisit: _faker.date.dateTime(),
        arrivalTime: TimeOfDay(
            hour: _faker.randomGenerator.integer(24),
            minute: _faker.randomGenerator.integer(60)),
        leftAt: TimeOfDay(
          hour: _faker.randomGenerator.integer(24),
          minute: _faker.randomGenerator.integer(60),
        ),
        estadoVista: 2,
        photo: _faker.image.image(
          keywords: ['people'],
          random: true,
        ),
        age: _faker.randomGenerator.integer(80, min: 18),
        sexo: _faker.randomGenerator.integer(1, min: 0) == 1
            ? 'Masculino'
            : 'Feminino',
        totalVisitas: _faker.randomGenerator.integer(40, min: 1)));
