module Enumerable
  def my_each_with_index
    index = 0

    my_each do |element|
      yield element, index
      index += 1
    end

    self
  end

  def my_select
    results = []

    my_each do |element|
      results << element if yield(element)
    end

    results
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    length.times { |element| yield self[element] }
    self
  end
end
