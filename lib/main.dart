import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curriculum Vitae - Keren Ocampo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A365D)),
        useMaterial3: true,
      ),
      home: const ResumeScreen(),
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        title: const Text(
          'CURRÍCULUM VITAE',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A365D),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isWide = constraints.maxWidth > 650;
                  return isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 300, child: _buildSidebar()),
                            Expanded(child: _buildMainContent()),
                          ],
                        )
                      : Column(
                          children: [
                            _buildSidebar(),
                            _buildMainContent(),
                          ],
                        );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Panel Lateral (Sidebar - Contacto, Habilidades, Idiomas)
  Widget _buildSidebar() {
    return Container(
      color: const Color(0xFF1A365D),
      padding: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFF2B6CB0),
              child: Icon(Icons.person, size: 55, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Keren Melody\nOcampo Ashanga',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          const Center(
            child: Text(
              'Ingeniería en Computación',
              style: TextStyle(fontSize: 13, color: Color(0xFFCBD5E0)),
            ),
          ),
          const Divider(height: 40, color: Color(0xFF2D3748)),

          // Contacto
          _sidebarTitle('CONTACTO'),
          _contactItem(Icons.school, 'UPEC - Tulcán, Ecuador'),
          _contactItem(Icons.email, 'Contacto Institucional'),
          _contactItem(Icons.code, 'GitHub / Portafolio Dev'),

          const Divider(height: 40, color: Color(0xFF2D3748)),

          // Competencias
          _sidebarTitle('COMPETENCIAS'),
          _skillBadge('Flutter & Dart'),
          _skillBadge('Python & OpenCV'),
          _skillBadge('React & Vite'),
          _skillBadge('Tailwind CSS'),
          _skillBadge('Cisco Packet Tracer'),
          _skillBadge('Linux & Ciberseguridad'),
          _skillBadge('MIT App Inventor'),

          const Divider(height: 40, color: Color(0xFF2D3748)),

          // Idiomas
          _sidebarTitle('IDIOMAS'),
          _contactItem(Icons.language, 'Español (Nativo)'),
          _contactItem(Icons.translate, 'Inglés (Nivel B1)'),
        ],
      ),
    );
  }

  // Panel Principal
  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Perfil Profesional
          _sectionHeader('PERFIL PROFESIONAL', Icons.account_box),
          const SizedBox(height: 10),
          const Text(
            'Estudiante avanzada de Ingeniería en Software en la Universidad Politécnica Estatal del Carchi (UPEC). '
            'Especializada en el desarrollo de software multiplataforma, diseño UX/UI, ciberseguridad, administración de redes '
            'y procesamiento digital de imágenes. Experiencia en formulación de requerimientos de software bajo estándares IEEE 830.',
            style:
                TextStyle(fontSize: 14, height: 1.6, color: Color(0xFF2D3748)),
          ),
          const SizedBox(height: 28),

          // Formación Académica
          _sectionHeader('FORMACIÓN ACADÉMICA', Icons.school),
          const SizedBox(height: 12),
          _timelineItem(
            title: 'Ingeniería en Software',
            subtitle: 'Universidad Politécnica Estatal del Carchi (UPEC)',
            period: 'En curso',
            description:
                'Enfoque en arquitectura de software, estructuras de datos, redes de computadoras y visión por computador.',
          ),

          const SizedBox(height: 28),

          // Proyectos Destacados
          _sectionHeader('PROYECTOS Y EXPERIENCIA', Icons.work),
          const SizedBox(height: 12),
          _timelineItem(
            title: 'Proyecto "ReNova" - UX/UI Lead',
            subtitle: 'Universidad Politécnica Estatal del Carchi',
            period: '2026',
            description:
                'Liderazgo del diseño de interfaz y experiencia de usuario (UX/UI) para plataforma de reciclaje textil. Elaboración de diagramas de casos de uso UML y especificación IEEE 830.',
          ),
          _timelineItem(
            title: 'Mobile Wrapper WebEmbed - Flutter Web',
            subtitle: 'Desarrollo de Software',
            period: '2026',
            description:
                'Implementación de contenedores híbridos en Flutter para la integración de aplicaciones web interactivas y componentes nativos.',
          ),
          _timelineItem(
            title: 'Capacitación Técnica en Equipamiento Informático',
            subtitle: 'GAD Municipal de Lago Agrio',
            period: '2026',
            description:
                'Formación especializada en ensamblaje, diagnóstico y mantenimiento preventivo/correctivo de hardware de computadores.',
          ),
        ],
      ),
    );
  }

  // Helpers de Estilo
  Widget _sidebarTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: Color(0xFFA0AEC0),
        ),
      ),
    );
  }

  Widget _contactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF63B3ED)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _skillBadge(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF2D3748),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, color: Colors.white),
      ),
    );
  }

  Widget _sectionHeader(String title, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF1A365D), size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A365D),
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Divider(height: 1, color: Color(0xFFE2E8F0)),
      ],
    );
  }

  Widget _timelineItem({
    required String title,
    required String subtitle,
    required String period,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFEBF8FF),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  period,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2B6CB0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF718096),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: Color(0xFF4A5568),
            ),
          ),
        ],
      ),
    );
  }
}
