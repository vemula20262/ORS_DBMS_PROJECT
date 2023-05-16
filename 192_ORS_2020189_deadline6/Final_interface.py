import datetime
import random
from prettytable import PrettyTable
import mysql.connector as mysqlcon

connection = mysqlcon.connect(host="localhost",
  user="root",
  password="BDay@707",
  database="OnlineRetailStore"
)

if connection.is_connected():
    print('Connected to MySQL database')
    cursor = connection.cursor()
    cursor.execute('select * from Customer')
    row = cursor.fetchone()
    while row is not None:
        # print(row)
        row = cursor.fetchone()
else:
    print('Connection failed')

#  generate a autentication of new customer in  online retain store using email and password and store it in database using command line interface and then use it in the code
def add_wallet(fname):
    cursor.execute("select id from wallet ORDER BY id DESC LIMIT 1")
    wallet_id = cursor.fetchone()
    wallet_id = wallet_id[0] + 1
    print("- - - - - - - - - - - - - - - - - - - - -")
    print("Your wallet id is: ", wallet_id)
    print("Enter your wallet credentials")
    amount = input("Enter the amount you want to add in your wallet: ")
    print("Your wallet has been created")
    cursor.execute("INSERT INTO Wallet VALUES (%s, %s, %s)", (wallet_id, fname, amount))
    connection.commit()


def customer_address(customer_id):
    print("- - - - - - - - - - - - - - - - - - - - -")
    print("Please enter your address details")
    house_no = input("Enter your house number: ")
    locality = input("Enter your locality: ")
    city = input("Enter your city: ")
    pincode = input("Enter your pincode: ")
    cursor.execute("INSERT INTO customer_address VALUES (%s, %s, %s, %s, %s)", (customer_id, house_no, locality, city, pincode))
    print("Address added")
    connection.commit()

