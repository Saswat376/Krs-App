import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: GoogleFonts.orbitron(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 235, 141, 0),
          ),
        ),
        titleSpacing: 30,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          iconSize: 30,
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
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber,
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/image.png'),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Saswat Ranjan Behera',
                  style: GoogleFonts.orbitron(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '2305408@kiit.ac.in',
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    color: Color.fromARGB(255, 201, 65, 2),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Flutter Developer',
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    color: Color.fromARGB(255, 201, 65, 2),
                  ),
                ),
                SizedBox(height: 20),
                GlassCard(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person,
                            color: Color.fromARGB(255, 201, 65, 2)),
                        title: Text(
                          'Saswat Ranjan Behera',
                          style: GoogleFonts.orbitron(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.email,
                            color: Color.fromARGB(255, 201, 65, 2)),
                        title: Text(
                          '2305408@kiit.ac.in',
                          style: GoogleFonts.orbitron(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.work,
                            color: Color.fromARGB(255, 201, 65, 2)),
                        title: Text(
                          'App Dev ',
                          style: GoogleFonts.orbitron(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                GlowingButton(onPressed: () {}, text: 'Logout'),
                SizedBox(
                  height: 30,
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
  const GlowingButton({super.key, required this.onPressed, required this.text});

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
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: GoogleFonts.orbitron(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
