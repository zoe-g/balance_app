User.delete_all
Account.delete_all
Transaction.delete_all

AccountType.delete_all
TransactionType.delete_all
SpendCategory.delete_all

cash = AccountType.create(name: 'Cash')
credit = AccountType.create(name: 'Credit')
checking = AccountType.create(name: 'Checking')
saving = AccountType.create(name: 'Saving')

home = SpendCategory.create(name: 'Home')
getting_around = SpendCategory.create(name: 'Getting Around')
food = SpendCategory.create(name: 'Food')
phone_internet = SpendCategory.create(name: 'Phone/Internet')
health = SpendCategory.create(name: 'Health')
education = SpendCategory.create(name: 'Education')
personal = SpendCategory.create(name: 'Personal')
clothing = SpendCategory.create(name: 'Clothing')
fun = SpendCategory.create(name: 'Fun')
gifts = SpendCategory.create(name: 'Gifts')
misc = SpendCategory.create(name: 'Miscellaneous')

outgoing = TransactionType.create(name: 'Spent')
incoming = TransactionType.create(name: 'Received')
transfer = TransactionType.create(name: 'Transfer')

zoe = User.create(first_name: 'Zoe', email_address: 'zoe@zoeg.co', phone_number: password: 'password', password_confirmation: 'password')
kenny = User.create(first_name: 'Kenny', email_address: 'kenny@zoeg.co', password: 'password', password_confirmation: 'password')
brian = User.create(first_name: 'Brian', email_address: 'brian@zoeg.co', password: 'password', password_confirmation: 'password')

z1 = Account.create(user_id: zoe.id, account_type_id: cash.id)
z2 = Account.create(user_id: zoe.id, account_type_id: credit.id)
z3 = Account.create(user_id: zoe.id, account_type_id: checking.id)
z4 = Account.create(user_id: zoe.id, account_type_id: saving.id)

k1 = Account.create(user_id: kenny.id, account_type_id: cash.id)
k2 = Account.create(user_id: kenny.id, account_type_id: credit.id)
k3 = Account.create(user_id: kenny.id, account_type_id: checking.id)
k4 = Account.create(user_id: kenny.id, account_type_id: saving.id)

b1 = Account.create(user_id: brian.id, account_type_id: cash.id)
b2 = Account.create(user_id: brian.id, account_type_id: credit.id)
b3 = Account.create(user_id: brian.id, account_type_id: checking.id
b4 = Account.create(user_id: brian.id, account_type_id: saving.id)

a = Transaction.create(account_id: z1.id, transaction_type_id: outgoing.id, transaction_date: z1.created_at.to_date, to_or_from: 'Taxi', amount: -15.00, spend_category_id: getting_around.id, cleared: true)
b = Transaction.create(account_id: z1.id, transaction_type_id: incoming.id, transaction_date: z1.created_at.to_date, to_or_from: 'Ticket Reimbursement', amount: 5.00, spend_category_id: fun.id, note: 'paid back', cleared: true)
c = Transaction.create(account_id: k1.id, transaction_type_id: outgoing.id, transaction_date: k1.created_at.to_date, to_or_from: 'Limo', amount: -15.00, spend_category_id: getting_around.id, note: 'love me some taxis!', cleared: true)
d = Transaction.create(account_id: b1.id, transaction_type_id: outgoing.id, transaction_date: b1.created_at.to_date, to_or_from: 'Gas', amount: -15.00, spend_category_id: getting_around.id, cleared: true)
