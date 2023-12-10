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
  int? cell;
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
      cell: 0,
      block: '',
      wing: '',
      prison: '',
      entryDay: DateTime.now(),
      dayOut: DateTime.parse('20/10/2025'),
      photo: '',
    );
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? bi;
  String? phone;
  DateTime? nasc;
  String? photo;
  int? acesso;

  User(
      {this.id,
      this.name,
      this.email,
      this.bi,
      this.photo,
      this.nasc,
      this.phone,
      this.acesso});
}

class Bloco {
  int? id;
  String? name;

  Bloco({
    this.id,
    this.name,
  });
}

class Acesso {
  int? id;
  String? name;

  Acesso({
    this.id,
    this.name,
  });
}

class Cela {
  int? id;
  String? name;
  int? bloco;

  Cela({this.id, this.name, this.bloco});
}

var _faker = Faker();

List<User> users = List.generate(10, (index) {
  return User(
      id: index + 1,
      name: '${_faker.person.firstName()} ${_faker.person.lastName()}',
      email: _faker.internet
          .email(), // 40 é igual ao numero de presos se for 41 nunca vai achar um preso pra fazer relação
      bi: _faker.randomGenerator.fromCharSet('35894ABCREA32DS', 14).toString(),
      nasc: DateTime.parse('1995-10-30'),
      phone: _faker.phoneNumber.toString(),
      acesso: _faker.randomGenerator.integer(2, min: 1));
});

List<Bloco> blocos = List.generate(10, (index) {
  return Bloco(id: ++index, name: _faker.person.firstName());
});

List<Cela> celas = List.generate(50, (index) {
  return Cela(
      id: ++index,
      name: _faker.person.firstName(),
      bloco: _faker.randomGenerator.integer(10, min: 1));
});

List<Acesso> acessos = [
  Acesso(id: 1, name: 'Administrador'),
  Acesso(id: 3, name: 'Funcionário')
];

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
    cell: _faker.randomGenerator.integer(50, min: 1),
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
        id: (++index).toString(),
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
