import 'dart:developer';

import 'package:flutter/material.dart';

import '../../core/utils/ezpl_converter.dart';
import '../../model/label.dart';
import '../widgets/form_text_field.dart';

class LabelEditPage extends StatefulWidget {
  const LabelEditPage({super.key});

  @override
  State<LabelEditPage> createState() => _$LabelEditPageState();
}

class _$LabelEditPageState extends State<LabelEditPage> {
  final _formKey = GlobalKey<FormState>();

  Label currentLabel = Label.defaultLabel;

  late TextEditingController nameController;
  late TextEditingController classificationController;
  late TextEditingController fisicalFormController;
  late TextEditingController destinationController;
  late TextEditingController packagingTypeController;
  late TextEditingController contentController;
  late TextEditingController specieIndicationController;
  late TextEditingController useModeController;
  late TextEditingController preservationController;
  late TextEditingController controlDescriptionController;
  late TextEditingController restrictionController;
  late TextEditingController ingredientsController;
  late TextEditingController crudeProteinController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: currentLabel.name);
    classificationController =
        TextEditingController(text: currentLabel.classification);
    fisicalFormController =
        TextEditingController(text: currentLabel.fisicalForm);
    destinationController =
        TextEditingController(text: currentLabel.destination);
    packagingTypeController =
        TextEditingController(text: currentLabel.packagingType);
    contentController = TextEditingController(text: currentLabel.content);
    specieIndicationController =
        TextEditingController(text: currentLabel.specieIndication);
    useModeController = TextEditingController(text: currentLabel.useMode);
    preservationController =
        TextEditingController(text: currentLabel.preservation);
    controlDescriptionController =
        TextEditingController(text: currentLabel.controlDescription);
    restrictionController =
        TextEditingController(text: currentLabel.restriction);
    ingredientsController =
        TextEditingController(text: currentLabel.ingredients.join(', '));
    crudeProteinController =
        TextEditingController(text: currentLabel.crudeProtein.toString());
  }

  @override
  void dispose() {
    nameController.dispose();
    classificationController.dispose();
    fisicalFormController.dispose();
    destinationController.dispose();
    packagingTypeController.dispose();
    contentController.dispose();
    specieIndicationController.dispose();
    useModeController.dispose();
    preservationController.dispose();
    controlDescriptionController.dispose();
    restrictionController.dispose();
    ingredientsController.dispose();
    crudeProteinController.dispose();
    super.dispose();
  }

  void saveLabelAsEzpl(Label label) async {
    // Converter o objeto Label para conteúdo EZPL
    String ezplContent = LabelToEzplConverter.convertToEzpl(label);

    // Baixar o arquivo EZPL
    LabelToEzplConverter.downloadEzplFile(ezplContent, 'label.ezpl');
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Etiqueta EZPL gerada com sucesso!')));
    }

    log("Arquivo EZPL gerado com sucesso! ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Etiqueta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              FormTextField(
                controller: nameController,
                labelText: 'Nome',
              ),
              FormTextField(
                controller: classificationController,
                labelText: 'Classificação',
              ),
              FormTextField(
                controller: fisicalFormController,
                labelText: 'Forma Física',
              ),
              FormTextField(
                controller: destinationController,
                labelText: 'Destino',
              ),
              FormTextField(
                controller: packagingTypeController,
                labelText: 'Tipo de Embalagem',
              ),
              FormTextField(
                controller: contentController,
                labelText: 'Conteúdo',
              ),
              FormTextField(
                controller: specieIndicationController,
                labelText: 'Indicação de Espécie',
              ),
              FormTextField(
                controller: useModeController,
                labelText: 'Modo de Uso',
              ),
              FormTextField(
                controller: preservationController,
                labelText: 'Preservação',
              ),
              FormTextField(
                controller: controlDescriptionController,
                labelText: 'Descrição de Controle',
              ),
              FormTextField(
                controller: restrictionController,
                labelText: 'Restrição',
              ),
              FormTextField(
                controller: ingredientsController,
                labelText: 'Ingredientes (separados por vírgula)',
              ),
              FormTextField(
                controller: crudeProteinController,
                labelText: 'Proteína Bruta (g/kg)',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Label newLabel = Label(
                      name: nameController.text,
                      classification: classificationController.text,
                      fisicalForm: fisicalFormController.text,
                      destination: destinationController.text,
                      packagingType: packagingTypeController.text,
                      content: contentController.text,
                      specieIndication: specieIndicationController.text,
                      useMode: useModeController.text,
                      preservation: preservationController.text,
                      controlDescription: controlDescriptionController.text,
                      restriction: restrictionController.text,
                      ingredients: ingredientsController.text
                          .split(',')
                          .map((s) => s.trim())
                          .toList(),
                      crudeProtein:
                          double.tryParse(crudeProteinController.text) ?? 0.0,
                    );

                    saveLabelAsEzpl(newLabel);
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
