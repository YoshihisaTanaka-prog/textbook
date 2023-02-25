class HomeworksController < ApplicationController
  def square_calculation
    array = []
    for i in 1..20
      array.push(i)
    end
    for i in 0..19
      r = rand(20)
      k = array[i]
      array[i] = array[r]
      array[r] = k
    end
    
    @array1 = []
    for i in 0..9 do
      @array1.push( array[i] )
    end

    for i in 0..19
      r = rand(20)
      k = array[i]
      array[i] = array[r]
      array[r] = k
    end

    @array2 = []
    for i in 0..9 do
      @array2.push( array[i] )
    end
  end

  def factorization
    @array = []
    for i in 0..4 do
      @array.push(factorization_unit) 
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
      return ret
    end

end
