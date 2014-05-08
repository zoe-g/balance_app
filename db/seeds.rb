# User.delete_all
# Account.delete_all
# Transaction.delete_all
# AccountType.delete_all
# TransactionType.delete_all
# SpendCategory.delete_all

cash = AccountType.create(name: 'cash')
credit = AccountType.create(name: 'credit')
checking = AccountType.create(name: 'checking')
saving = AccountType.create(name: 'saving')

home = SpendCategory.create(name: 'home')
getting_around = SpendCategory.create(name: 'getting around')
food = SpendCategory.create(name: 'food')
phone_internet = SpendCategory.create(name: 'phone/internet')
health = SpendCategory.create(name: 'health')
education = SpendCategory.create(name: 'education')
personal = SpendCategory.create(name: 'personal')
clothing = SpendCategory.create(name: 'clothing')
fun = SpendCategory.create(name: 'fun')
gifts = SpendCategory.create(name: 'gifts')
misc = SpendCategory.create(name: 'miscellaneous')

outgoing = TransactionType.create(name: 'spent')
incoming = TransactionType.create(name: 'received')
transfer = TransactionType.create(name: 'transfer')

# zoe = User.create(first_name: 'Zoe', email_address: 'zoe@zoeg.co', phone: '3108491161', password: 'password', password_confirmation: 'password')
# kenny = User.create(first_name: 'Kenny', email_address: 'kenny@zoeg.co', phone: '3108491161', password: 'password', password_confirmation: 'password')
# brian = User.create(first_name: 'Brian', email_address: 'brian@zoeg.co', phone: '3108491161', password: 'password', password_confirmation: 'password')

# a = Transaction.create(account_id: , transaction_type_id: outgoing.id, transaction_date: z1.created_at.to_date, to_or_from: 'Taxi', amount: -15.00, spend_category_id: getting_around.id, cleared: true)
# b = Transaction.create(account_id: , transaction_type_id: incoming.id, transaction_date: z1.created_at.to_date, to_or_from: 'Ticket Reimbursement', amount: 5.00, spend_category_id: fun.id, note: 'paid back', cleared: true)
# c = Transaction.create(account_id: , transaction_type_id: outgoing.id, transaction_date: k1.created_at.to_date, to_or_from: 'Limo', amount: -15.00, spend_category_id: getting_around.id, note: 'love me some taxis!', cleared: true)
# d = Transaction.create(account_id: , transaction_type_id: outgoing.id, transaction_date: b1.created_at.to_date, to_or_from: 'Gas', amount: -15.00, spend_category_id: getting_around.id, cleared: true)
