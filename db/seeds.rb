## Good job on the seeds file.  I had plenty to work with
## when I was testing out your app.

AccountType.delete_all
TransactionType.delete_all
SpendCategory.delete_all
User.delete_all
Account.delete_all
Transaction.delete_all

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

fred = User.create(first_name: 'fred', email_address: 'fred@zoeg.co', phone: '3108491161', password: 'password', password_confirmation: 'password')
wilma = User.create(first_name: 'wilma', email_address: 'wilma@zoeg.co', phone: '3108491161', password: 'password', password_confirmation: 'password')

fred1 = Account.create(user_id: fred.id, account_type_id: cash.id)
fred2 = Account.create(user_id: fred.id, account_type_id: credit.id)
fred3 = Account.create(user_id: fred.id, account_type_id: checking.id)
fred4 = Account.create(user_id: fred.id, account_type_id: saving.id)

wilma1 = Account.create(user_id: wilma.id, account_type_id: cash.id)
wilma2 = Account.create(user_id: wilma.id, account_type_id: credit.id)
wilma3 = Account.create(user_id: wilma.id, account_type_id: checking.id)
wilma4 = Account.create(user_id: wilma.id, account_type_id: saving.id)

Transaction.create(account_id: fred1.id, transaction_type_id: outgoing.id, spend_category_id: 1, transaction_date: Date.today.days_ago(10), to_or_from: 'barney', amount: -10)
Transaction.create(account_id: fred1.id, transaction_type_id: incoming.id, spend_category_id: 2, transaction_date: Date.today.days_ago(20), to_or_from: 'wilma', amount: 20)
Transaction.create(account_id: fred1.id, transaction_type_id: outgoing.id, spend_category_id: 3, transaction_date: Date.today.days_ago(2), to_or_from: 'betty', amount: -30)
Transaction.create(account_id: fred2.id, transaction_type_id: incoming.id, spend_category_id: 4, transaction_date: Date.today.days_ago(5), to_or_from: 'bam bam', amount: 40)
Transaction.create(account_id: fred2.id, transaction_type_id: outgoing.id, spend_category_id: 5, transaction_date: Date.today.days_ago(34), to_or_from: 'pebbles', amount: -3.14)
Transaction.create(account_id: fred2.id, transaction_type_id: incoming.id, spend_category_id: 6, transaction_date: Date.today.days_ago(11), to_or_from: 'dino', amount: 500)
Transaction.create(account_id: fred3.id, transaction_type_id: outgoing.id, spend_category_id: 7, transaction_date: Date.today.days_ago(21), to_or_from: 'arnold', amount: -20)
Transaction.create(account_id: fred3.id, transaction_type_id: incoming.id, spend_category_id: 8, transaction_date: Date.today.days_ago(15), to_or_from: 'sam', amount: 1.34)
Transaction.create(account_id: fred3.id, transaction_type_id: outgoing.id, spend_category_id: 9, transaction_date: Date.today.days_ago(17), to_or_from: 'tex', amount: -54.7)
Transaction.create(account_id: fred4.id, transaction_type_id: incoming.id, spend_category_id: 10, transaction_date: Date.today.days_ago(10), to_or_from: 'mr. slate', amount: 1000)
Transaction.create(account_id: fred4.id, transaction_type_id: outgoing.id, spend_category_id: 11, transaction_date: Date.today.days_ago(8), to_or_from: 'hoppy', amount: -250)
Transaction.create(account_id: fred4.id, transaction_type_id: incoming.id, spend_category_id: 12, transaction_date: Date.today.days_ago(2), to_or_from: 'joe', amount: 27)

Transaction.create(account_id: wilma1.id, transaction_type_id: incoming.id, spend_category_id: 1, transaction_date: Date.today.days_ago(14), to_or_from: 'joe', amount: 27)
Transaction.create(account_id: wilma1.id, transaction_type_id: outgoing.id, spend_category_id: 2, transaction_date: Date.today.days_ago(15), to_or_from: 'barney', amount: -10)
Transaction.create(account_id: wilma1.id, transaction_type_id: incoming.id, spend_category_id: 3, transaction_date: Date.today.days_ago(1), to_or_from: 'wilma', amount: 20)
Transaction.create(account_id: wilma2.id, transaction_type_id: outgoing.id, spend_category_id: 4, transaction_date: Date.today.days_ago(2), to_or_from: 'betty', amount: -30)
Transaction.create(account_id: wilma2.id, transaction_type_id: incoming.id, spend_category_id: 5, transaction_date: Date.today.days_ago(5), to_or_from: 'bam bam', amount: 40)
Transaction.create(account_id: wilma2.id, transaction_type_id: outgoing.id, spend_category_id: 6, transaction_date: Date.today.days_ago(9), to_or_from: 'pebbles', amount: -3.14)
Transaction.create(account_id: wilma3.id, transaction_type_id: incoming.id, spend_category_id: 7, transaction_date: Date.today.days_ago(3), to_or_from: 'dino', amount: 500)
Transaction.create(account_id: wilma3.id, transaction_type_id: outgoing.id, spend_category_id: 8, transaction_date: Date.today.days_ago(37), to_or_from: 'arnold', amount: -20)
Transaction.create(account_id: wilma3.id, transaction_type_id: incoming.id, spend_category_id: 9, transaction_date: Date.today.days_ago(20), to_or_from: 'sam', amount: 1.34)
Transaction.create(account_id: wilma4.id, transaction_type_id: outgoing.id, spend_category_id: 10, transaction_date: Date.today.days_ago(3), to_or_from: 'tex', amount: -54.7)
Transaction.create(account_id: wilma4.id, transaction_type_id: incoming.id, spend_category_id: 11, transaction_date: Date.today.days_ago(2), to_or_from: 'mr. slate', amount: 1000)
Transaction.create(account_id: wilma4.id, transaction_type_id: outgoing.id, spend_category_id: 12, transaction_date: Date.today.days_ago(5), to_or_from: 'hoppy', amount: -250)
