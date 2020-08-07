//
//  main.swift
//  L6_TimokhinMaksim(HW)
//
//  Created by Максим Тимохин on 07.08.2020.
//  Copyright © 2020 Максим Тимохин. All rights reserved.
//

import Foundation

//
//  main.swift
//  L6_TimokhimMaksim(HW)
//
//  Created by Максим Тимохин on 03.08.2020.
//  Copyright © 2020 Максим Тимохин. All rights reserved.
//

import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue<T> {
    private var store = [T]()
    
    mutating func inqueue(_ item: T)  {
        store.append(item)
    }
    mutating func outqueue() -> T? {
        guard store.count > 0 else {return nil}
        return store.removeFirst()
    }
    
 
    
}
extension Queue: CustomStringConvertible {
    var description: String {
        return "\(store)"
    }
    
    
}

extension Queue {
    func filter(_ predicate:(T) -> Bool) -> [T] {
         var result = [T]()
         for item in store {
             if predicate(item) {
                 result.append(item)
             }
         }
         return result
     }
}

extension Queue {
    func map<Y>(_ transformPredicate: (T) -> Y) -> [Y] {
        var result = [Y]()
        for item in store {
            let transformedItem = transformPredicate(item)
            result.append(transformedItem)
        }
        return result
    }
}

extension Queue {
    subscript (index: Int) -> T? {
        guard index < store.count, index >= 0 else {return nil}
        return store[index]
    }
}
var queue = Queue<Int>()
queue.inqueue(10)
queue.inqueue(20)
queue.inqueue(30)


print(queue.filter({$0 < 20}))
print(queue.map({Double($0)}))

print("Спасибо за внимание")


