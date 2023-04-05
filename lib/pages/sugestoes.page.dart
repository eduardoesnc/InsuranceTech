import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter/material.dart';
import '../components/drawer.dart';
import '../components/largeButton.dart';
import '../components/pageTitle.dart';

class EnvioSugestoes extends StatefulWidget {
  const EnvioSugestoes({super.key});

  static const routeName = '/sugestoes';

  @override
  State<EnvioSugestoes> createState() => _EnvioSugestoesState();
}

class _EnvioSugestoesState extends State<EnvioSugestoes> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  ////final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: const Color(0xFF2a5298),
        centerTitle: true,
        title: SizedBox(
          width: 90,
          child: Image.asset("assets/logo.png"),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        color: const Color(0xFF2a5298),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 48),
            const pageTitle(
              texto: 'Envie-nos sugestões',
            ),
            const SizedBox(height: 48),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor, digite o nome';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      labelText: 'Nome',
                      hintText: 'Nome *',
                      hintStyle: TextStyle(
                        color: Colors.white24,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                          width: 2,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor digite seu e-mail';
                      } else if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
                          .hasMatch(value!)) {
                        return 'Por favor, digite um e-mail válido';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      labelText: 'Email',
                      hintText: 'Email *',
                      hintStyle: TextStyle(
                        color: Colors.white24,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      errorStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _subjectController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor digite o assunto';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      labelText: 'Assunto',
                      hintText: 'Assunto *',
                      hintStyle: TextStyle(
                        color: Colors.white24,
                      ),
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide:
                            BorderSide(color: Colors.orangeAccent, width: 2.0),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _messageController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor digite a menssagem';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      labelText: 'Messagem',
                      hintText: 'Menssagem *',
                      hintStyle: TextStyle(
                        color: Colors.white24,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LargeButton(
                    texto: 'Enviar',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        sendEmail();
                        _nameController.clear();
                        _emailController.clear();
                        _subjectController.clear();
                        _messageController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Email enviado',
                                textAlign: TextAlign.center,
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendEmail() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final messagem = _messageController.text;
    final smtpServer = SmtpServer(
      'smtp.gmail.com',
      port: 587,
      username: 'itappcontato@gmail.com',
      password: 'kuortuvmdibhvnfp',
      ssl: false,
      ignoreBadCertificate: true,
    );

    final message = Message()
      ..from = Address(_emailController.text, _nameController.text)
      ..recipients.add('itappcontato@gmail.com')
      ..subject = _subjectController.text
      ..text = 'Nome: $name\n\nEmail: $email\n\nMensagem: $messagem';

    try {
      await send(message, smtpServer);
    } on MailerException catch (e) {
      print('Sugestão não envida. ${e.message}');
    }
  }
}
