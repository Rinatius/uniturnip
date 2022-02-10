import 'package:flutter/material.dart';

class JSONSchemaForm extends StatefulWidget {

  JSONSchemaForm({
    Key? key,
    this.schema = const {},
    this.ui = const {},
    this.data = const {},
    this.name = ''
  }) : fields = schema['properties']?.keys?.toList() ?? [], super(key: key);

  final Map<String, dynamic> schema;
  final Map<String, dynamic> ui;
  final Map<String, dynamic> data;
  final List<String> fields;
  final String name;

  @override
  State<JSONSchemaForm> createState() => _JSONSchemaFormState();
}

class _JSONSchemaFormState extends State<JSONSchemaForm> {
  // late Map<String, dynamic> _schema;
  // late Map<String, dynamic> _ui;
  late Map<String, dynamic> _data;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: widget.fields.length,
        itemBuilder: (BuildContext context, int index) {
          String field = widget.fields[index];
          return FormField(name: field, schema: widget.schema['properties']?[field] ?? {});
        }
    );
  }
}


class FormField extends StatelessWidget {
  const FormField({
    Key? key,
    this.schema = const {},
    this.ui = const {},
    this.data = const {},
    required this.name
  }) : super(key: key);

  final Map<String, dynamic> schema;
  final Map<String, dynamic> ui;
  final Map<String, dynamic> data;
  final String name;

  @override
  Widget build(BuildContext context) {
    switch(schema['type']) {
      case 'string':
        return TextFormField();
      default: {
        return const SizedBox.shrink();
      }
    }
  }
}
