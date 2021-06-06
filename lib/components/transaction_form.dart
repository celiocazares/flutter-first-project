import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:expenses/components/adaptative_text_field.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _productValueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final productValue = double.tryParse(_productValueController.text) ?? 0.0;

    if (title.isEmpty || productValue <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, productValue, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AdaptativeTextField(
              label: 'Título',
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
            ),
            AdaptativeTextField(
              controller: _productValueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              label: 'Valor (R\$)',
            ),
            AdaptativeDatePicker(
              onDateChange: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
              selectedDate: _selectedDate,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdaptativeButton(
                  label: 'Nova transação',
                  onPressed: _submitForm,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
