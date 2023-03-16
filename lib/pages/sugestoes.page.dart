import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:insurancetech/components/largeButton.dart';
import '../components/drawer.dart';
import '../components/pageTitle.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  static const routeName = '/sugestoes';

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> sendEmail() async {
    final Email email = Email(
      body: _messageController.text,
      subject: _subjectController.text,
      recipients: ['insurancetechapp@gmail.com'],
      //cc: [_emailController.text],
      // You can also add attachments like this:
      // attachments: [AttachmentFile('path/to/attachment')],
    );

    await FlutterEmailSender.send(email);
  }

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
            child: ListView(children: <Widget>[
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
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor preencha o nome';
                        }
                        return null;
                      },
                      //   if (value == null) {]
                      //     return 'Please enter your name';
                      //   }
                      //   return null;
                      // },
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        hintText: 'Nome * ',
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
                        if (value!.isEmpty) {
                          return 'Por favor preencha o email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
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
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _subjectController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Digite o assunto';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Assunto',
                        hintText: 'Assunto *',
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
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _messageController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Digite a mensagem';
                        }
                        return null;
                      },
                      maxLines: 7,
                      decoration: const InputDecoration(
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LargeButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          sendEmail();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Messagem enviada com sucesso'),
                            ),
                          );
                        }
                      },
                      texto: 'Enviar ',
                      //  child: const Text('Enviar'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ])));
  }
}
