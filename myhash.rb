class MyHash
	def initialize
		@pairs = Array.new(4) {[]}
		@key_count = 0
	end

	def []=(key, value)
		resize_hash(@pairs.length*2) if @key_count >= @pairs.length/2

		index = find_index(key)
		@pairs[index].each do |pair|
			# Can't use pair.last since it's not a true method to access last value, use [-1] to start from last element in array instead
			return pair[-1] = value if pair.first == key
		end
		# if key isnt pointing to anything, push to end of array and return value
		@pairs[index] << [key, value]
		@key_count += 1
		value
	end

	def [](key)
		index = find_index(key)
		@pairs[index].each do |pair|
			return pair.last if pair.first == key
		end
		nil
	end

	def find_index(key)
		key.hash % @pairs.length
	end

	def resize_hash(new_size)
		old_pairs = @pairs
		@pairs = Array.new(new_size) {[]}
		@key_count = 0

		old_pairs.each do |key_value_pairs|
		  key_value_pairs.each do |pair|
		    self[pair.first] = pair.last
		  end
		end
	end

end







# How do you build a hash internally?
#  ~/code/mks/algorithms  irb
# >> 8.hash
# => 603517038036688557
# >> 7.hash
# => 3680615161221051203
# >> 8.hash
# => 603517038036688557
# >>
#  ~/code/mks/algorithms  irb
# >> 8.hash
# => -2652568358748541283
# 
# >> 8.hash
# => -268871505172981118
# >> 8.hash % 64 											# => Use modulo to find an index to shove the value in
# => 2

# load myhash.rb....
#  ~/code/mks/algorithms  irb
# >> load 'myhash.rb'
# => true
# >> hash = MyHash.new
# => #<MyHash:0x0000010222c740 @pairs=[nil, nil, nil, nil]>
# >> hash[1] = 1
# => 1
# >> hash
# => #<MyHash:0x0000010222c740 @pairs=[nil, nil, nil, 1]>
# >> hash[3] = 3
# => 3
# >> hash
# => #<MyHash:0x0000010222c740 @pairs=[nil, nil, nil, 3]>
# >> hash[1] = 3
# => 3