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
  end

  def factorization
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

end
