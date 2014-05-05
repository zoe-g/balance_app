# 1 - cash = AccountType.create(name: 'Cash')
# 2 - credit = AccountType.create(name: 'Credit')
# 3 - checking = AccountType.create(name: 'Checking')
# 4 - saving = AccountType.create(name: 'Saving')

# 1 - home = SpendCategory.create(name: 'Home')
# 2 - getting_around = SpendCategory.create(name: 'Getting Around')
# 3 - food = SpendCategory.create(name: 'Food')
# 4 - phone_internet = SpendCategory.create(name: 'Phone/Internet')
# 5 - health = SpendCategory.create(name: 'Health')
# 6 - education = SpendCategory.create(name: 'Education')
# 7 - personal = SpendCategory.create(name: 'Personal')
# 8 - clothing = SpendCategory.create(name: 'Clothing')
# 9 - fun = SpendCategory.create(name: 'Fun')
# 10 - gifts = SpendCategory.create(name: 'Gifts')
# 11 - misc = SpendCategory.create(name: 'Miscellaneous')

# 1 - outgoing = TransactionType.create(name: 'Spent')
# 2 - incoming = TransactionType.create(name: 'Received')
# 3 - transfer = TransactionType.create(name: 'Transfer')

User.delete_all
Account.delete_all
Transaction.delete_all

zoe = User.create(first_name: 'Zoe', email_address: 'zoe@zoeg.co')
kenny = User.create(first_name: 'Kenny', email_address: 'kenny@zoeg.co')
brian = User.create(first_name: 'Brian', email_address: 'brian@zoeg.co')

z1 = Account.create(user_id: zoe.id, account_type_id: 1, active: true, starting_balance: 150.00)
z2 = Account.create(user_id: zoe.id, account_type_id: 2, active: true, starting_balance: 150.00)
z3 = Account.create(user_id: zoe.id, account_type_id: 3, active: true, starting_balance: 150.00)
z4 = Account.create(user_id: zoe.id, account_type_id: 4, active: true, starting_balance: 150.00)

k1 = Account.create(user_id: kenny.id, account_type_id: 1, active: true, starting_balance: 200.00)
k2 = Account.create(user_id: kenny.id, account_type_id: 2, active: true, starting_balance: 200.00)
k3 = Account.create(user_id: kenny.id, account_type_id: 3, active: true, starting_balance: 200.00)
k4 = Account.create(user_id: kenny.id, account_type_id: 4, active: false)

b1 = Account.create(user_id: brian.id, account_type_id: 1, active: true, starting_balance: 300.00)
b2 = Account.create(user_id: brian.id, account_type_id: 2, active: false)
b3 = Account.create(user_id: brian.id, account_type_id: 3, active: true, starting_balance: 300.00)
b4 = Account.create(user_id: brian.id, account_type_id: 4, active: false)

a = Transaction.create(account_id: z1.id, transaction_type_id: 1, transaction_date: z1.created_at.to_date, to_or_from: 'Taxi', amount: -15.00, spend_category_id: 2, cleared: true)
b = Transaction.create(account_id: z1.id, transaction_type_id: 2, transaction_date: z1.created_at.to_date, to_or_from: 'Ticket Reimbursement', amount: 5.00, spend_category_id: 9, note: 'paid back', cleared: true)
c = Transaction.create(account_id: k1.id, transaction_type_id: 1, transaction_date: k1.created_at.to_date, to_or_from: 'Limo', amount: -15.00, spend_category_id: 2, note: 'love me some taxis!', cleared: true)
d = Transaction.create(account_id: b1.id, transaction_type_id: 1, transaction_date: b1.created_at.to_date, to_or_from: 'Gas', amount: -15.00, spend_category_id: 2, cleared: true)
