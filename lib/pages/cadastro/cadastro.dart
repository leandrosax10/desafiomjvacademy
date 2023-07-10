import 'package:flutter/material.dart';

import '../../components/storecar_app_bar.dart';

class Veiculo {
  String nome;
  String marca;
  String cambio;
  String cor;
  String descricao;
  int km;
  String imagem;
  double preco;
  int quantidade;
  int ano;
  bool vendido;
  String telefone;

  Veiculo({
    required this.nome,
    required this.marca,
    required this.cambio,
    required this.cor,
    required this.descricao,
    required this.km,
    required this.imagem,
    required this.preco,
    required this.quantidade,
    required this.ano,
    required this.vendido,
    required this.telefone,
  });
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  RegistrationFormState createState() => RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _veiculo = Veiculo(
    nome: '',
    marca: '',
    cambio: '',
    cor: '',
    descricao: '',
    km: 0,
    imagem: '',
    preco: 0.0,
    quantidade: 0,
    ano: 0,
    vendido: false,
    telefone: '',
  );

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nome',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira um nome';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.nome = value!;
            },
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Marca',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira uma marca';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.marca = value!;
            },
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Câmbio',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira o tipo de câmbio';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.cambio = value!;
            },
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Cor',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira uma cor';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.cor = value!;
            },
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Descrição',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira uma descrição';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.descricao = value!;
            },
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Quilometragem',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira a quilometragem';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.km = int.parse(value!);
            },
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Imagem',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira uma URL de imagem';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.imagem = value!;
            },
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Preço',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira o preço';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.preco = double.parse(value!);
            },
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Quantidade',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira a quantidade';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.quantidade = int.parse(value!);
            },
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Ano',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira o ano';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.ano = int.parse(value!);
            },
          ),
          Row(
            children: [
              Checkbox(
                value: _veiculo.vendido,
                onChanged: (value) {
                  setState(() {
                    _veiculo.vendido = value!;
                  });
                },
              ),
              const Text('Vendido'),
            ],
          ),
          TextFormField(
            initialValue: '212617-5689',
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Telefone',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 200, 202, 202)),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return '212617-5689';
              }
              return null;
            },
            onSaved: (value) {
              _veiculo.telefone = value!;
            },
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 340,
            height: 60,
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)))),
              child: const Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: StoreCarAppBar(
        title: 'Cadastro',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: RegistrationForm(),
        ),
      ),
    );
  }
}
