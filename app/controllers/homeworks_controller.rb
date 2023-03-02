class HomeworksController < ApplicationController
  def square_calculation
    array = []
    for i in 2..19
      array.push(i) unless i == 10
    end
    for i in 0..16
      r = rand(17)
      k = array[i]
      array[i] = array[r]
      array[r] = k
    end
    
    array11 = []
    for i in 0..9 do
      array11.push( array[i] )
    end

    for i in 0..16
      r = rand(17)
      k = array[i]
      array[i] = array[r]
      array[r] = k
    end

    array12 = []
    for i in 0..9 do
      array12.push( array[i] )
    end

    array = []
    for i in 1..10 do
      array.push(i)
    end

    for i in 0..9
      r = rand(9)
      k = array[i]
      array[i] = array[r]
      array[r] = k
    end

    array13 = []
    for i in 0..9 do
      array13.push( array[i] )
    end

    for i in 0..9
      r = rand(9)
      k = array[i]
      array[i] = array[r]
      array[r] = k
    end

    array14 = []
    for i in 0..9 do
      array14.push( array[i] )
    end

    @pm_array = [[],[]]
    for i in 0..9 do
      r = rand(2)
      if r == 0
        r = -1        
      end
      @pm_array[0].push( r )
      r = rand(2)
      if r == 0
        r = -1        
      end
      @pm_array[1].push( r )
    end
  end

  def junior_factorization
    array1 = []
    for i in 0..9 do
      array1.push(junior_factorization_unit) 
    end
  end

  def factorization
    array1 = []
    for i in 0..9 do
      array1.push(factorization_unit) 
    end
  end

  def square_completed
    array1 = []
    for i in 0..9 do
      array1.push(square_completed_unit) 
    end
  end

  def fraction
    @array = []
    for i in 0..9 do
      array1 = []
      array1 = array1 + fraction_unit
      r = rand(4) 
      array1.push(r)
      array1 = array1 + fraction_unit
      case r
      when 0
        molecule = array1[0] * array1[4] + array1[1] * array1[3]
        denominator = array1[1] * array1[4]
        greatest_common_divisor = gcd(molecule, denominator)
        array1.push(molecule / greatest_common_divisor)
        array1.push(denominator / greatest_common_divisor)
      when 1
        molecule = array1[0] * array1[4] - array1[1] * array1[3]
        denominator = array1[1] * array1[4]
        greatest_common_divisor = gcd(molecule, denominator)
        array1.push(molecule / greatest_common_divisor)
        array1.push(denominator / greatest_common_divisor)
      when 2
        molecule = array1[0] * array1[3]
        denominator = array1[1] * array1[4]
        greatest_common_divisor = gcd(molecule, denominator)
        array1.push(molecule / greatest_common_divisor)
        array1.push(denominator / greatest_common_divisor)
      else
        molecule = array1[0] * array1[4]
        denominator = array1[1] * array1[3]
        greatest_common_divisor = gcd(molecule, denominator)
        array1.push(molecule / greatest_common_divisor)
        array1.push(denominator / greatest_common_divisor)
      end
      @array.push([array1[0],array1[2],array1[3],array1[5],array1[1],array1[4],array1[6]])
    end
  end

  private
    def factorization_unit
      ret = []
      r = rand(5) + 1
      ret.push(r)
      r = rand(19) - 9
      ret.push(r)
      r = rand(3) + 1
      ret.push(r)
      r = rand(19) - 9
      ret.push(r)
      if ret[1] == 0 && ret[3] == 0
        return factorization_unit
      else
        return ret
      end
    end

    def junior_factorization_unit
      ret = []
      r = rand(19) - 9
      ret.push(r)
      r = rand(19) - 9
      ret.push(r)
      if ret[1] == 0 && ret[0] == 0
        return junior_factorization_unit
      else
        return ret
      end
    end

    def square_completed_unit
      ret = []
      r = rand(11) - 5
      ret.push(r)
      r = rand(19) - 9
      ret.push(r)
      r = rand(19) - 9
      ret.push(r)
      if ret[0] == 0 || ret[1] == 0 || ret[2] == 0
        return square_completed_unit
      else
        return ret
      end
    end

    def fraction_unit
      ret = []
      r = rand(19) - 9
      ret.push(r)
      r = rand(9) + 1
      ret.push(r)
      if gcd(ret[0], ret[1]) == 1
        return ret
      else
        return fraction_unit
      end
    end

    def gcd x,y
      if y == 0
        return x
      elsif x % y == 0
        if y < 0
          return -y
        else
          return y
        end
      else
        return gcd y, x % y
      end
    end

end
