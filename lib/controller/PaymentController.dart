import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  var cardNumber = ''.obs;
  var expireDate = ''.obs;
  var cvv = ''.obs;
  var cardHolderName = ''.obs;
  var saveCard = false.obs;

  var ongoingCards = <Map<String, String>>[].obs;
  var processedPayments = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedData();
  }

  void updateCardNumber(String value) {
    cardNumber.value = value;
  }

  void updateExpireDate(String value) {
    expireDate.value = value;
  }

  void updateCvv(String value) {
    cvv.value = value;
  }

  void updateCardHolderName(String value) {
    cardHolderName.value = value;
  }

  void toggleSaveCard(bool? value) {
    saveCard.value = value ?? false;
    if (saveCard.value) {
      saveData();
    } else {
      clearData();
    }
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cardNumber', cardNumber.value);
    await prefs.setString('expireDate', expireDate.value);
    await prefs.setString('cvv', cvv.value);
    await prefs.setString('cardHolderName', cardHolderName.value);
    await prefs.setBool('saveCard', saveCard.value);
  }

  void loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cardNumber.value = prefs.getString('cardNumber') ?? '';
    expireDate.value = prefs.getString('expireDate') ?? '';
    cvv.value = prefs.getString('cvv') ?? '';
    cardHolderName.value = prefs.getString('cardHolderName') ?? '';
    saveCard.value = prefs.getBool('saveCard') ?? false;
  }

  void clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cardNumber');
    await prefs.remove('expireDate');
    await prefs.remove('cvv');
    await prefs.remove('cardHolderName');
    await prefs.remove('saveCard');
  }

  void addOngoingCard() {
    ongoingCards.add({
      'cardNumber': cardNumber.value,
      'expireDate': expireDate.value,
      'cvv': cvv.value,
      'cardHolderName': cardHolderName.value,
    });
  }

  void addProcessedPayment(Map<String, String> card) {
    processedPayments.add(card);
  }

  void removeOngoingCard(int index) {
    ongoingCards.removeAt(index);
  }

  var tabIndex = 0.obs;

  void moveToHistory() {
    tabIndex.value = 1;
  }
}
