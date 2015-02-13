class LuhnValidator
  def validate(number)
    number[-1].to_i == check_digit_for(number[0..-2]).to_i
  end

  def check_digit_for(number)
    (10 - total_sum(number) % 10).to_s
  end

  def total_sum(number)
    digits(number).reverse.map.with_index do |digit, index|
      index.even? ? sum(digit * 2) : digit
    end.reduce(0, :+)
  end

  def sum(number)
    digits(number).reduce(0, :+)
  end

  def digits(number)
    number.to_s.chars.map(&:to_i)
  end
end
