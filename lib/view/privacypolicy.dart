import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Privacy_Policy extends StatefulWidget {
  const Privacy_Policy({super.key});

  @override
  State<Privacy_Policy> createState() => _Privacy_PolicyState();
}

class _Privacy_PolicyState extends State<Privacy_Policy> {

  List<String> Clockprivacypolicy = [
    "1. **Data Collection and Usage**: This clock application operates entirely offline, meaning it does not collect, process, or share any personal or identifiable information about users. All settings and preferences are stored locally on your device, ensuring your data remains private.",

    "2. **Location Services and Time Zones**: While the app provides an option for users to select time zones or display world clocks, it does not access your device's GPS location. The app does not track, request, or store your geographic location, instead relying on user-selected cities for time zone information.",

    "3. **Third-Party Integrations and Sharing**: This app does not use or interact with any third-party services, APIs, or social media platforms, ensuring that no data is transmitted to external entities. No data is shared with advertisers, analytics providers, or other external companies.",

    "4. **Local Storage**: User settings, such as time format preferences (12-hour or 24-hour), selected time zones, and display preferences, are stored securely on your device's local storage. This data is kept solely for the purpose of enhancing your app experience and is not accessible to external sources.",

    "5. **Network and Internet Access**: Although the app may access the internet to ensure accurate time syncing when possible, no personal data is sent or received. Internet access is only used for time accuracy and does not involve tracking or sharing user data.",

    "6. **User Preferences**: All user-selected settings, such as theme preferences, selected cities for clocks, and alarm settings, are stored locally on the device. These settings are saved only to improve your experience within the app and can be cleared at any time by uninstalling the app or resetting app data.",

    "7. **Data Security and Encryption**: All data stored on your device is protected by industry-standard security measures. Sensitive information, such as alarm times or customized settings, may be encrypted when stored to prevent unauthorized access in case of device compromise.",

    "8. **No Cookies or Trackers**: This app does not use cookies, web beacons, or other tracking mechanisms. It is designed to be a completely private experience, free from tracking of user behavior, session information, or usage patterns.",

    "9. **Children’s Privacy**: This application is not directed toward children under the age of 13, and we do not knowingly collect information from children. Parents and guardians are advised to monitor the usage of devices by minors to ensure privacy.",

    "10. **User Rights and Data Deletion**: Users can manage or delete any locally stored data by uninstalling the application or clearing the app’s data from device settings. No data remains stored once the app is uninstalled or reset.",

    "11. **Policy Changes and Updates**: Any future changes to this privacy policy will be communicated within the app and/or on the app’s website. We may update the policy to reflect legal changes or new app features. Users are encouraged to review the policy to stay informed of their rights.",

    "12. **Feedback and Support**: We value user feedback and are committed to transparency regarding privacy practices. For questions, concerns, or feedback on this privacy policy, users can contact us at support@clockapp.com. Our team will address inquiries promptly and ensure that your privacy is respected.",

    "13. **Accessibility**: We strive to make the app accessible to all users. The app supports screen readers and other accessibility features for a seamless experience, and accessibility data is processed entirely on-device, ensuring privacy and security.",

    "14. **Notification and Alarm Permissions**: The app may request permission to send notifications for alarms or reminders. However, these are purely device-specific and do not involve data transmission or third-party access. Users can manage notification preferences from device settings.",

    "15. **Customization and Personalization**: The app allows users to customize settings, such as display themes, font sizes, and clock styles. All customization options are stored locally to personalize the app experience and are not shared externally.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Notice"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: Clockprivacypolicy.map((e){
              return Column(
                children: [
                  Text(e,style: GoogleFonts.raleway(fontSize: 16,color: Colors.grey),),
                  SizedBox(height: 20,),
                ],
              );
            }).toList()
          ),
        ),
      ),
    );
  }
}
