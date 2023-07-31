import 'package:crypto_wave/features/authorization_page/widgets/text_input.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/home_page/widgets/coin_img_title_subtitle.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownCoinButton extends StatefulWidget {
  const DropdownCoinButton({
    super.key,
    required this.coinsList,
    required this.selectedCoin,
    required this.onChanged,
    required this.coinRemove,
    required this.onChangedWallet,
    required this.currentCoinController,
    required this.otherCoinController,
  });
  final List<Coins>? coinsList;

  final Coins? selectedCoin;
  final Coins? coinRemove;

  final Function(Coins?) onChanged;
  final Function(Coins?) onChangedWallet;
  final TextEditingController currentCoinController;
  final TextEditingController otherCoinController;

  @override
  State<DropdownCoinButton> createState() => _DropdownCoinButtonState();
}

class _DropdownCoinButtonState extends State<DropdownCoinButton> {
  final TextEditingController textEditingController = TextEditingController();
  Coins? selectedCoin;

  @override
  void initState() {
    super.initState();
    selectedCoin = widget.selectedCoin;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  double convertPrice(double amountOfFirstCoin, double priceOfFirstCoin,
      double priceOfSecondCoin) {
    double equivalentAmount =
        amountOfFirstCoin * priceOfFirstCoin / priceOfSecondCoin;
    return equivalentAmount;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.blueGrey,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 60,
              minWidth: 200,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<Coins>(
              isExpanded: true,
              hint: Text('Select Coin',
                  style: theme.textTheme.labelMedium?.copyWith(fontSize: 18)),
              items: widget.coinsList!
                  .where((coin) => coin.name != widget.coinRemove!.name)
                  .map(
                    (coin) => DropdownMenuItem(
                      value: coin,
                      child: CoinImgTitleSubtitle(
                        imgUrl: coin.details.fullImageUrl,
                        titleText: coin.name,
                        subtitleText: coin.details.toSymbol,
                        network: true,
                      ),
                    ),
                  )
                  .toList(),
              value: widget.coinsList!.contains(selectedCoin)
                  ? selectedCoin
                  : null,
              onChanged: (value) async {
                double amountOfFirstCoin =
                    double.tryParse(widget.currentCoinController.text) ?? 0.0;
                double priceOfFirstCoin = widget.coinRemove!.details.priceInUSD;
                double priceOfSecondCoin = value!.details.priceInUSD;

                double convertedPrice = convertPrice(
                  amountOfFirstCoin,
                  priceOfFirstCoin,
                  priceOfSecondCoin,
                );

                setState(() {
                  selectedCoin = value;
                  widget.otherCoinController.text =
                      convertedPrice.toStringAsFixed(2);
                });
                await widget.onChanged(value);
                await widget.onChangedWallet(value);
              },
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 300,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 70,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextInput(
                    labelText: 'Search for an item',
                    security: false,
                    giveMeText: textEditingController,
                    onTextSubmitted: (newText) {
                      setState(() {
                        textEditingController.text = newText;
                      });
                    },
                    errorCondition: (value) => Validators.isValidSearch(value),
                    errorText: Validators.searchErrorText,
                    isCoin: false,
                    enabled: true,
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  if (searchValue.isEmpty) return true;
                  final itemValue = item.value.toString().toLowerCase();
                  final lowercaseSearchValue = searchValue.toLowerCase();
                  return itemValue.contains(lowercaseSearchValue);
                },
              ),
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textEditingController.clear();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
