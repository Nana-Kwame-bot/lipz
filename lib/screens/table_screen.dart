import 'package:flutter/material.dart';
import 'package:lipz/models/products.dart';
import 'package:lipz/services/product_data.dart';
import 'package:lipz/utilities/constants.dart';
import 'package:provider/provider.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({Key key}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  int _rowsPerPage = 7;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: PaginatedDataTable(
            header: Text('Nutrition'),
            rowsPerPage: _rowsPerPage,
            columns: kTableColumns,
            showCheckboxColumn: false,
            source: ProductDataSource(
                foodProducts: Provider.of<ProductData>(context).foodProducts),
          ),
        ),
      ),
    );
  }
}

////// Data source class for obtaining row data for PaginatedDataTable.
class ProductDataSource extends DataTableSource {
  int _selectedCount = 0;

  ProductDataSource({this.foodProducts});
  List<Product> foodProducts;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= foodProducts.length) return null;
    final Product _foodProduct = foodProducts[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${_foodProduct.date}')),
      DataCell(Text('${_foodProduct.productName}')),
      DataCell(Text('${_foodProduct.calories}')),
      DataCell(Text('${_foodProduct.energy.toStringAsFixed(1)}%')),
      DataCell(Text('${_foodProduct.fat.toStringAsFixed(1)}%')),
      DataCell(Text('${_foodProduct.protein.toStringAsFixed(1)}%')),
      DataCell(Text('${_foodProduct.cholesterol.toStringAsFixed(1)}%')),
    ]);
  }

  @override
  int get rowCount => foodProducts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
