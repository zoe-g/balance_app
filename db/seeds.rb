# AccountType.delete_all
# TransactionType.delete_all
# SpendCategory.delete_all

cash = AccountType.create(name: 'cash', icon: 'account_cash.png')
credit = AccountType.create(name: 'credit', icon: 'account_credit.png')
checking = AccountType.create(name: 'checking', icon: 'account_checking.png')
saving = AccountType.create(name: 'saving', icon: 'account_saving.png')

none = SpendCategory.create(name: 'none', icon: 'spend_none.png')
home = SpendCategory.create(name: 'home', icon: 'spend_home.png')
getting_around = SpendCategory.create(name: 'getting around', icon: 'spend_transportation.png')
food = SpendCategory.create(name: 'food', icon: 'spend_food.png')
phone_internet = SpendCategory.create(name: 'phone/internet', icon: 'spend_internet.png')
health = SpendCategory.create(name: 'health', icon: 'spend_health.png')
education = SpendCategory.create(name: 'education', icon: 'spend_education.png')
personal = SpendCategory.create(name: 'personal', icon: 'spend_personal.png')
clothing = SpendCategory.create(name: 'clothing', icon: 'spend_clothing.png')
fun = SpendCategory.create(name: 'fun', icon: 'spend_fun.png')
gifts = SpendCategory.create(name: 'gifts', icon: 'spend_gifts.png')
misc = SpendCategory.create(name: 'miscellaneous', icon: 'spend_misc.png')

outgoing = TransactionType.create(name: 'spent', icon: 'txn_neg.png')
incoming = TransactionType.create(name: 'received', icon: 'txn_pos.png')
transfer = TransactionType.create(name: 'transfer')

# User.delete_all
# Account.delete_all
# Transaction.delete_all

# zoe = User.create(first_name: 'Zoe', email_address: 'zoe@zoeg.co', phone: '3108491161', password: 'password', password_confirmation: 'password')
# kenny = User.create(first_name: 'Kenny', email_address: 'kenny@zoeg.co', phone: '3108491161', password: 'password', password_confirmation: 'password')
# brian = User.create(first_name: 'Brian', email_address: 'brian@zoeg.co', phone: '3108491161', password: 'password', password_confirmation: 'password')

# a = Transaction.create(account_id: , transaction_type_id: outgoing.id, transaction_date: z1.created_at.to_date, to_or_from: 'Taxi', amount: -15.00, spend_category_id: getting_around.id, cleared: true)
# b = Transaction.create(account_id: , transaction_type_id: incoming.id, transaction_date: z1.created_at.to_date, to_or_from: 'Ticket Reimbursement', amount: 5.00, spend_category_id: fun.id, note: 'paid back', cleared: true)
# c = Transaction.create(account_id: , transaction_type_id: outgoing.id, transaction_date: k1.created_at.to_date, to_or_from: 'Limo', amount: -15.00, spend_category_id: getting_around.id, note: 'love me some taxis!', cleared: true)
# d = Transaction.create(account_id: , transaction_type_id: outgoing.id, transaction_date: b1.created_at.to_date, to_or_from: 'Gas', amount: -15.00, spend_category_id: getting_around.id, cleared: true)
