import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  querySelector('#search').onClick.listen((a) async {funcPreencheCodigo();});

  querySelector('#clear').onClick.listen((a) async {limpar();});

  querySelector('#cep').onKeyDown.listen((a) async {
    if(a.keyCode == KeyCode.ENTER)funcPreencheCodigo();
  });
}
void limpar(){
    (querySelector('#uf') as InputElement).value = '';
    (querySelector('#cidade') as InputElement).value = '';
    (querySelector('#bairro') as InputElement).value = '';
    (querySelector('#logradouro') as InputElement).value = '';
}

void funcPreencheCodigo()async{
    String cep = (querySelector('#cep') as InputElement).value.replaceAll('-', '');
    String url = 'http://viacep.com.br/ws/$cep/json/';
    
    var response = await http.get(url);
    var body = json.decode(response.body);
    //print(body);

    (querySelector('#uf') as InputElement).value = body['uf'];
    (querySelector('#cidade') as InputElement).value = body['localidade'];
    (querySelector('#bairro') as InputElement).value = body['bairro'];
    (querySelector('#logradouro') as InputElement).value = body['logradouro'];
}