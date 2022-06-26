import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/models/response/me/card/card_response.dart';
import 'package:chuukohin/services/me/card.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:chuukohin/widgets/me/textform.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<CardScreen> {
  bool isFirstTime = false;
  final nameController = TextEditingController();
  final cardNo = TextEditingController();
  final expireDate = TextEditingController();

  Future<void> readJson() async {
    final cardResponse = await CardService.getCardInfo();
    if (cardResponse is CardInfoResponse) {
      context.read<ProfileProvider>().setCardInfo(cardResponse.data);
      nameController.text =
          Provider.of<ProfileProvider>(context, listen: false).cardInfo.name;
      cardNo.text =
          Provider.of<ProfileProvider>(context, listen: false).cardInfo.cardNo;
      expireDate.text = Provider.of<ProfileProvider>(context, listen: false)
              .cardInfo
              .monthExpire +
          "/" +
          Provider.of<ProfileProvider>(context, listen: false)
              .cardInfo
              .yearExpire
              .substring(2, 4);
    } else if (cardResponse is ErrorResponse) {
      isFirstTime = true;
    }
  }

  Future<void> handleUpdateCard() async {
    if (isFirstTime) {
      await CardService.addCard(nameController.text, cardNo.text,
          expireDate.text.split("/")[0], expireDate.text.split("/")[1]);
    } else {
      await CardService.updateCard(nameController.text, cardNo.text,
          expireDate.text.split("/")[0], expireDate.text.split("/")[1]);
    }
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Card'),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextForm(
                            controller: nameController,
                            title: 'Card holder name',
                            subtitle: 'Card holder name'),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: TextForm(
                            controller: cardNo,
                            title: 'Card No.',
                            subtitle: 'Card No.',
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextForm(
                          controller: expireDate,
                          title: 'MM/YY',
                          subtitle: 'Expire date',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () {
                    handleUpdateCard();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
