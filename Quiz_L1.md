Q.1. What is the value of 'a' after the below code is executed?

a = 1
b = 'a'
b = 3

Answer: The value of 'a' is 1 which is a fixnum.

Q.2. What's the difference between an Array and a Hash?

Answer" Both deal with data structures. Objects in an array are referenced by an 
		index (starting from 0..) whereas a Hash is reference by a key (string or symbol).

Q. 3. Every Ruby expression returns a value. Say what value is returned in the 
	  below expressions:

	arr = [1,2,3,3]
	[1,2,3,3].uniq
	[1,2,3,3].uniq!

Answer:
The first part returns and array of [1,2,3,3]
The uniq method returns an array of [1,2,3] it is an immutable method
The uniq! method also returns an array of [1,2,3] but it is a mutable method.

Q.4. What's the difference between map and select methods for the Array class?
	 Give an example of when you'd use one versus the other.

Answer: The select method evaluates to true or false and returns an an array of
	  	objects if true
		The map method evaluates the expression within a block and returns the value of
	  	the expression.
Examples:
Using select to return any object in the arr array that starts with 'A'.
arr = ['AB', 'AC', 'DC', 'BC']
arr.select {|x| x[0] == 'A'}

Using map to return just the surnames of full_name array.
full_name = [['Jimmi', 'Hendrix'], ['Elvis', 'Presley'], ['Michael', 'Jackson']]
full_name.map {|x| x[1]}

Q.5. Say you want to create a Hash. How would you do so if you wanted the has keys to
	 be String objects instead of symbols?

Answer: some_hash = {'str_key1' =>'value1', 'str_key2' => 'value2'}

Q.6. What is returnd?

	x = 1
	x.odd? ? "no way!" : "yes, sir!"

Answer: "no way!" is returned...tricky!

Q.7. What is x?
	
	x = 1
	3.times do
	  x += 1
	end

	puts x

Answer: x == 4

Q.8. What is x?

	3.times do
	  x += 1
	end

	puts x

Answer: Returns an error as x had not been initialized.

