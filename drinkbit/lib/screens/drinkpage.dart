import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/message_format.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:drinkbit/database/entities/entity.dart';
import 'package:drinkbit/repository/databaseRepository.dart';
import 'package:drinkbit/utils/formTiles.dart';
import 'package:drinkbit/utils/formSeparator.dart';
import 'package:provider/provider.dart';

//This is the class that implement the page to be used to edit existing meals and add new meals.
//This is a StatefulWidget since it needs to rebuild when the form fields change.
class DrinkPage extends StatefulWidget {
  //We are passing the Meal to be edited. If it is null, the business logic will know that we are adding a new 
  //Meal instead.
  final Drink? drink;


     DrinkPage({Key? key, required this.drink})
      : super(key: key);

  static const route = '/drink';
  static const routeDisplayName = 'Drink page';

  @override
  State<DrinkPage> createState() => _DrinkPageState();
} 


class _DrinkPageState extends State<DrinkPage> {
  //Form globalkey: this is required to validate the form fields.
  final formKey=GlobalKey<FormState>();
  
  //Variables that maintain the current form fields values in memory.
  
  TextEditingController _nameController = TextEditingController();
  TextEditingController _calController = TextEditingController();
  TextEditingController _ingredientsController = TextEditingController();

  
  @override
  void initState() {
    super.initState();
    _nameController.text =  widget.drink == null ? '': widget.drink!.name.toString();
  
    _calController.text =  widget.drink == null ? '' : widget.drink!.cal.toString();

    _ingredientsController.text =   widget.drink == null ? '' : widget.drink!.ingredients.toString();
  } 
  @override
  void dispose() {
    _nameController.dispose();
    _calController.dispose();
    _ingredientsController.dispose();
    super.dispose();
  } // dispose


  @override
  Widget build(BuildContext context) {
    //Print the route display name for debugging
    print('${DrinkPage.routeDisplayName} built');

    //The page is composed of a form. An action in the AppBar is used to validate and save the information provided by the user.
    //A FAB is showed to provide the "delete" functinality. It is showed only if the meal already exists.
    return Scaffold(
      appBar: AppBar(
        title: Text(DrinkPage.routeDisplayName),
        actions: [
          IconButton(
              onPressed: () => _validateAndSave(context),
              icon: Icon(Icons.done),)
        ],
      ),
         body: Center(
        child: _buildForm(context),
      ),
      floatingActionButton: widget.drink == null
          ? null
          : FloatingActionButton(
              onPressed: () => _deleteAndPop(context),
              child: Icon(Icons.delete),
            ),
    );
  } //build
Widget _buildForm(BuildContext context) {
    return Form(
      key:formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 8, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            FormSeparator(label: 'Drinks'),
            FormTextTile(
              labelText: 'Name',
              controller: _nameController,
              icon: MdiIcons.glassCocktail
            ),
            FormNumberTile(
              labelText: 'Calorie',
              controller: _calController,
              icon: MdiIcons.counter,
            ),
             FormTextTile(
              labelText: 'Ingredients',
              controller:  _ingredientsController,
              icon: MdiIcons.menu,
            ),
          ],
        ),
      ),
    );
  } // _buildFor
 
 void _validateAndSave(BuildContext context) async {
    if (formKey.currentState!.validate()) {

      if(widget.drink == null){
        Drink newDrink =
          Drink(_nameController.text , double.parse(_calController.text), _ingredientsController.text);
          await Provider.of<DatabaseRepository>(context, listen: false)
              .insertDrink(newDrink);
      }//if
      //...otherwise, edit it.
      else{
        Drink updatedDrink =
          Drink(widget.drink!.name, double.parse(_calController.text),widget.drink!.ingredients);
          await Provider.of<DatabaseRepository>(context, listen: false)
              .updateDrink(updatedDrink);
      }//else
      Navigator.pop(context);
    }//if
  } // _validateAndSave

  //Utility method that deletes a drink entry.
  void _deleteAndPop(BuildContext context) async{
    await Provider.of<DatabaseRepository>(context, listen: false)
              .removeDrink(widget.drink!);
    Navigator.pop(context);
  } 
}