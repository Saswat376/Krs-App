import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mom extends StatelessWidget {
  const Mom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'M.O.M',
          style: GoogleFonts.orbitron(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 235, 141, 0),
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Color.fromARGB(255, 70, 69, 69)],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Meeting Title',
                  style: GoogleFonts.orbitron(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Date & Time: ',
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    color: Color.fromARGB(255, 201, 65, 2),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '10th Feb, 2025 - 10:00 AM',
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    color: Color.fromARGB(255, 201, 65, 2),
                  ),
                ),
                SizedBox(height: 10),
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.person,
                            color: Color.fromARGB(255, 201, 65, 2)),
                        title: Text(
                          'Host: Saswat Ranjan Behera',
                          style: GoogleFonts.orbitron(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.group,
                            color: Color.fromARGB(255, 201, 65, 2)),
                        title: Text(
                          'Attendees: Shivam, Debmalya, Abhrajit, Ashmita, Rinav',
                          style: GoogleFonts.orbitron(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.notes,
                            color: Color.fromARGB(255, 201, 65, 2)),
                        title: Text(
                          'Agenda: Project Roadmap',
                          style: GoogleFonts.orbitron(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.link,
                            color: Color.fromARGB(255, 201, 65, 2)),
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: 'Paste Drive Link here',
                            hintStyle:
                                GoogleFonts.orbitron(color: Colors.white70),
                            border: InputBorder.none,
                          ),
                          style: GoogleFonts.orbitron(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                GlowingButton(onPressed: () {}, text: 'Save MOM'),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color.fromARGB(255, 235, 141, 0)),
      ),
      child: child,
    );
  }
}

class GlowingButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  GlowingButton({super.key, required this.onPressed, required this.text});

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  bool _isGlowing = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isGlowing = true),
      onExit: (_) => setState(() => _isGlowing = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: _isGlowing
              ? [
                  BoxShadow(
                    color: Colors.amberAccent,
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 201, 65, 2),
            padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: GoogleFonts.orbitron(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
