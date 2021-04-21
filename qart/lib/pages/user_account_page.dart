import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qart/utils/config.dart';
import 'package:qart/widgets/custom_text.dart';

class UserAccountPage extends StatelessWidget {
  Widget buildUserDetail(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            fontWeight: FontWeight.w500,
            text: "$label",
            fontSize: 16.0,
          ),
          TextField(
            readOnly: true,
            controller: TextEditingController(text: value),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Config.getPageHeader("User Account"),
          SizedBox(
            height: 10.0,
          ),
          Container(
            color: Config.grayColor,
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                  "assets/images/${Config.currentUserInfo.imgUrl}",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          buildUserDetail("First Name", Config.currentUserInfo.firstName),
          buildUserDetail("Last Name", Config.currentUserInfo.lastName),
          buildUserDetail("Email", Config.currentUserInfo.email),
          buildUserDetail("Contact", Config.currentUserInfo.mobile),
        ],
      ),
    );
  }
}