def add_newCustomer():
    cursor.execute("select customer_id from customer ORDER BY customer_id DESC LIMIT 1")
    customer_id = cursor.fetchone()
    customer_id = customer_id[0] + 1
    first_name = input("Enter your first name: ")
    last_name = input("Enter your last name: ")

    cursor.execute("SELECT email_id FROM Customer")
    list_email = cursor.fetchall()
    print(list_email)
    email = input("Enter your email: ")
    for i in list_email:
        if (email,) == i:
            print("Email id already registered")
            exit()

    password = input("Enter your password: ")
    contact = input("Enter your contact number: ")
    date_of_birth = input("Enter your date of birth: ")
    add_wallet(first_name)
    wallet_id = input("Enter your wallet id: ")
    cursor.execute("INSERT INTO Customer VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                   (customer_id, email, password, first_name, last_name, contact, date_of_birth, wallet_id))
    customer_address(customer_id)
    connection.commit()
    print("New customer added")
#     print all the customer details
    print("Customer id: ", customer_id)
    print("First name: ", first_name)
    print("Last name: ", last_name)
    print("Email: ", email)
    print("Password: ", password)
    print("Contact: ", contact)
    print("Date of birth: ", date_of_birth)
    print("Wallet id: ", wallet_id)

def login():
    print("Enter credentials to login")
    email = input("Enter your email: ")
    password = input("Enter your password: ")
    cursor.execute("SELECT * FROM Customer WHERE email_id = %s AND password = %s", (email, password))
    customer = cursor.fetchone()
    if customer:
        print("Login successful")
        return True
    else:
        print("Login failed")
        return False

def login_employee():
    print("Enter credentials to login")
    email = input("Enter your email: ")
    password = input("Enter your password: ")
    cursor.execute("SELECT * FROM Employee WHERE email_id = %s AND password = %s", (email, password))
    employee = cursor.fetchone()
    if employee:
        print("Login successful")
        return True
    else:
        print("Login failed")
        return False


# we need to write . Make at least 4 non-conflicting transactions and 2 conflicting transactions.
#
# Non-conflicting transactions:
#
# A customer searches for a product on the website and adds it to their cart.
# A customer creates an account and updates their personal information.
# A customer browses the website and reads product reviews.
# A customer places an order for a product and receives a confirmation email.

def view_order():
    cursor.execute("SELECT * FROM O_rder")
    order = cursor.fetchall()
    table_vorder = PrettyTable(["Order id", "Assigned delivery agent id", "Customer id", "Transaction id", "Date"])
    for order in order:
        table_vorder.add_rows([
            [order[0], order[1], order[2], order[3], order[-1]]
        ])
    print(table_vorder)

def view_soldItems():
    cursor.execute("SELECT * FROM Sold_Items")
    soldItems = cursor.fetchall()
    table_sold = PrettyTable(["Customer id", "Order id", "Product id", "Nuber of Items"])
    for si in soldItems:
        table_sold.add_rows([
            [si[0], si[1], si[2], si[-1]]
        ])
    print(table_sold)

def view_transactions():
    cursor.execute("SELECT * FROM Transactions")
    transactions = cursor.fetchall()
    table_Transactions = PrettyTable(["Transaction id", "Wallet id", "Amount"])
    for tra in transactions:
        table_Transactions.add_rows([
            [tra[0], tra[1], tra[2]]
        ])
    print(table_Transactions)

def see_cart(customer_id):
    # customer_id = input("Enter the customer id: ")
    cursor.execute("SELECT * FROM Cart WHERE customer_id = %s", (customer_id,))
    cart = cursor.fetchall()

    table_cart = PrettyTable(["Product id", "Name", "Price", "Number of items", "Total price"])
    if cart:
        for i in range(len(cart)):
            product_id = cart[i][1]
            no_of_items = cart[i][2]
            cursor.execute("SELECT * FROM Products WHERE id = %s", (product_id,))
            product = cursor.fetchone()
            table_cart.add_rows([[product_id, product[1], product[2], no_of_items, product[2] * no_of_items]])
        print(table_cart)
    else:
        print("Cart is empty")

def add_to_cart(customer_id):
    product_id = input("Enter the product id: ")
    # customer_id = input("Enter the customer id: ")
    # check wheter the customer is in database or not
    cursor.execute("SELECT * FROM Customer WHERE customer_id = %s", (customer_id,))
    customer = cursor.fetchone()
    if customer:
        no_of_items = input("Enter the no of items ")
        cursor.execute("BEGIN")
        cursor.execute("SELECT * FROM Products WHERE id = %s", (product_id,))
        product = cursor.fetchone()
        # check whether the stock of the product is available or not if avaliable just add to cart if not print the message
        if product:
            cursor.execute("SELECT stock FROM Products WHERE id = %s", (product_id,))
            stock = cursor.fetchone()
            if stock[0] > int(no_of_items):
                cursor.execute("INSERT INTO Cart VALUES (%s, %s, %s)", (customer_id, product_id, no_of_items))
                print("Product added to cart")
                cursor.execute("COMMIT")
            else:
                cursor.execute("ROLLBACK")
                print("we just have ", stock[0], "items in stock")
        else:
            cursor.execute("ROLLBACK")
            print("Product not found")
    else:
        print("Customer not found")

    connection.commit()



def update_customer(customer_id):
    # customer_id = input("Enter the customer id: ")
    # chck whether the customer is in database or not
    cursor.execute("SELECT * FROM Customer WHERE customer_id = %s", (customer_id,))
    customer = cursor.fetchone()
    if customer:
        print("What do you want to update?")
        print("1. First name")
        print("2. Last name")
        print("3. Email")
        print("4. Password")
        print("5. Contact")
        print("6. Date of birth")
        print("7. Address")
        print("8. Exit")
        choice = int(input("Enter your choice: "))
        if choice == 1:
            first_name = input("Enter the first name: ")
            cursor.execute("UPDATE Customer SET first_name = %s WHERE customer_id = %s", (first_name, customer_id))
            cursor.execute("UPDATE Wallet SET wname = %s WHERE id = %s", (first_name, customer[-1]))
            print("First name updated as desired")
        elif choice == 2:
            last_name = input("Enter the last name: ")
            cursor.execute("UPDATE Customer SET last_name = %s WHERE customer_id = %s", (last_name, customer_id))
            print("Last name updated as desired")
        elif choice == 3:
            email = input("Enter the email: ")
            cursor.execute("UPDATE Customer SET email_id = %s WHERE customer_id = %s", (email, customer_id))
            print("Email updated as desired")
        elif choice == 4:
            current_password = input("Enter the current password: ")
            if current_password == customer[2]:
                new_password = input("Enter the new password: ")
                cursor.execute("UPDATE Customer SET password = %s WHERE customer_id = %s", (new_password, customer_id))
                print("Password updated as desired")
            else:
                print("Invalid Password")
        elif choice == 5:
            contact = input("Enter the contact: ")
            cursor.execute("UPDATE Customer SET contact = %s WHERE customer_id = %s", (contact, customer_id))
            print("Contact info updated as desired")
        elif choice == 6:
            date_of_birth = input("Enter the date of birth: ")
            cursor.execute("UPDATE Customer SET date_of_birth = %s WHERE customer_id = %s",
                           (date_of_birth, customer_id))
            print("Date of birth updated as desired")

        elif choice == 7:
            house_no = input("Enter your house number: ")
            locality = input("Enter your locality: ")
            city = input("Enter your city: ")
            pincode = input("Enter your pincode: ")
            cursor.execute("UPDATE CustomerAddress SET house_no = %s, locality = %s, city = %s, pincode = %s WHERE customer_id = %s", (house_no, locality, city, pincode, customer_id))
            print("Address updated as desired")
        elif choice == 8:
            exit()
        else:
            print("Invalid choice")
    else:
        print("Customer not found")
    connection.commit()


def place_order(customer_id):
    # customer_id = input("Enter the customer id: ")
    cursor.execute("BEGIN")
    cursor.execute("SELECT wallet_id FROM customer WHERE customer_id = %s", (customer_id,))
    wallet = cursor.fetchone()
    wallet_id = wallet[0]
    cursor.execute("SELECT amount FROM Wallet WHERE id = %s", (wallet_id,))
    wallet2 = cursor.fetchone()
    amount = wallet2[0]
    cursor.execute("SELECT * FROM Cart WHERE customer_id = %s", (customer_id,))
    cart = cursor.fetchall()
    # print(len(cart))
    bill_amount = 0
    if cart:
        see_cart(customer_id)
        print("Are you sure you want to proceed with the above order?")
        choice_order = input("Type 'y' for YES or 'n' for returning to the previous menu: ")
        if choice_order == 'y':
            for i in range(len(cart)):
                # print(cart[i])
                product_id = cart[i][1]
                no_of_items = cart[i][2]
                cursor.execute("SELECT * FROM Products WHERE id = %s", (product_id,))
                product = cursor.fetchone()
                stock = product[-1]
                # deliver agent id is any number between 500 and 600 so implement according to it
                bill_amount = bill_amount + (product[2] * no_of_items)
            delivery_agent_id = random.randint(500, 600)
            date = datetime.datetime.now()
            cursor.execute("select id from O_rder ORDER BY id DESC LIMIT 1")
            order_id = cursor.fetchone()
            order_id = order_id[0]
            # print(order_id)
            order_id = order_id + 1
            cursor.execute("select id from Transactions ORDER BY id DESC LIMIT 1")
            transaction_id = cursor.fetchone()
            transaction_id = transaction_id[0]
            transaction_id = transaction_id + 1
            cursor.execute("INSERT INTO Transactions VALUES (%s, %s, %s)", (transaction_id, wallet_id, bill_amount))
            cursor.execute("INSERT INTO O_rder VALUES (%s, %s, %s, %s, %s)",
                           (order_id, delivery_agent_id, customer_id, transaction_id, date))
            for i in range(len(cart)):
                cursor.execute("SELECT * FROM Products WHERE id = %s", (product_id,))
                product = cursor.fetchone()
                stock = product[-1]
                cursor.execute("INSERT INTO Sold_Items VALUES (%s, %s, %s, %s)" ,(customer_id, order_id, cart[i][1], cart[i][2]))


            print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
            print("BILL")
            table_bill = PrettyTable(["Product id", "Product name", "Product price", "No of items", "Total price"])
            for i in range(len(cart)):
                product_id = cart[i][1]
                no_of_items = cart[i][2]
                cursor.execute("SELECT * FROM Products WHERE id = %s", (product_id,))
                product = cursor.fetchone()
                table_bill.add_rows([[product_id, product[1], product[2], no_of_items, product[2] * no_of_items]])
            print(table_bill)
            cursor.execute("COMMIT")
            #cursor.execute("DELETE FROM Cart WHERE customer_id = %s", (customer_id,))

            print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
            print("Order placed successfully")
            print("Order id: ", order_id)
            print("Assigned Delivery agent id: ", delivery_agent_id)
            print("Customer id: ", customer_id)
            print("Transaction id: ", transaction_id)
            print("Date: ", date)
            print("Bill amount: ", bill_amount)
            #print("Product id", "Product name", "Product price", "No of items", "Total price")


            cursor.execute("DELETE FROM Cart WHERE customer_id = %s", (customer_id,))
            cursor.execute("COMMIT")
        else:
            print("No order placed")
    else:
        cursor.execute("ROLLBACK")
        print("Cart is empty")
    connection.commit()

def remove_from_cart(customer_id):
    # customer_id = input("Enter the customer id: ")
    cursor.execute("BEGIN")
    cursor.execute("SELECT * FROM cart WHERE customer_id = %s", (customer_id,))
    # check whether the customer has any product in cart or not if no then print cart is empty
    cart = cursor.fetchall()


    if cart:
        see_cart(customer_id)
        product_id = input("Enter the product id to be removed: ")
        cursor.execute("SELECT * FROM Cart WHERE product_id = %s AND customer_id = %s", (product_id, customer_id))
        cart = cursor.fetchone()
        if cart:
            cursor.execute("DELETE FROM Cart WHERE product_id = %s AND customer_id = %s", (product_id, customer_id))
            print("Product removed successfully")
            print("New cart after removing products")
            #cursor.execute("SELECT * FROM cart WHERE customer_id = %s", (customer_id,))
            #cart = cursor.fetchall()
            see_cart(customer_id)
            cursor.execute("COMMIT")
        else:
            cursor.execute("ROLLBACK")
            print("Product not found")
    else:
        see_cart(customer_id)


    connection.commit()

def add_money_to_wallet(customer_id):
    # customer_id = input("Enter the customer id: ")
    print("Enter the following credentials for authentication")
    email = input("Enter the email: ")
    password = input("Enter the password: ")
    cursor.execute("SELECT * FROM Customer WHERE customer_id = %s AND email_id = %s AND password = %s", (customer_id, email, password))
    customer = cursor.fetchone()

    if customer:
        wallet_id = customer[-1]
        cursor.execute("SELECT amount FROM Wallet WHERE id = %s", (wallet_id,))
        wallet = cursor.fetchone()
        previous_amount = wallet[0]
        # print("Previous amount: ", previous_amount)
        amount = input("Enter the amount: ")
        cursor.execute("UPDATE Wallet SET amount = %s WHERE id = %s", (previous_amount  + int(amount), wallet_id))
        print("Amount added successfully")
        print("Previous amount: ", previous_amount)
        print("Amount added: ", amount)
        print("Current amount: ", previous_amount  + int(amount))

    else:
        print("Invalid credentials")



def see_products():
    cursor.execute("SELECT id, name, price, rating, stock FROM Products")
    products = cursor.fetchall()

    table_products = PrettyTable()
    table_products.field_names = ["Product id", "Name", "Price", "Rating" ,"Current Stock"]
    for product in products:
        table_products.add_row(product)
    print(table_products)


def see_orders(customer_id):
    # customer_id = input("Enter the customer id: ")
    cursor.execute("SELECT * FROM O_rder WHERE customer_id = %s", (customer_id,))
    orders = cursor.fetchall()
    if orders:

        for order in orders:

            cursor.execute("SELECT * FROM Sold_Items WHERE order_id = %s", (order[0],))
            sold = cursor.fetchall()
            table_sold = PrettyTable(["Order id", "Product id", "Name", "Price", "Number of items", "Total price"])
            for s in sold:
                sold_product_id = s[2]
                cursor.execute("SELECT * FROM Products WHERE id = %s", (sold_product_id,))
                sold_product = cursor.fetchall()
                for sp in sold_product:
                    table_sold.add_rows([
                        [order[0], s[2], sp[1], sp[2], s[3], sp[2]*s[3]]
                    ])
            print(table_sold)

            print("Order id: ", order[0])
            print("Delivery agent id: ", order[1])
            print("Customer id: ", order[2])
            print("Transaction id: ", order[3])
            print("Date: ", order[4])
            print("-----------------------------------------------------------------------")
    else:
        print("No orders placed")

def see_wallet(customer_id):
    # customer_id = input("Enter the customer id: ")
    cursor.execute("SELECT * FROM Customer WHERE customer_id = %s", (customer_id,))
    customer = cursor.fetchone()
    if customer:
        wallet_id = customer[-1]
        cursor.execute("SELECT * FROM Wallet WHERE id = %s", (wallet_id,))
        wallet = cursor.fetchone()
        print("Wallet id: ", wallet[0])
        print("Wallet name: ",wallet[1])
        print("Amount: ", wallet[-1])
    else:
        print("Invalid credentials")


def filter_products():
    print("- - - - - - - -")
    print("Filter by")
    print("1. Price")
    print("2. Stock")
    print("3. Name")
    print("4. Rating")
    print("- - - - - - - -")
    choice = input("Enter your choice: ")

    if choice == "1":
        min_price = input("Enter the minimum price: ")
        max_price = input("Enter the maximum price: ")
        cursor.execute("SELECT id, name, price, rating, stock FROM Products WHERE price BETWEEN %s AND %s ORDER BY price ASC", (min_price,max_price))
        products = cursor.fetchall()

        table_price = PrettyTable()
        table_price.field_names = ["Product id", "Name", "Price", "Rating" ,"Current Stock"]
        if products:
            for product in products:
                table_price.add_row(product)
            print(table_price)
        else:
            print("No products found in the desired price range")

    elif choice == "2":
        min_stock = input("Enter the minimum stock required: ")
        max_stock = input("Enter the maximum stock required: ")
        cursor.execute("SELECT id, name, price, rating, stock FROM Products WHERE stock BETWEEN %s AND %s", (min_stock,max_stock))
        products = cursor.fetchall()

        table_stock = PrettyTable()
        table_stock.field_names = ["Product id", "Name", "Price", "Rating", "Current Stock"]
        if products:
            for product in products:
                table_stock.add_row(product)
            print(table_stock)
        else:
            print("No products found in the desired stock range")

    elif choice == "3":
        name = input("Enter the name: ")
        cursor.execute("SELECT id, name, price, rating, stock FROM Products WHERE name LIKE %s", ('%'+name+'%',))
        products = cursor.fetchall()

        table_name = PrettyTable()
        table_name.field_names = ["Product id", "Name", "Price", "Rating", "Current Stock"]
        if products:
            for product in products:
                table_name.add_row(product)
            print(table_name)
        else:
            print("No products found")

    elif choice == "4":
        print("The rating lies between 1 to 5")
        min_rating = input("Enter the minimum rating: ")
        max_rating = input("Enter the maximum rating: ")
        cursor.execute("SELECT id, name, price, rating, stock FROM Products WHERE rating between %s and %s", (min_rating,max_rating))
        products = cursor.fetchall()

        table_rating = PrettyTable()
        table_rating.field_names = ["Product id", "Name", "Price", "Rating", "Current Stock"]
        if products:
            for product in products:
                table_rating.add_row(product)
            print(table_rating)
        else:
            print("No products found")
    else:
        print("Invalid choice")


def check_delivery_partner(customer_id):
    # customer_id = input("Enter the customer id: ")
    cursor.execute("SELECT * FROM O_rder WHERE customer_id = %s", (customer_id,))
    order = cursor.fetchall()
    if order:
        table_delivery = PrettyTable(["Order id ","Delivery partner id", "Delivery partner name" , "Delivery partner phone number"])
        for i in range(len(order)):
            delivery_agent_id = order[i][1]
            cursor.execute("SELECT * FROM delivery_agent WHERE id = %s", (delivery_agent_id,))
            delivery_partner = cursor.fetchone()
            table_delivery.add_rows([
                [order[i][0], delivery_partner[0], delivery_partner[1] + " " + delivery_partner[2], delivery_partner[-1]]
            ])
            #print("Deliver partner id: ", delivery_partner[0])
            #print("Deliver partner  name: ", delivery_partner[1] + " " + delivery_partner[2])
            #print("Deliver partner phone number: ", delivery_partner[-1])
        print(table_delivery)
    else:
        print("No order placed")

def view_customer():
    cursor.execute("SELECT * FROM Customer")
    customer = cursor.fetchall()
    table_vcustomer = PrettyTable(["Customer id",  "Email","First Name","Last Name", "Phone", "date of birth","Wallet id"])
    for customer in customer:
        table_vcustomer.add_rows([
           [customer[0], customer[1], customer[3], customer[4], customer[5], customer[6], customer[-1]]
        ])
    print(table_vcustomer)
def view_customer_address():
    cursor.execute("SELECT * FROM Customer_address")
    customer_address = cursor.fetchall()
    table_vcustomer_address = PrettyTable(["Customer id", "House no", "locality", "city", "pincode"])
    for customer_address in customer_address:
        table_vcustomer_address.add_rows([
            [customer_address[0], customer_address[1], customer_address[2], customer_address[3], customer_address[4]]
        ])
    print(table_vcustomer_address)
def view_delivery_agent():
    cursor.execute("SELECT * FROM Delivery_agent")
    delivery_agent = cursor.fetchall()
    table_vdelivery_agent = PrettyTable(["Delivery agent id", "First Name", "Last Name", "Phone"])
    for delivery_agent in delivery_agent:
        table_vdelivery_agent.add_rows([
            [delivery_agent[0], delivery_agent[1], delivery_agent[2], delivery_agent[3]]
        ])
    print(table_vdelivery_agent)

def add_new_product():
    cursor.execute("SELECT id from Products ORDER BY id DESC LIMIT 1")
    product_id = cursor.fetchone()
    product_id = product_id[0] + 1
    product_name = input("Enter the product name: ")
    price = int(input("Enter the price: "))
    stock = int(input("Enter the stock: "))
    image = "http://dummyimage.com/149x100.png/dddddd/000011"
    rating = int(input("Enter the rating: "))
    cursor.execute("INSERT INTO Products VALUES (%s, %s, %s, %s, %s, %s)", (product_id, product_name, price, image, rating, stock))
    print("Product added successfully")
    connection.commit()

def product_update():
    product_id = input("Enter the product id: ")
    cursor.execute("SELECT * FROM Products WHERE id = %s", (product_id,))
    product = cursor.fetchone()
    if product:
        print("Displaying product details")
        print("Product id: ", product[0])
        print("Product name: ", product[1])
        print("Product price: ", product[2])
        print("Stock: ", product[-1])
        print("rating ", product[-2])
        print("-----------------------------------------------------------------------")
        print("Enter the details to be updated")
        print("1. Update product stock")
        print("2. Update product price")
        print("3. Delete a product")
        choice = int(input("Enter your choice: "))
        if choice == 1:
            stock = int(input("Enter the stock: "))
            cursor.execute("UPDATE Products SET stock = %s WHERE id = %s", (stock, product_id))
            print("Stock updated successfully")
        elif choice == 2:
            price = int(input("Enter the price: "))
            cursor.execute("UPDATE Products SET price = %s WHERE id = %s", (price, product_id))
            print("Price updated successfully")

        elif choice == 3:
            print("Are you sure you want to delete the above product?")
            delete = input("Type 'y' for yes nd 'n' for no: ")
            if delete == 'y':
                cursor.execute("DELETE FROM Products WHERE id = %s", (product_id,))
                print("Product deleted successfully")
            else:
                print("Product not deleted")
    else:
        print("Product not found")
    connection.commit()

def add_delivery_agent():
    cursor.execute("select id from Transactions delivery_agent BY id DESC LIMIT 1")
    delivery_agent_id = cursor.fetchone()
    delivery_agent_id = delivery_agent_id[0] + 1

    first_name = input("Enter the first name: ")
    last_name = input("Enter the last name: ")
    contact = input("Enter the contact: ")
    cursor.execute("INSERT INTO Delivery_agent VALUES (%s, %s, %s, %s)", (delivery_agent_id, first_name, last_name, contact))
    print("Delivery agent added successfully")

def monthly_revenue():
  print("BEST MONTHLY SALES REVENUE")
  query1 = "SELECT YEAR(O_rder.date), MONTH(O_rder.date), SUM(Transactions.amount) FROM O_rder JOIN Transactions ON O_rder.transaction_id = Transactions.id GROUP BY YEAR(O_rder.date), MONTH(O_rder.date) ORDER BY SUM(Transactions.amount) DESC;"
  cursor.execute(query1)
  results1 = cursor.fetchall()

  output1 = PrettyTable()
  output1.field_names = ["Year", "Month", "Total Amount"]
  for row in results1:
    output1.add_row(row)
  print(output1)

def product_region():
  print("POPULARITY OF PRODUCTS IN VARIOUS REGIONS")

  query2 = "SELECT customer_address.city, Sold_Items.items, Products.name FROM Products JOIN Sold_Items ON Products.id = Sold_Items.product_id JOIN customer_address ON Sold_Items.customer_id = customer_address.customer_id GROUP BY customer_address.city, Sold_Items.items, Products.name ORDER BY Sold_Items.items DESC;"
  cursor.execute(query2)
  results2 = cursor.fetchall()

  output2 = PrettyTable()
  output2.field_names = ["City", "Quantity sold", "Product name"]
  for row in results2:
    output2.add_row(row)
  print(output2)

def product_sales():
  print("SALES REVENUE FOR EACH PRODUCT")

  query3 = "SELECT Products.id, Products.name, SUM(Sold_Items.items) AS Total_quantity_sold, SUM(Sold_Items.items)*Products.price AS Revenue_by_product FROM Products JOIN Sold_Items ON Products.id = Sold_Items.product_id GROUP BY Products.id ORDER BY Revenue_by_product DESC;"
  cursor.execute(query3)
  results3 = cursor.fetchall()

  output3 = PrettyTable()
  output3.field_names = ["Product ID", "Product name", "Total quantity sold", "Revenue of product"]
  for row in results3:
    output3.add_row(row)
  print(output3)

def deliveries_by_agent():
  print("NUMBER OF DELIVERIES BY EACH DELIVERY AGENT")

  query4 = "SELECT Delivery_Agent.id, Delivery_Agent.first_name, Delivery_Agent.last_name, COUNT(*) AS number_of_orders FROM O_rder JOIN Delivery_Agent ON Delivery_Agent.id = O_rder.delivery_agent_id GROUP BY Delivery_Agent.id ORDER BY number_of_orders DESC;"
  cursor.execute(query4)
  results4 = cursor.fetchall()

  output4 = PrettyTable()
  output4.field_names = ["Delivery Agent ID", "First name", "Last Name", "Number of deliveries"]
  for row in results4:
    output4.add_row(row)
  print(output4)


def main():

    print("- - - - - - - - - - - - - - - -")
    print("WELCOME TO ONLINE RETAIL STORE")
    print("- - - - - - - - - - - - - - - -")

    print("1. Login")
    print("2. Create an account")
    inp1 = int(input("Enter your choice: "))
    print("- - - - - - - - - - - - - - - -")

    if inp1 == 1:

        print("Are you a customer or an employee?")
        print("1. Customer")
        print("2. Employee")
        who = int(input("Enter your choice: "))
        print("- - - - - - - - - - - - - - - -")

        if who == 1:
            # login()
            print("Enter credentials to login")
            email = input("Enter your email: ")
            password = input("Enter your password: ")
            cursor.execute("SELECT * FROM Customer WHERE email_id = %s" ,(email, ))
            cred = cursor.fetchone()
            if cred == None:
                print("Invalid email id")
                exit()
            elif password != cred[2]:
                print("Invalid password")
                exit()


            cursor.execute("SELECT * FROM Customer WHERE email_id = %s AND password = %s", (email, password))
            customer = cursor.fetchone()
            customer_id = customer[0]
            first_name = customer[3]
            last_name = customer[4]

            if customer:
                print("- - - - - - - - - - - - - - - -")
                print("Login successful")
                print("Welcome ", first_name, "", last_name)



                while True:
                    print("- - - - - - - - - - - - - - - -")
                    print("1. Search for products")
                    print("2. Add product to cart")
                    print("3. Check cart")
                    print("4. Place order")
                    print("5. Remove product from cart")
                    print("6. Add money to wallet")
                    print("7. Check orders placed")
                    print("8. Check wallet")
                    print("9. Update customer credential")
                    print("10. Assigned delivery partner")
                    print("11. Exit")
                    print("- - - - - - - - - - - - - - - -")

                    choice = int(input("Enter your choice: "))
                    if choice == 1:
                        filter = input("Do you want to filter the products? (y/n): ")
                        if filter == 'y':
                            filter_products()
                        else:
                            see_products()
                    elif choice == 2:
                        add_to_cart(customer_id)
                    elif choice == 3:
                        see_cart(customer_id)
                    elif choice == 4:
                        place_order(customer_id)
                    elif choice == 5:
                        remove_from_cart(customer_id)
                    elif choice == 6:
                        add_money_to_wallet(customer_id)
                    elif choice == 7:
                        see_orders(customer_id)
                    elif choice == 8:
                        see_wallet(customer_id)
                    elif choice == 9:
                        update_customer(customer_id)
                    elif choice == 10:
                        check_delivery_partner(customer_id)
                    elif choice == 11:
                        exit()
                    else:
                        print("Invalid choice")
                # return True
            else:
                print("Login failed")

        elif who == 2:
            print("Enter credentials to login")
            email = input("Enter your email: ")
            password = input("Enter your password: ")
            cursor.execute("SELECT * FROM Employee WHERE email_id = %s AND password = %s", (email, password))
            employee= cursor.fetchone()
            employee_id = employee[0]
            first_name = employee[3]
            last_name = employee[4]

            if employee:
                print("- - - - - - - - - - - - - - - -")
                print("Login successful")
                print("Welcome ", first_name, "", last_name)

                while True:
                    print("- - - - - - - - - - - - - - - - - - - - - - - - - -")
                    print("1. View products")
                    print("2. Update Product")
                    print("3. Add product")
                    print("4. View Customer")
                    print("5. View Orders")
                    print("6. View Sold Items")
                    print("7. View Delivery agent")
                    print("8. View Transactions")
                    print("9. Monthly sales revenue")
                    print("10. Popularity of products in different regions")
                    print("11. Sales revenue for each product")
                    print("12. Number of deliveries by each delivery agent")
                    print("13. View Customer location")
                    print("13. Exit")
                    print("- - - - - - - - - - - - - - - - - - - - - - - - - -")

                    choice = int(input("Enter your choice: "))
                    if choice == 1:
                        filter = input("Do you want to filter the products? (y/n): ")
                        if filter == 'y':
                            filter_products()
                        else:
                            see_products()
                    elif choice == 2:
                        product_update()
                    elif choice == 3:
                        add_new_product()
                    elif choice == 4:
                        view_customer()
                    elif choice == 5:
                        view_order()
                    elif choice == 6:
                        view_soldItems()
                    elif choice == 7:
                        view_delivery_agent()
                    elif choice == 8:
                        view_transactions()
                    elif choice == 9:
                        monthly_revenue()
                    elif choice == 10:
                        product_region()
                    elif choice == 11:
                        product_sales()
                    elif choice == 12:
                        deliveries_by_agent()
                    elif choice == 13:
                        view_customer_address()
                    elif choice == 14:
                        exit()

            else:
                print("Login failed")


    elif inp1 == 2:
        add_newCustomer()
        main()

    else:
        print("Invalid choice")



if __name__ == "__main__":
    main()


connection.close()


