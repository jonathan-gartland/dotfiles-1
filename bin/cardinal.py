#!/usr/bin/env python
### ===========================================================================
### cardinal.py

"""
Prints an integer as a cardinal English number or Roman numeral.

The cardinal number algorithm is a straightforward recursive solution:
Given any integer:
                    xxx,xxx,xxx
                            --- 
                     6   3   0    <--- 'illion' powers
recursively break it up into 3 digit chunks.  Print each chunk separately
using p_100s and attach a appropriate 'illion' suffix.

* cardinal(1234) => 'one thousand two hundred thirty-four'

* cardinal(-sys.maxint) =>  # sys.maxint == 2147483647
'negative two billion one hundred forty-seven million four hundred eighty-three
thousand six hundred forty-seven'

My terminology runs out for 10^66 onwards ... hence the largest number
that can currently be handled is: 

* cardinal (10L**66 - 1)

For fun the following functions have also been added below:

* roman(1999)           =>  'MCMXCIX'
* decimal('xxiv')       =>  24
* decimal(roman(2001))  =>  2001

Note: as an experiment, String ports have been used in 'cardinal' to accumulate
the result.  I think it leads to cleaner code as opposed to using string.join.

Some amount of exception handling has been added.

Raja Sooriamurthi
raja at cs.indiana.edu
10/09/2000
"""

import sys, string, cStringIO, types

nnames = { 0:'',
           1:'one',          2:'two',         3:'three',       4:'four',
           5:'five',         6:'six',         7:'seven',       8:'eight',
           9:'nine',        10:'ten',        11:'eleven',     12:'twelve',
           13:'thirteen',   14:'fourteen',   15:'fifteen',    16:'sixteen',
           17:'seventeen',  18:'eighteen',   19:'nineteen',   20:'twenty',
           30:'thirty',     40:'forty',      50:'fifty',      60:'sixty',
           70:'seventy',    80:'eighty',     90:'ninety',
           }

# these names obtained from CMUCL and Allegro CL's ~r format directive
# this is pretty much centered towards American terminology
# but can be easily modified for British terminology
# e.g., billion = 10^12 etc

illions = {0:'',
           3:'thousand',         6:'million',         9:'billion',
           12:'trillion',       15:'quadrillion',    18:'quintillion',
           21:'sextillion',     24:'septillion',     27:'octillion',
           30:'nonillion',      33:'decillion',      36:'undecillion',
           39:'duodecillion',   42:'tredecillion',   45:'quattuordecillion',
           48:'quindecillion',  51:'sexdecillion',   54:'septendecillion',
           57:'octodecillion',  60:'novemdecillion', 63:'vigintillion',
           }

MAX_POWER = 63

## Don't know what 10^66 onwards is
## Hence if you to print a number >= 10^{63+3} an exception is raised
## in other wards the largest number that can be handled currently is
## cardinal (10L**66 - 1)

### For producing a cardinal number output is written to stdout.
### But in 'cardinal' sys.stdout is temporarily bound to a string port
### The result is finally read from the string port.
### Not sure if this will be faster than accumulating the result in a string
### and then 'join'ing the result.
### But using String ports certainly makes the code look cleaner.
### Raja 10/09/2000

### **************************************************
###                      cardinal
### **************************************************

### The main function

def cardinal (n):
    "Print the cardinal number of input n"

    assert (isinstance(n, types.IntType) or isinstance(n, types.LongType)), \
           "input n=%s needs to be an int or a long" % n

    sb = cStringIO.StringIO()
    sys.stdout, stdout = sb, sys.stdout

    if (n==0):
        print "zero",
    if (n<0):
        print "negative",
        n=-n
    else: pass
    try:
        aux (n)
    except ArithmeticError, e:
        sb.close()
        sys.stdout = stdout
        raise e
    else:
        str = sb.getvalue()
        sb.close()
        sys.stdout = stdout
        return str

### *************************
### aux
### *************************
### The work horse

def aux (n, power=0):
    if n==0: return
    q,r = divmod(n,1000)
    aux (q, power+3)
    if (r>0):
        p_100s(r)
        if (power>0):
            if (power<=MAX_POWER):
                print illions[power],
            else:
                raise ArithmeticError, "don't know the word for 10^%s" % power
        else:
            pass


### *************************
### p_100s
### *************************
### Handles 3-digit chunks
        
def p_100s (n):
    "print a cardinal description of a number < 1000"
    assert 0 <= n < 1000, "%s does not lie in the range [0..99]" % n

    if n==0: return
    h, t = divmod(n,100)
    if (h>0):
        print "%s hundred" % nnames[h],
    if (t<20):
        print nnames[t],
    elif (t%10 != 0):
        # there is a units digit
        # print something like 'thirty-four'
        print "%s-%s" % (nnames[t/10*10], nnames[t%10]),
    else:
        print "%s" % nnames[t/10*10],

    
### **************************************************
###                       roman
### **************************************************

# The order of the below tuple is important for 'roman' !!

roman_numerals = ((1000,'M'), (900, 'CM'), (500,'D'), (400,'CD'),
                  (100,'L'), (90,'XC'), (50,'L'), (40,'XL'),
                  (10,'X'), (9,'IX'), (5,'V'), (4,'IV'), (1,'I'))

def roman(n):
    "Convert a +ve integer into a roman numeral"
    n=int(n)  # just in case a big num is passed in
    assert 0<n<=4000, "%s is too big to express in roman numerals" % n
    l=[]
    for (dec, rmn) in roman_numerals:
        q,r = divmod(n,dec)
        if (q>0):
            l.append(rmn*q)
            if (r==0): break
            n=r
    return string.join(l,'')


def rn2dn(rn):
    "Convert a single roman numeral digit into it's decimal value"
    for (d,r) in roman_numerals:
        if (r==rn): return d
    else:
        raise ArithmeticError, "%s is not a roman numeral digit" % rn

### *************************
### decimal
### *************************

def decimal(r):
    "Convert a roman numeral into a decimal number"
    r=string.upper(r)
    ans=0
    l = len(r)
    for i in range(l-1):
        if (rn2dn(r[i])<rn2dn(r[i+1])):
            ans = ans - rn2dn(r[i])
        else:
            ans = ans + rn2dn(r[i])
    ans = ans + rn2dn(r[l-1])
    return ans

### ---------------------------------------------------------------------------



if __name__ == '__main__':
	from sys import argv
	print cardinal(int(argv[1]))

