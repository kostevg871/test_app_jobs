import 'package:flutter/material.dart';
import 'package:json_test_project/models/users.dart';

class UserInfoWidget extends StatelessWidget {
  final Users user;

  UserInfoWidget(this.user);

  @override
  Widget build(BuildContext context) {
    final title = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    final subtitle = TextStyle(fontSize: 20);
    final curse = TextStyle(fontSize: 15, fontStyle: FontStyle.italic);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("User Info", style: title),
          Text("Name: ${user.name}", style: subtitle),
          Text("e-mail: ${user.email}", style: subtitle),
          Text("phone: ${user.phone}", style: subtitle),
          Text("website: ${user.website}", style: subtitle),
          Row(
            children: [
              Icon(Icons.work, size: 30),
              Text("Working (company)", style: title),
            ],
          ),
          Text("Company name: ${user.company.name}", style: subtitle),
          Text("bs: ${user.company.bs}", style: subtitle),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("\"${user.company.catchPhrase}\" ",
                style: curse, textAlign: TextAlign.right),
          ),
          Text(
            "Address: ${user.address.city}, " +
                "${user.address.street}, " +
                "${user.address.suite}, " +
                "${user.address.zipcode} ",
            style: subtitle,
          ),
        ],
      ),
    );
  }
}
