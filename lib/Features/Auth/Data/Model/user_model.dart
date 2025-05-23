import 'package:equatable/equatable.dart';

import '../../../Schedule/Data/Model/appointment_model.dart';


class UserModel extends Equatable {
  final String uid;
  final String email;
  final String? name;
  final String role;
  final List<Appointment> appointments;

  const UserModel({
    required this.uid,
    required this.email,
    this.name,

    this.role = 'patient',
    this.appointments = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,

      role: json['role'] as String? ?? 'patient',
      appointments: (json['appointments'] as List<dynamic>?)
              ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'role': role,
      'appointments': appointments.map((e) => e.toJson()).toList(),
    };
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? phoneNumber,
    String? photoUrl,
    String? role,
    List<Appointment>? appointments,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,

      role: role ?? this.role,
      appointments: appointments ?? this.appointments,
    );
  }

  @override
  List<Object?> get props =>
      [uid, email, name, role, appointments];
}
