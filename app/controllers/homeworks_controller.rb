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
    
    @array1 = []
    for i in 0..9 do
      @array1.push( array[i] )
    end

    for i in 0..16
      r = rand(17)
      k = array[i]
      array[i] = array[r]
      array[r] = k
    end

    @array2 = []
    for i in 0..9 do
      @array2.push( array[i] )
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

    @array3 = []
    for i in 0..9 do
      @array3.push( array[i] )
    end

    for i in 0..9
      r = rand(9)
      k = array[i]
      array[i] = array[r]
      array[r] = k
    end

    @array4 = []
    for i in 0..9 do
      @array4.push( array[i] )
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

  def factorization
    @junior_array = []
    for i in 0..9 do
      @junior_array.push(junior_factorization_unit) 
    end
    @array = []
    for i in 0..9 do
      @array.push(factorization_unit) 
    end
  end

  def square_completed
    @array = []
    for i in 0..9 do
      @array.push(square_completed_unit) 
    end
  end

  def fraction
    @array_primary = []
    for i in 0..9 do
      array1 = []
      array1 = array1 + plus_fraction_unit( 10 )
      r = rand(4) 
      array1.push(r)
      if r == 1
        if array1[0] == 1 && array1[1] ==9
          array1[1] = 2
        end
        array1 = array1 + plus_fraction_unit( array1[0].to_f / array1[1].to_f )
      else
        array1 = array1 + plus_fraction_unit( 10 )
      end
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
      @array_primary.push([array1[0],array1[2],array1[3],array1[5],array1[1],array1[4],array1[6]])
    end

    @array_junior = []
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
      @array_junior.push([array1[0],array1[2],array1[3],array1[5],array1[1],array1[4],array1[6]])
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

    def plus_fraction_unit max
      ret = []
      r = rand(9) + 1
      ret.push(r)
      r = rand(9) + 1
      ret.push(r)
      if gcd(ret[0], ret[1]) == 1 && ret[0].to_f / ret[1].to_f < max
        return ret
      else
        return plus_fraction_unit(max)
      end
    end

    def gcd x,y
      if y == 0
        return x
      elsif x == 0
        return y
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
