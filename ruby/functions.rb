#Factorial

def factorial(f1)
    factorial = f1
    if factorial == 0
        factorial = 1
    else
        while f1 > 1 
            f1 -= 1
            factorial = factorial * f1
        end
    end
    return factorial
end

#Reverse

def reverse(string)
    string_reverse = string.dup
    j = string.length - 1
    for i in 0..j
        string_reverse[j] = string[i]
        j -= 1
    end
    return string_reverse
end

#Sort

def sort(a1)
    aux = 0
    for i in 1...a1.size
        for j in 0...a1.size - 1
            if a1[i] < a1[j]
                aux = a1[j]
                a1[j] = a1[i]
                a1[i] = aux
            end
        end
    end
    return a1
end

#Upcase

def upcase(string)
    hash_abc = {"a" => "A", "b" => "B", "c" => 'C', "d" => 'D', "e" => 'E', "f" => 'F', "g" => 'G', "h" => 'H', "i" => 'I', "j" => 'J', "k" => 'K',
        "l" => 'L', "m" => 'M', "n" => 'N', "o" => 'O', "p" => 'P', "q" => 'Q', "r" => 'R', "s" => 'S', "t" => 'T', "u" => 'U', "v" => 'V', "w" => 'W',"x" => 'X',
        "y" => 'Y', "z" => 'Z'}
    
    for i in 0..string.size
        hash_abc.each do |key, value|
            if string[i] == key    
                string[i] = value     
            end
        end
    end
    return string
end