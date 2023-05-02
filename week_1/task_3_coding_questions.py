#Question 1
#Write a function to print "hello_USERNAME!" USERNAME is the input of the function. The first line of the code has been defined as below.

def hello_name(user_name):
    user_name = "username"
    print("hello_" + user_name.upper() + "!")
hello_name('user_name')

#Question 2
#Write a python function, first_odds that prints the odd numbers from 1-100 and returns nothing

def first_odds():
    for odd_numbers in range(1, 101, 2):
        print(odd_numbers)
first_odds()

#Question 3
#Please write a Python function, max_num_in_list to return the max number of a given list. The first line of the code has been defined as below.

def max_num_in_list(a_list):
    a_list = [32, 70, 72, 74, 64, 15, 43, 83, 48, 24]
    print(max(a_list))
max_num_in_list('a_list')
                
#Question 4
#Write a function to return if the given year is a leap year. A leap year is divisible by 4, but not divisible by 100, unless it is also divisible by 400. The return should be boolean Type (true/false).

def is_leap_year(a_year):
    a_year = int(input("Current Year? "))
    if a_year % 4 == 0 and (a_year % 100 != 0 or a_year % 400 == 0):
        print("It is a Leap Year.")
    else:
        print("It is not Leap Year.")
is_leap_year('a_year')
                
#Question 5
#Write a function to check to see if all numbers in list are consecutive numbers. For example, [2,3,4,5,6,7] are consecutive numbers, but [1,2,4,5] are not consecutive numbers. The return should be boolean Type.

def is_consecutive(a_list):
    for values in range(len(a_list)-1):
        if a_list[values] < a_list[values + 1]:
            print("It is consecutive")
            return True
        else:
            print("It is not consecutive.")
            return False
is_consecutive('a_list')