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
            decoration: const InputDecoration(labelText: 'Nome'),
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
          TextFormField(
            decoration: const InputDecoration(labelText: 'Marca'),
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
          TextFormField(
            decoration: const InputDecoration(labelText: 'Câmbio'),
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
          TextFormField(
            decoration: const InputDecoration(labelText: 'Cor'),
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
          TextFormField(
            decoration: const InputDecoration(labelText: 'Descrição'),
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
          TextFormField(
            decoration: const InputDecoration(labelText: 'Quilometragem'),
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
          TextFormField(
            decoration: const InputDecoration(labelText: 'Imagem'),
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
          TextFormField(
            decoration: const InputDecoration(labelText: 'Preço'),
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
          TextFormField(
            decoration: const InputDecoration(labelText: 'Quantidade'),
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
          TextFormField(
            decoration: const InputDecoration(labelText: 'Ano'),
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
            decoration: const InputDecoration(labelText: 'Telefone'),
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
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Cadastrar'),
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
