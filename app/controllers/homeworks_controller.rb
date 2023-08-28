class HomeworksController < ApplicationController
  after_action :allow_iframe
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
    order_array = [0,1,2,3,4,5,6,7,8,9]
    for i in 0..9 do
      r = rand(10)
      keep = order_array[i]
      order_array[i] = order_array[r]
      order_array[r] = keep
    end
    order_array = [[ order_array[0], order_array[1] ],[ order_array[2], order_array[3] ]]
    @junior_array = []
    for i in 0..9 do
      if order_array[0].include?(i)
        @junior_array.push(special_junior_factorization_unit(1))
      elsif order_array[1].include?(i)
        @junior_array.push(special_junior_factorization_unit(-1))
      else
        @junior_array.push(junior_factorization_unit)
      end
    end
    @array = []
    for i in 0..9 do
      if order_array[0].include?(i)
        @array.push(special_factorization_unit(1))
      elsif order_array[1].include?(i)
        @array.push(special_factorization_unit(-1))
      else
        @array.push(factorization_unit)
      end
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

  def equation
    @array1 = []
    for i in 0..9 do
      @array1.push( system_of_equation_k_unit(1) + [[ rand(9) - 4, rand(9) - 4]] )
    end
    @array2 = []
    for i in 0..5 do
      @array2.push( system_of_equation_k_unit(2) )
    end
    @transform_dic = {}
    for i in 1..250 do
      @transform_dic[i] = [1,i]
    end
    ([1] + root_unit).each do |i|
      for j in 2..15 do
        @transform_dic[j*j*i] = [j,i]
      end
    end
    @transform_dic[0] = [0,1]
    @array3 = []
    for i in 0..9 do
      r = rand(2)
      if r == 0
        @array3.push([r] + sqeq_unit)
      else
        @array3.push([r, rand(4) + 1] + sqeq_factorization_unit )
      end
    end
    @array4 = []
    for i in 0..1 do
      @array4.push( system_of_equation_k_unit(3) )
    end
  end

  def root
    @array = []
    @rationalization_array = []
    @add_array = []
    for i in 0..19
      r = rand(5)
      if r == 0
        @array.push( root_a_unit )
      else
        @array.push( root_ab_unit)
      end
      @rationalization_array.push(rationalization_unit)
      @add_array.push(root_add_unit)
    end
    
    @transform_dic = {}
    for i in 1..250 do
      @transform_dic[i] = [1,i]
    end
    ([1] + root_unit).each do |i|
      for j in 2..15 do
        @transform_dic[j*j*i] = [j,i]
      end
    end
    @transform_dic[0] = [0,1]
    
  end

  def gcd_lcm
    @array = [[],[],[]]
    for i in 0..9 do
      @array[0].push(gcd_lcm_unit(100))
      @array[1].push(gcd_lcm_unit(200))
      @array[2].push(gcd_lcm_unit(650))
    end
  end

  def set_session
    sym = params[:pageName].to_sym
    session[sym] = {}
    params.each do |key,value|
      session[sym][key.to_sym] = value.to_i if !["controller", "action", "pageName"].include?(key)
    end
    render json: session[sym]
  end

  def trigonometric
    @sin = {}
    @cos = {}
    @tan = {}

    @sin["0°"] = ["","0","1"]
    @cos["0°"] = ["","1","1"]
    @tan["0°"] = ["","0","1"]
    
    @sin["15°"] = ["","√6-√2","4"]
    @cos["15°"] = ["","√6+√2","4"]
    @tan["15°"] = ["","√6-√2","√6+√2"]
    
    @sin["30°"] = ["","1","2"]
    @cos["30°"] = ["","√3","2"]
    @tan["30°"] = ["","1","√3"]
    
    @sin["45°"] = ["","1","√2"]
    @cos["45°"] = ["","1","√2"]
    @tan["45°"] = ["","1","1"]
    
    @sin["60°"] = ["","√3","2"]
    @cos["60°"] = ["","1","2"]
    @tan["60°"] = ["","√3","1"]
    
    @sin["75°"] = ["","√6+√2","4"]
    @cos["75°"] = ["","√6-√2","4"]
    @tan["75°"] = ["","√6+√2","√6-√2"]
    
    @sin["90°"] = ["","1","1"]
    @cos["90°"] = ["","0","1"]
    @tan["90°"] = ["","なし","1"]

    @sin["105°"] = ["","√6+√2","4"]
    @cos["105°"] = ["-","√6-√2","4"]
    @tan["105°"] = ["-","√6+√2","√6-√2"]

    @sin["120°"] = ["","√3","2"]
    @cos["120°"] = ["-","1","2"]
    @tan["120°"] = ["-","√3","1"]

    @sin["135°"] = ["","1","√2"]
    @cos["135°"] = ["-","1","√2"]
    @tan["135°"] = ["-","1","1"]

    @sin["150°"] = ["","1","2"]
    @cos["150°"] = ["-","√3","2"]
    @tan["150°"] = ["-","1","√3"]

    @sin["165°"] = ["","√6-√2","4"]
    @cos["165°"] = ["-","√6+√2","4"]
    @tan["165°"] = ["-","√6-√2","√6+√2"]

    @sin["180°"] = ["","0","1"]
    @cos["180°"] = ["","1","1"]
    @tan["180°"] = ["","0","1"]

    @sin["90°-θ"] = ["", "cos(θ)", "1"]
    @cos["90°-θ"] = ["", "sin(θ)", "1"]
    @tan["90°-θ"] = ["", "1", "tan(θ)"]

    @sin["90°+θ"] = ["", "cos(θ)", "1"]
    @cos["90°+θ"] = ["-", "sin(θ)", "1"]
    @tan["90°+θ"] = ["-", "1", "tan(θ)"]
    
    @sin["180°-θ"] = ["", "sin(θ)", "1"]
    @cos["180°-θ"] = ["-", "cos(θ)", "1"]
    @tan["180°-θ"] = ["-", "tan(θ)", "1"]
    
    @sin["α+β"] = ["", "sin(α)cos(β)+cos(α)sin(β)", "1"]
    @cos["α+β"] = ["", "cos(α)cos(β)-sin(α)sin(β)", "1"]
    @tan["α+β"] = ["", "tan(α)+tan(β)", "1-tan(α)tan(β)"]

    @sin["α-β"] = ["", "sin(α)cos(β)-cos(α)sin(β)", "1"]
    @cos["α-β"] = ["", "cos(α)cos(β)+sin(α)sin(β)", "1"]
    @tan["α-β"] = ["", "tan(α)-tan(β)", "1+tan(α)tan(β)"]
    
    @funcs = ["sin","cos","tan"]
    @keys = @sin.keys
    @rand_array = []
    for i in 0..19 do
      @rand_array.push([rand(@funcs.length), rand(@keys.length)])
    end
  end

  def graph
    @array1 = []
    @array2 = []
    @array3 = []
    for i in 0..3 do
      @array1.push(proportional_func_unit)
      @array2.push(linear_func_unit)
      @array3.push(quadratic_func_unit)
    end
  end

  private

    def allow_iframe
      url="https://yoshihisatanaka-prog.github.io"
      response.headers['X-Frame-Options'] = "ALLOW-FROM #{url}"
      response.headers['Content-Security-Policy'] = "frame-ancestors #{url}"
    end

    def proportional_func_unit
      r1 = rand(2)
      r2 = rand(2)
      r3 = rand(5) + 1
      r4 = rand(5) + 1
      g = gcd(r3,r4)
      r5 = rand(2)
      question = {}
      if r5 == 0
        question[:constant] = true
      elsif r1 == 0
        r6 = rand(5) + 1
        if rand(2) == 0
          r6 = - r6
        end
        question[:point] = [r2, r4/g * r6, r3/g * r6]
      else
        if rand(2) == 0
          question[:point] = [r2, r3, r4]
        else
          question[:point] = [r2, -r3, -r4]
        end
      end
      if r1 == 0
        return {mode: 0, constant: [r2, r3/g, r4/g], question: question}
      end
      return {mode: 1, constant: [r2, r3*r4,1], question: question}
    end

    def linear_func_unit
      r1 = rand(2)
      r2 = rand(5) + 1
      r3 = rand(5) + 1
      r4 = rand(2)
      r5 = rand(3) + 1
      g = gcd(r2,r3)
      question = {}
      question[:constant] = [rand(2), rand(2)]
      if question[:constant][0] == 0 && question[:constant][1] == 0
        point_x_list = linear_func_two_points_unit
        points = []
        point_x_list.each do |point_x|
          point = []
          point.push(point_x * r3 / g)
          a = 0
          if r1 == 0
            a = r2/g
          else
            a = - r2/g
          end
          b = 0
          if r4 == 0
            b = r5
          else
            b = - r5
          end
          point.push(point_x * a + b)
          points.push(point)
        end
        question[:points] = points
      elsif question[:constant].include?(0)
        point = []
        point_x = rand(5) + 1
        if rand(2) == 0
          point_x = - point_x
        end
        point.push(point_x * r3 / g)
        a = 0
        if r1 == 0
          a = r2/g
        else
          a = - r2/g
        end
        b = 0
        if r4 == 0
          b = r5
        else
          b = - r5
        end
        point.push(point_x * a + b)
        question[:points] = [point]
      else
        question[:points] = []
      end
      return {constant: [[r1, r2/g, r3/g], [r4, r5]], question: question}
    end

    def linear_func_two_points_unit
      r1 = rand(5) + 1
      if rand(2) == 0
        r1 = - r1
      end
      r2 = rand(5) + 1
      if rand(2) == 0
        r2 = - r2
      end
      if r1 == r2
        return linear_func_two_points_unit
      else
        return [r1,r2]
      end
    end

    def quadratic_func_unit
      r1 = rand(2)
      r2 = rand(5) + 1
      r3 = rand(5) + 1
      g = gcd(r2,r3)
      return {constant: [r1,r2/g, r3/g], question: {}}
    end

    def gcd_lcm_unit(max)
      r1 = rand(9) + 1
      r2 = rand(9) + 1
      r3 = rand(9) + 1
      if r2 == r3
        return gcd_lcm_unit(max)
      elsif r1 == 1 && (r2 == 1 || r3 == 1)
        return gcd_lcm_unit(max)
      elsif r1 * r2 * r3 / gcd(r2,r3) > max
        return gcd_lcm_unit(max)
      else
        return [r1*r2, r1*r3]
      end
    end

    def special_factorization_unit(mode)
      r1 = rand(3) + 1
      r2 = rand(9) + 1
      fugo = rand(2)
      if fugo == 0
        r2 = -r2
      end 
      return [r1, r2, r1, r2 * mode]
    end

    def special_junior_factorization_unit(mode)
      r = rand(9) + 1
      fugo = rand(2)
      if fugo == 0
        r = -r
      end
      return [r, r * mode]
    end

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
      if ret[0] == 0
        return fraction_unit
      elsif gcd(ret[0], ret[1]) == 1
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
      
      if ret[0] == 0
        return plus_fraction_unit(max)
      elsif gcd(ret[0], ret[1]) == 1 && ret[0].to_f / ret[1].to_f < max
        return ret
      else
        return plus_fraction_unit(max)
      end
    end

    def sqeq_factorization_unit
      return [rand(19)-9, rand(19)-9]
    end

    def sqeq_unit
      a = rand(4) + 1
      b = rand(19) - 9
      c = rand(19) - 9
      if discriminant_judge(a,b,c)
        return [a,b,c]
      else
        return sqeq_unit
      end
    end

    def discriminant_judge(a,b,c)
      d = b*b - 4*a*c
      if d < 0
        return false
      else
        return true
      end
    end

    def system_of_equation_k_unit num
      keisuu = []
      for i in 1..num do
        keisuu.push([])
        for j in 1..num do
          keisuu[i-1].push( rand(11) - 5 )
        end
      end
      if det(keisuu) == 0
        return system_of_equation_k_unit(num)
      else
        if num == 2
          keisuu.each do |k|
            k.each do |i|
              if i == 0
                return system_of_equation_k_unit(num)
              end
            end
          end
        end
        return keisuu.push( system_of_equation_t_unit(num) )
      end
    end

    def det matrix
      size = matrix.size
      
      return matrix[0][0] if size == 1

      return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0] if size == 2
      
      return matrix[0][0] * (matrix[1][1] * matrix[2][2] - matrix[1][2] * matrix[2][1]) -
         matrix[0][1] * (matrix[1][0] * matrix[2][2] - matrix[1][2] * matrix[2][0]) +
         matrix[0][2] * (matrix[1][0] * matrix[2][1] - matrix[1][1] * matrix[2][0])
    end

    def system_of_equation_t_unit num
      teisuu = []
      for i in 1..num do
        teisuu.append( rand(11) - 5 )
      end
      if is_all_0(teisuu)
        return system_of_equation_t_unit(num)
      else
        return teisuu
      end
    end

    def is_all_0 array
      array.each do |i|
        if i != 0
          return false
        end
      end
      return true
    end

    def root_ab_unit
      ret = [0,0]
      r = rand(15)
      ret[1] = root_unit[r]
      ret[0] = rand(6) + 2
      if ret[0] * ret[0] * ret[1] > 99
        return root_ab_unit
      else
        return ret
      end
    end

    def root_a_unit
      non_a_array = []
      for j in 0..9
        non_a_array << j*j
      end
      root_unit.each do |i|
        for j in 1..7
          non_a_array << j*j*i
        end
      end
      r = rand(100)
      if non_a_array.include?(r)
        return root_a_unit
      else
        return [1,r]
      end
    end

    def root_unit
      return [2,3,5,6,7,10,11,13,14,15,17,19,21,22,23,26,29,30,31,33,34,35,37,38,39,41,42,46,47,51,53,55,57,58,59,61,62]
    end

    def rationalization_unit
      ret = plus_fraction_unit(10) + plus_fraction_unit(10)
      if [1,4,8,9].include?(ret[2]) || [1,4,8,9].include?(ret[3])
        return rationalization_unit
      elsif ret[1] * ret[1] * ret[3] > 100
        return rationalization_unit
      else
        if ret[2] == 4
          ret[0] = ret[0] * 2
          ret[2] = 1
        elsif ret[2] == 9
          ret[0] = ret[0] * 3
          ret[2] = 1
        end
        return ret
      end
    end

    def root_add_unit
      ret = [0, 0, 0, 0, 0]
      if rand(5) == 0
        ret[1] = root_unit[rand(5)]
        ret[4] = root_unit[rand(5)]
      else
        ret[1] = root_unit[rand(5)]
        ret[4] = ret[1]
      end
      ret[0] = rand(5) + 1
      ret[3] = rand(5) + 1
      ret[2] = rand(2)
      if ret[0] * ret[0] * ret[1] > 100 || ret[3] * ret[3] * ret[4] > 100
        return root_add_unit
      end
      return ret
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
