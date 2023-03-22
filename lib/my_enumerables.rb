module Enumerable
  def my_each_with_index
    self.length.times { |index| yield self[index], index }
    self
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

class Array
 def my_each
   self.length.times { |element| yield self[element] }
   self
 end 
end
