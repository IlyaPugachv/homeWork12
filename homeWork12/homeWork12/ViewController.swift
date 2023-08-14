import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //MARK: - task 1
        
        //Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
        
        let collection: [Any] = [0.01, 0.033, 28, 756, "magic", true]
        print(collection)
        
        //MARK: - task 2
        
        // Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
        
        for element in collection {
            switch element {
            case is Int:
                print("Целое число: \(element)")
            case is String:
                print("Строка: \(element)")
            case is Bool:
                print("Булевое значение: \(element)")
            case is Double:
                print("Вещественное число: \(element)")
            default:
                print("Error")
            }
        }
        
        //MARK: - task 3
        
        //Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите крассиво на консоль пары ключ/значения для всех элементов коллекции.
        
        let dictionary: [String : Any] = [
            "ageBoy" : 22,
            "ageGirl" : 18,
            "isStudent" : true,
            "isDeveloper" : false,
            "firstName" : "Ilya",
            "lastName" : "Pugachev",
            "weight" : 1.90,
            "height" : 80
        ]
        
        for (key, value) in dictionary {
            print("-----------------------")
            print("\(key): \(value)")
        }
        
        //MARK: - task 4
        
        //Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.
        //Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
        
        var total = 0.0
        
        for value in dictionary.values {
            guard let strValue = value as? String else {
                guard let boolValue = value as? Bool else {
                    continue
                }
                total += boolValue ? 2.0 : -3.0
                continue
            }
            total += 1.0
        }
        
        print(total)
        
        //MARK: - task 5
        
        //Обнулите переменную `total` и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.
        //Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.
        //Распечатайте итог.
        
        func calculateTotalValue(with collection: [Any]) -> Double {
            var total = 0.0
            for value in collection {
                guard let number = value as? Int else {
                    guard let doubleNumber = value as? Double else {
                        guard let string = value as? String, let convertedNumber = Double(string) else {
                            return total
                        }
                        total += convertedNumber
                        continue
                    }
                    total += doubleNumber
                    continue
                }
                total += Double(number)
            }
            return total
        }
        
        let totalValue = calculateTotalValue(with: collection)
        print(totalValue)
    }
}

