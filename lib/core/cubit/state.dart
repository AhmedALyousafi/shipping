class CustomerOrdersState {
  final bool cash;
  final bool bank;
  final bool credit;
  final bool account;
  final bool additional;

  final bool cheek;
  final bool trans;
  final bool creditcard;
  final bool month;
  final bool day;
  final bool isBankFieldVisible;

  CustomerOrdersState(
      {this.cash = false,
      this.bank = false,
      this.credit = false,
      this.account = false,
      this.additional = false,
      this.cheek = false,
      this.creditcard = false,
      this.trans = false,
      this.month = false,
      this.day = false,
      this.isBankFieldVisible = false});

  get selectitemdata => null;
  CustomerOrdersState copyWith(
      {bool? cash,
      bool? bank,
      bool? credit,
      bool? account,
      bool? additional,
      bool? cheek,
      bool? creditcard,
      bool? trans,
      bool? month,
      bool? day,
      bool? isBankFieldVisible}) {
    return CustomerOrdersState(
        cash: cash ?? this.cash,
        bank: bank ?? this.bank,
        additional: additional ?? this.additional,
        account: account ?? this.account,
        credit: credit ?? this.credit,
        cheek: cheek ?? this.cheek,
        creditcard: creditcard ?? this.creditcard,
        trans: trans ?? this.trans,
        month: month ?? this.month,
        day: day ?? this.day,
        isBankFieldVisible: isBankFieldVisible ?? this.isBankFieldVisible);
  }
}
