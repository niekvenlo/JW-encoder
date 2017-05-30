class Array
  def bubble_sort1(&block)
    a = self.dup
    block = lambda { |num1, num2| num1 <=> num2 } unless block_given?
    sorted = false
    until sorted == true
      sorted = true
      a[0...a.size-1].each_index do |i|
        if block.call(a[i], a[i+1]) == 1
          a[i], a[i+1] = a[i+1], a[i]
          sorted = false
        end
      end
    end
    a
  end

  def bubble_sort2
    a = self.dup
    sorted = false
    until sorted == true
      sorted = true
      a[0...a.size-1].each_index do |i|
        if (block_given? && yield(a[i], a[i+1]) == 1) ||
          (!block_given? && (a[i] > a[i+1]))
            a[i], a[i+1] = a[i+1], a[i]
            sorted = false
        end
      end
    end
    a
  end

  def bubble_sort3
    a = self.dup
    sorted = false
    until sorted == true
      sorted = true
      a[0...a.size-1].each_index do |i|
        if block_given? && yield(a[i], a[i+1]) == 1
          a[i], a[i+1] = a[i+1], a[i]
          sorted = false
        elsif !block_given? && a[i] > a[i+1]
          a[i], a[i+1] = a[i+1], a[i]
          sorted = false
        end
      end
    end
    a
  end

  alias_method :bubble_sort, :bubble_sort3
end

puts "\nSort using the default sorting criteria:"
p [1,2,4,23,5,7].bubble_sort

puts "\nPass sorting criteria as an implicit block:"
p [1,2,4,23,5,7].bubble_sort { |num1, num2| num2 <=> num1 }

puts "\nPass sorting criteria as an implicit block:"
p [1,2,4,23,5,7].bubble_sort { |num1, num2| (num1.even? ? 0 : 1) <=> (num2.even? ? 0 : 1) }

bloo = lambda { |num1, num2| num2 <=> num1 }
puts "\nPass sorting criteria as an explicit block, simple:"
p [1,2,4,23,5,7].bubble_sort(&bloo)

flee = lambda do |num1, num2|
  num1prime = 2.upto(num1-1).any? { |n| num2 % n == 0 }
  num2prime = 2.upto(num2-1).any? { |n| num1 % n == 0 }
  (num2prime ? 1 : 0) <=> (num1prime ? 1 : 0)
end
puts "\nPass sorting criteria as an explicit block, complex:"
p [1,2,4,23,5,7].bubble_sort(&flee)
