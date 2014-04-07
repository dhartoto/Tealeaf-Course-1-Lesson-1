# 11. Variable Scope Exercise

# 1. Create a local variable and modify it at an inner scope.
a = 'monkey'
#	a. re-assigning the variable to something else:

def animal(str)
  a = 'elephant'
end

puts animal(a)
puts a


# b. call a method that doesn't mutate the caller

def animal(str)
	str.delete(str[0])
end

puts animal(a)


# c. call a method that mutates the caller.

def animal(str)
	str.delete!(str[0])
end

puts animal(a)


# 2. Create a local variable at an inner scope and try to reference it in
#		 the outer scope. What happens when you have nested do/end blocks?
# 	 Answer: An error occurs when a local variable at an inner scope is 
# 	 referenced in the outer scope. 
