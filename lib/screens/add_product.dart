import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/providers/add_product_provider.dart';
import 'package:inventory_management_app/utilites/validators.dart';
import 'package:inventory_management_app/widgets/mtext_form_field.dart';
import 'package:inventory_management_app/widgets/simple_navbar.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final processLoader = context
        .select<AddProductProvider, bool>((provider) => provider.processLoader);
    const border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SimpleNavBar(
                      text: "Add product",
                      doYouWantDeleteButton: false,
                      initialLoader: false,
                      processLoader: processLoader,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const AddProductForm(border: border)
                  ],
                ),
              ),
              if (processLoader) ...[
                const Positioned.fill(child: ModalBarrier()),
                const Positioned.fill(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class AddProductForm extends StatefulWidget {
  const AddProductForm({
    super.key,
    required this.border,
  });

  final OutlineInputBorder border;

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final GlobalKey<FormState> formkeyProduct = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkeyProduct,
        child: Column(
          children: [
            MTextFormFieldColumn(
              border: widget.border,
              hintText: "Product Name",
              controller:
                  context.read<AddProductProvider>().productNameController,
              validator: Validators.emptyValidator,
            ),
            MTextFormFieldColumn(
              border: widget.border,
              hintText: "Product Description",
              controller:
                  context.read<AddProductProvider>().descriptionController,
              validator: Validators.emptyValidator,
            ),
            MTextFormFieldColumn(
              border: widget.border,
              hintText: "Total Quantity",
              controller:
                  context.read<AddProductProvider>().totalQuantityController,
              validator: Validators.emptyValidator,
            ),
            MTextFormFieldColumn(
              border: widget.border,
              hintText: "Price",
              controller: context.read<AddProductProvider>().priceController,
              validator: Validators.emptyValidator,
            ),
            MTextFormFieldColumn(
              border: widget.border,
              hintText: "Image Url",
              controller: context.read<AddProductProvider>().imageUrlController,
              validator: Validators.emptyValidator,
            ),
            SizedBox(
              width: double.infinity,
              height: 45.0,
              child: ElevatedButton(
                onPressed: () async {
                  if (formkeyProduct.currentState!.validate()) {
                    final addProductProvider =
                        context.read<AddProductProvider>();
                    await addProductProvider.addProduct();
                    addProductProvider.updateProcessLoader(false);
                    addProductProvider.resetTextEditingController();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  foregroundColor: Apptheme.light,
                ),
                child: Text(
                  "Add product",
                  style: GoogleFonts.roboto(),
                ),
              ),
            )
          ],
        ));
  }
}
