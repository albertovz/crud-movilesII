import 'package:crud/features/fragrance/domain/entities/fragrance.dart';
import 'package:crud/features/fragrance/presentation/blocs/fragrance/fragrance_bloc.dart';
import 'package:crud/features/fragrance/presentation/blocs/fragrances/fragrances_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FragrancePage extends StatefulWidget {
  final Parfum? fragrance;

  const FragrancePage({super.key, this.fragrance});

  @override
  State<FragrancePage> createState() => _FragrancePageState();
}

class _FragrancePageState extends State<FragrancePage> {
  TextEditingController title = TextEditingController();
  TextEditingController perfumer = TextEditingController();
  TextEditingController description= TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController year = TextEditingController();

  @override
  void initState() {
    super.initState();

    if(widget.fragrance != null) {
      title.text = widget.fragrance!.title;
      perfumer.text = widget.fragrance!.perfumer;
      description.text = widget.fragrance!.description;
      gender.text = widget.fragrance!.gender.toString();
      price.text = widget.fragrance!.price;
      year.text = widget.fragrance!.year;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fragrance == null ? 'Crear Perfume' : 'Actualizar Perfume'),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          
          child:Column(
            children: [
              TextField(
                controller: title,
                decoration: const InputDecoration(
                  labelText: 'Nombre del perfume',
                ),
              ),
              TextField(
                controller: perfumer,
                decoration: const InputDecoration(
                  labelText: 'Perfumista',
                ),
              ),
              TextField(
                controller: description,
                decoration: const InputDecoration(
                  labelText: 'Descripción del perfume',
                ),
              ),
              TextField(
                controller: gender,
                decoration: const InputDecoration(
                  labelText: 'Género',
                ),
              ),
              TextField(
                controller: price,
                decoration: const InputDecoration(
                  labelText: 'Precio',
                ),
              ),
              TextField(
                controller: year,
                decoration: const InputDecoration(
                  labelText: 'Año',
                ),
              ),

              const SizedBox(height: 15),

              BlocBuilder<FragranceBloc, FragranceState>(
                builder: (context, state) {
                  if(state is SavingFragrance) {
                    return const CircularProgressIndicator();
                  } else if(state is FragranceSaved) {
                    return const Text("Perfume guardado exitosamente", style: TextStyle(color: Colors.green));
                  } else if(state is ErrorSavingFragrance) {
                    return Text(state.message, style: const TextStyle(color: Colors.red));
                  } else {
                    return Container();
                  }
                },
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                child: const Text('Guardar Usuario'),
                onPressed: () {
                  if(widget.fragrance == null) {
                    String id = DateTime.now().millisecondsSinceEpoch.toString();
                    Parfum fragrance = Parfum(id: id, title: title.text, perfumer: perfumer.text, description: description.text, gender: gender.text, price: price.text, year: year.text);
                    context.read<FragranceBloc>().add(PressCreateFragranceButton(fragrance: fragrance));
                  } else {
                    Parfum fragrance = Parfum(id: widget.fragrance!.id, title: title.text, perfumer: perfumer.text, description: description.text, gender: gender.text, price: price.text, year: year.text,);
                    context.read<FragranceBloc>().add(PressUpdateFragranceButton(fragrance: fragrance));
                  }
                  context.read<FragrancesBloc>().add(GetFragrances());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}