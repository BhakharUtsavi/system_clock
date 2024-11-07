import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Open_Source extends StatefulWidget {
  const Open_Source({super.key});

  @override
  State<Open_Source> createState() => _Open_SourceState();
}

class _Open_SourceState extends State<Open_Source> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Open Source Licences"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text("In the context of software, a component is a modular, reusable part of a system or application that performs a specific function or set of functions. Components are often designed to interact with other components and can be swapped or updated independently without affecting the entire system. They help make software development more efficient, maintainable, and scalable.",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 50,),
              Text("Types of Components",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 10,),
              Text("1.  UI Components: Visual elements in a user interface, like buttons, text fields, or sliders.",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 10,),
              Text("2.  Functional Components: Code modules that perform a specific logic, such as authentication, data processing, or file management.",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 10,),
              Text("3.  Service Components: Interactions with external systems, such as APIs, databases, or third-party services.",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 10,),
              Text("4.  Data Components: Models or data structures that represent the data used in the application.",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 50,),
              Text("Benefits of Using Components",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 10,),
              Text("*  Modularity: Components help break down complex applications into manageable parts.",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 10,),
              Text("*  Reusability: Components can be reused in multiple projects or parts of the application, saving development time.",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 10,),
              Text("*  Maintainability: Easier to update or fix issues in a component without affecting the entire system.",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 10,),
              Text("*  Scalability: New features can be added through new components, enhancing system scalability.",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 10,),
              Text("For open-source projects, component lists and notices are common because they allow developers to specify which components their project relies on, often citing licensing information as part of compliance with open-source licenses.",style: GoogleFonts.raleway(color: Colors.grey,fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
