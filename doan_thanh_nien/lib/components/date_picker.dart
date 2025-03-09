// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/event/signup_event.dart';
import '../bloc/signup_bloc.dart';
import '../bloc/state/signup_state.dart';

class DatePicker extends StatelessWidget {
  final TextEditingController dateOfBirthController;

  const DatePicker({
    super.key,
    required this.dateOfBirthController,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (selectedDate != null) {
          final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

          dateOfBirthController.text = formattedDate;

          context.read<SignUpBloc>().add(
                DateOfBirthChanged(formattedDate),
              );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            final dateOfBirth = context.read<SignUpBloc>().dateOfBirth;
            return Text(
              dateOfBirth.isEmpty ? 'Chọn ngày sinh' : dateOfBirth,
              style: const TextStyle(color: Colors.black),
            );
          },
        ),
      ),
    );
  }
}
