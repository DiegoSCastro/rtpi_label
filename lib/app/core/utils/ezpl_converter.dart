import 'dart:convert';
import 'dart:html' as html;

import '../../model/label.dart';

sealed class LabelToEzplConverter {
  // Método para converter o objeto Label para um arquivo .EZPL
  static String convertToEzpl(Label label) {
    // Definir a largura e altura da etiqueta (em dots para a impressora térmica, considerando que 1 cm = 118 dots)
    int labelWidth = 118 * 20; // 20 cm de largura
    int labelHeight = 118 * 10; // 10 cm de altura

    // Template básico do EZPL com os dados do objeto Label
    String ezpl = """
^XA 

^Q$labelHeight,3
^W$labelWidth
^H10
^AT
^L
^FO10,10^A0,30,30^FDNome: ${label.name}^FS
^FO10,50^A0,30,30^FDClassificação: ${label.classification}^FS
^FO10,90^A0,30,30^FDForma Física: ${label.fisicalForm}^FS
^FO10,130^A0,30,30^FDDestino: ${label.destination}^FS
^FO10,170^A0,30,30^FDTipo de Embalagem: ${label.packagingType}^FS
^FO10,210^A0,30,30^FDConteúdo: ${label.content}^FS
^FO10,250^A0,30,30^FDIndicação de Espécie: ${label.specieIndication}^FS
^FO10,290^A0,30,30^FDModo de Uso: ${label.useMode}^FS
^FO10,330^A0,30,30^FDPreservação: ${label.preservation}^FS
^FO10,370^A0,30,30^FDDescrição de Controle: ${label.controlDescription}^FS
^FO10,410^A0,30,30^FDRestrição: ${label.restriction}^FS
^FO10,450^A0,30,30^FDProteína Bruta: ${label.crudeProtein.toStringAsFixed(2)} g/kg^FS
^FO10,490^A0,30,30^FDIngredientes: ${label.ingredients.join(", ")}^FS
^PQ1
^XZ
""";

    return ezpl;
  }

  // Método para gerar o download do arquivo EZPL no Flutter Web
  static void downloadEzplFile(String ezplContent, String fileName) {
    // Converte o conteúdo para base64
    final bytes = utf8.encode(ezplContent);
    final blob = html.Blob([bytes]);

    // Cria uma URL para o blob
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Cria um link temporário para download
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();

    // Libera a URL após o download
    html.Url.revokeObjectUrl(url);
  }
}
