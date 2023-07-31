import 'package:crypto_wave/features/authorization_page/widgets/routed_text_tabs.dart';
import 'package:crypto_wave/features/authorization_page/widgets/text_input.dart';
import 'package:crypto_wave/features/coin_page/widgets/widgets.dart';
import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:crypto_wave/features/home_page/widgets/coin_img_title_subtitle.dart';
import 'package:crypto_wave/features/welcome_page/widgets/routed_text_icon_button.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:crypto_wave/repositories/wallet_repository/models/models.dart';
import 'package:flutter/material.dart';

class CoinBuySell extends StatefulWidget {
  const CoinBuySell({
    Key? key,
    required this.coin,
    required this.coinSecond,
    required this.coinsList,
    required this.currentCoinController,
    required this.otherCoinController,
    required this.buyFunc,
    required this.sellFunc,
    required this.isBuy,
    required this.onChanged,
    required this.buyFuncBtn,
    required this.sellFuncBtn,
    required this.wallet,
    required this.walletSecond,
    required this.onChangedWallet,
  }) : super(key: key);
  final Coins? coin;
  final Coins? coinSecond;
  final WalletRead? wallet;
  final WalletRead? walletSecond;

  final List<Coins>? coinsList;

  final TextEditingController currentCoinController;
  final TextEditingController otherCoinController;

  final void Function() buyFunc;
  final void Function() sellFunc;
  final void Function() buyFuncBtn;
  final void Function() sellFuncBtn;
  final Function(Coins?) onChanged;
  final Function(Coins?) onChangedWallet;

  final bool isBuy;

  @override
  State<CoinBuySell> createState() => _CoinBuySellState();
}

class _CoinBuySellState extends State<CoinBuySell> {
  double convertPrice(double amountOfFirstCoin, double priceOfFirstCoin,
      double priceOfSecondCoin) {
    double equivalentAmount =
        amountOfFirstCoin * priceOfFirstCoin / priceOfSecondCoin;
    return equivalentAmount;
  }

  void _updateConvertedPrice() {
    double amountOfFirstCoin =
        double.tryParse(widget.currentCoinController.text) ?? 0.0;
    double priceOfFirstCoin = widget.coin!.details.priceInUSD;
    double priceOfSecondCoin = widget.coinSecond!.details.priceInUSD;

    double convertedPrice = convertPrice(
      amountOfFirstCoin,
      priceOfFirstCoin,
      priceOfSecondCoin,
    );

    setState(() {
      widget.otherCoinController.text = convertedPrice.toStringAsFixed(2);
    });
  }

  void _showDropdownCoinButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: 200,
            height: 60,
            child: DropdownCoinButton(
              coinsList: widget.coinsList,
              selectedCoin: widget.coinSecond,
              onChangedWallet: (coins) {
                setState(() {
                  widget.onChangedWallet(coins);
                });
              },
              onChanged: (coins) {
                setState(() {
                  widget.onChanged(coins);
                });
              },
              coinRemove: widget.coin,
              currentCoinController: widget.currentCoinController,
              otherCoinController: widget.otherCoinController,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _updateConvertedPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RoutedTextTabs(
          firstTabName: 'Buy',
          secondTabName: 'Sell',
          firstTabFunc: () => widget.buyFunc(),
          secondTabFunc: () => widget.sellFunc(),
          width: 50,
          isFirstTabSelect: true,
        ),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            CoinImgTitleSubtitle(
              imgUrl: widget.coin!.details.fullImageUrl,
              titleText: widget.coin!.name,
              subtitleText: widget.coin!.details.toSymbol,
              network: true,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextInput(
                labelText: 'Amount [${widget.coin!.name}]',
                security: false,
                giveMeText: widget.currentCoinController,
                onTextSubmitted: (newText) {
                  setState(() {
                    widget.currentCoinController.text = newText;
                    _updateConvertedPrice();
                  });
                },
                errorCondition: (value) => Validators.isValidSearch(value),
                errorText: Validators.coinErrorText,
                isCoin: true,
                enabled: true,
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(
              '${widget.wallet!.currencyCount.toStringAsFixed(2)} [count]'),
        ),
        const Divider(
          height: 50,
          thickness: 2,
        ),
        Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                _showDropdownCoinButton(context);
              },
              child: CoinImgTitleSubtitle(
                imgUrl: widget.coinSecond!.details.imageUrl ==
                        'https://cdn-icons-png.flaticon.com/512/1536/1536384.png'
                    ? widget.coinSecond!.details.imageUrl
                    : widget.coinSecond!.details.fullImageUrl,
                titleText: widget.coinSecond!.name,
                subtitleText: widget.coinSecond!.details.toSymbol,
                network: true,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextInput(
                labelText: 'Amount [${widget.coinSecond!.name}]',
                security: false,
                giveMeText: widget.otherCoinController,
                onTextSubmitted: (newText) {},
                errorCondition: (value) => Validators.isValidSearch(value),
                errorText: Validators.coinErrorText,
                isCoin: true,
                enabled: false,
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(
              '${widget.walletSecond!.currencyCount.toStringAsFixed(2)} [count]'),
        ),
        const SizedBox(height: 30),
        RoutedTextIconButton(
          routedButtonText: widget.isBuy ? 'Buy' : 'Sell',
          onPressed: widget.isBuy
              ? () => widget.buyFuncBtn()
              : () => widget.sellFuncBtn(),
          width: 400,
          paddingVertical: 20,
          paddingHorizontal: 135,
          flutterIcon: widget.isBuy ? Icons.shopping_cart : Icons.sell,
        ),
      ],
    );
  }
}
