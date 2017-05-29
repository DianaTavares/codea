a=[["Memory", [["Internal Memory", "32 GB"], ["Card Type", "MicroSD"]]], ["Size", [["Width", "12cm"], ["height", "20cm"]]]]

def nested_arrays_to_hash(array)
  result = {}
  array.each do |elem|
    second = if elem.last.is_a?(Array)
      nested_arrays_to_hash(elem.last)
    else
      elem.last
    end
    result.merge!({elem.first.to_sym => second})
  end
  result
end
b=Hash[a]
p b