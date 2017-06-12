def random_string

    a = ("a".."z")
    b = (0..9)
    c = a.to_a + b.to_a 
    p c
    key = c.shuffle[0,8]#.join
  end

  p random_string