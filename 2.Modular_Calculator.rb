module CalculatorOperations
  def addition(a,b)
    a+b
  end
  def subtraction(a,b)
    a-b
  end
  def multiplication(a,b)
    a*b
  end
  def division(a,b)
    a/b
  end
end

class Calculator
  extend CalculatorOperations

  def self.start
    while true
      puts "\nEnter an expression\t[Q to quit!]"
      input = gets.chomp.strip

      break if input.downcase == 'q'

      i = input.index(/[+-\/*]/)

      if i
        num1 = input.slice(0,i).strip
        num2 = input.slice(i+1,input.length).strip

        if (num1.to_i.to_s == num1) && (num2.to_i.to_s == num2)
          num1 = num1.to_i
          num2 = num2.to_i

          print "\n=> "

          case input[i]
          when "+"
            p addition(num1,num2)
          when "-"
            p subtraction(num1,num2)
          when "*"
            p multiplication(num1,num2)
          when "/"
            p division(num1.to_f,num2)
          end

        else
          puts "\nInvalid number"
        end

      else
        puts "\nInvalid expression"
      end
    end
  end
end

Calculator.start
