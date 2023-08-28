import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String selectedCity = '';
  String selectedVencimento = '5';
  String selectedInterest = '';

  TextEditingController usuarioController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController observacaoController = TextEditingController();

  @override
  void dispose() {
    usuarioController.dispose();
    cpfController.dispose();
    dataNascimentoController.dispose();
    enderecoController.dispose();
    numeroController.dispose();
    observacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Usuário'),
                subtitle: TextField(
                  controller: usuarioController,
                  decoration: InputDecoration(
                    hintText: 'Informe seu nome de usuário',
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text('CPF'),
                      subtitle: TextField(
                        controller: cpfController,
                        decoration: InputDecoration(
                          hintText: 'Informe seu CPF',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text('Data de Nascimento'),
                      subtitle: TextField(
                        controller: dataNascimentoController,
                        decoration: InputDecoration(
                          hintText: 'Informe sua data de nascimento',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text('Cidade'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selecione sua cidade'),
                    DropdownButtonFormField<String>(
                      value: selectedCity.isEmpty ? null : selectedCity,
                      items: [
                        'Recife',
                        'São Paulo',
                        'João Pessoa',
                        'Jaboatão dos Guararapes'
                      ].map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('Área de Interesses'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile(
                      title: Text('Eletrotécnica'),
                      value: 'Eletrotécnica',
                      groupValue: selectedInterest,
                      onChanged: (value) {
                        setState(() {
                          selectedInterest = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('Automação'),
                      value: 'Automação',
                      groupValue: selectedInterest,
                      onChanged: (value) {
                        setState(() {
                          selectedInterest = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('Desenvolvimento'),
                      value: 'Desenvolvimento',
                      groupValue: selectedInterest,
                      onChanged: (value) {
                        setState(() {
                          selectedInterest = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('Dia do Vencimento'),
                subtitle: Row(
                  children: [
                    Radio(
                      value: '5',
                      groupValue: selectedVencimento,
                      onChanged: (value) {
                        setState(() {
                          selectedVencimento = value.toString();
                        });
                      },
                    ),
                    Text('5'),
                    Radio(
                      value: '10',
                      groupValue: selectedVencimento,
                      onChanged: (value) {
                        setState(() {
                          selectedVencimento = value.toString();
                        });
                      },
                    ),
                    Text('10'),
                    Radio(
                      value: '15',
                      groupValue: selectedVencimento,
                      onChanged: (value) {
                        setState(() {
                          selectedVencimento = value.toString();
                        });
                      },
                    ),
                    Text('15'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: enderecoController,
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
              TextFormField(
                controller: numeroController,
                decoration: InputDecoration(labelText: 'Número'),
              ),
              TextFormField(
                controller: observacaoController,
                decoration: InputDecoration(labelText: 'Observação'),
                maxLines: 2,
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Exibir dados no console
                    print('Usuário: ${usuarioController.text}');
                    print('CPF: ${cpfController.text}');
                    print(
                        'Data de Nascimento: ${dataNascimentoController.text}');
                    print('Dia do Vencimento: $selectedVencimento');
                    print('Cidade: $selectedCity');
                    print('Área de Interesses: $selectedInterest');
                    print('Endereço: ${enderecoController.text}');
                    print('Número: ${numeroController.text}');
                    print('Observação: ${observacaoController.text}');
                  },
                  child: Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
