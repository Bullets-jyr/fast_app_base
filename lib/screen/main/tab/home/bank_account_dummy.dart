import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/banks_dummny.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 3000000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(bankShinhan, 30000000, accountTypeName: '저축예금');
final bankAccountShinhan3 = BankAccount(bankShinhan, 300000000, accountTypeName: '저축예금');
final bankAccountShinhan4 = BankAccount(bankShinhan, 300000000, accountTypeName: '저축예금');
final bankAccountShinhan5 = BankAccount(bankShinhan, 300000000, accountTypeName: '저축예금');
final bankAccountShinhan6 = BankAccount(bankShinhan, 300000000, accountTypeName: '저축예금');
final bankAccountShinhan7 = BankAccount(bankShinhan, 300000000, accountTypeName: '저축예금');
final bankAccountShinhan8 = BankAccount(bankShinhan, 300000000, accountTypeName: '저축예금');
final bankAccountShinhan9 = BankAccount(bankShinhan, 300000000, accountTypeName: '저축예금');
final bankAccountToss = BankAccount(bankTtoss, 5000000);
final bankAccountKakao = BankAccount(bankKakao, 7000000, accountTypeName: '입출금통장');

main() {
  // print(backAccounts[0].accountTypeName);
  //
  // for(final item in backAccounts) {
  //   print(item.accountTypeName);
  // }

  final shinhanBank = bankMap['shinhan1'];
  // print(shinhanBank == bankAccountShinhan1);

  // for(final entry in bankMap.entries) {
  //   print(entry.key + ":" + (entry.value.accountTypeName ?? entry.value.bank.name));
  // }

  // Set
  print(bankSet.contains(bankAccountShinhan1));

  // List
  print(bankAccounts.contains(bankAccountShinhan1));

  // List와 Set에서 contains의 차이점은 시간복잡도에 있습니다.
  // List에서 contains함수를 쓰게되면 이 List를 모두 한바퀴 돌면서 bankAccountShinhan1있는지 확인을 하게 됩니다. O(n)
  // Set에서 contains를 하게되면 Set안에 있는 Hash Table을 통해서 즉시 있는지 없는지를 판단하게됩니다. O(1)
  // 시간복잡도가 상수라는 것은 아무리 이 Map안에 몇만개, 몇백만개의 데이터가 들어있더라도 바로 즉시 있는지 없는지 여부를 알아낼 수 있다는 뜻입니다.

  // List to Set
  // 성능이 필요할 때는 Set
  bankAccounts.toSet();

  // Set to List
  // 순회가 필요할 때는 List
  bankSet.toList();
}

// List (중복허용)
final List<BankAccount> bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountShinhan4,
  bankAccountShinhan5,
  bankAccountShinhan6,
  bankAccountShinhan7,
  bankAccountShinhan8,
  bankAccountShinhan9,
  bankAccountToss,
  bankAccountKakao,
];

// Map (중복불가)
final bankMap = {
  'shinhan1': bankAccountShinhan1,
  'shinhan2': bankAccountShinhan2,
};

// Set: (중복불가) 데이터를 가져오기 위해서 보통 사용하지 않고, 데이터가 존재하는지 체크하는 용도로 많이 사용합니다.
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
};
