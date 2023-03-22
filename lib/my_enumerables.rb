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

  def my_all?
    my_each do |element|
      return false unless yield(element)
    end

    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end

    false
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end

    true
  end

  def my_count
    return length unless block_given?

    result = 0

    my_each do |element|
      result += 1 if yield(element)
    end

    result
  end

  def my_map
    results = []

    my_each do |element|
      results << yield(element)
    end

    results
  end

  def my_inject(initial_value)
    my_each do |element|
      # (now) initial_value = product of the block
      initial_value = yield initial_value, element
    end

    initial_value # Product
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
