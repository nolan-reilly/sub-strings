def sub_strings(word, dictionary)  
  # Populate an array with each possible substring of the word
  arr = []
  for i in 0..word.length - 1
    for j in i..word.length - 1
      arr.push(word[i..j])
    end
  end

  # Create hash with counts
  counts = {}

  for word in arr
    word.downcase! # Lower case the word here to make sure we're case insensitive

    if dictionary.include?(word)
      counts.key?(word) ? counts[word] += 1 : counts[word] = 1
    end
  end

  return counts
end
