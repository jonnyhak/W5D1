class Integer
  # Integer#hash already implemented for you
end


class Array
  def hash
    return 0 if self.empty?
    answer = 0
    self.each_with_index {|ele, i| answer += (ele.to_s.hash * i.to_s.hash)} 
    answer

  end
end

class String
  def hash
    result = 0 
    self.each_char.with_index do |char, i|
      result += char.ord.hash * i.hash
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # 0
    answer = 0
    self.each do |k, v|
      answer += [k, v].hash + k.to_s.hash
    end
    answer
  end
end

