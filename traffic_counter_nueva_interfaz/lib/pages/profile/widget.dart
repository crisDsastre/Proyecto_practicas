import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MainTheme.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MainTheme.backgroundColorSection, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Icon(
              Icons.person_outline_outlined,
              size: 90,
              color: MainTheme.iconSettingsColor,
            ),
          ),
          const SizedBox(height: 5),
          profileField(context: context, label: 'Name', value: 'RoviName'),
          profileField(
            context: context,
            label: 'Surname',
            value: 'RoviSurname',
          ),
          profileField(
            context: context,
            label: 'Username',
            value: 'RoviUsername',
          ),
          profileField(
            context: context,
            label: 'Email',
            value: 'RoviUser@gmail.com',
          ),
        ],
      ),
    );
  }

  Widget profileField({
    required BuildContext context,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600, // Estilo suave como en los ajustes
            ),
          ),
          const SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              value,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 15,
                color: MainTheme.textColorDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
