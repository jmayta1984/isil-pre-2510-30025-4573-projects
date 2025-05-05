let names = ["Ana", "Carlos", "Marcos", "Jimena"]

/*
 Imprime el primer y último elemento de la lista
 */

if let first = names.first, let last = names.last {
    print(first)
    print(last)
}

/*
 Imprime los nombres con más de 3 caracteres
 */
names.forEach {
    if ($0.count > 3) {
        print($0)
    }
}

let newNames = names.filter { $0.count > 3 }
print(newNames)

let numbers = [2, 4, 16, 17]

/*
 En base a lista de números, generar una nueva lista con cada número elevado al cuadrado.
 */

numbers.forEach { number in
    print (number * number)
}

let newNumbers = numbers.map { number in
    number * number
}
print(newNumbers)
