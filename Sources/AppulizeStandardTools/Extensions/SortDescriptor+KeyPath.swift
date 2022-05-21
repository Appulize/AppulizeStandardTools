/**
 Copyright 2022 Maciej Swic
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import Foundation

struct SortDescriptor<Value> {
    var comparator: (Value, Value) -> ComparisonResult
}

extension SortDescriptor {
    static func keyPath<T: Comparable>(_ keyPath: KeyPath<Value, T?>) -> Self {
        Self { rootA, rootB in
            let valueA = rootA[keyPath: keyPath]
            let valueB = rootB[keyPath: keyPath]
            
            guard valueA != valueB else {
                return .orderedSame
            }
            
            guard let valueA = valueA else {
                return .orderedSame
            }
            
            guard let valueB = valueB else {
                return .orderedSame
            }
            
            return valueA < valueB ? .orderedAscending : .orderedDescending
        }
    }
    
    static func keyPath<T: Comparable>(_ keyPath: KeyPath<Value, T>) -> Self {
        Self { rootA, rootB in
            let valueA = rootA[keyPath: keyPath]
            let valueB = rootB[keyPath: keyPath]
            
            guard valueA != valueB else {
                return .orderedSame
            }
            
            return valueA < valueB ? .orderedAscending : .orderedDescending
        }
    }
}

enum SortOrder {
    case forward
    case reverse
}

extension Sequence {
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        sorted { lhs, rhs in
            lhs[keyPath: keyPath] < rhs[keyPath: keyPath]
        }
    }
    
    func sorted(using descriptors: SortDescriptor<Element>...) -> [Element] {
        sorted(using: descriptors, order: .forward)
    }
    
    func sorted(using descriptors: [SortDescriptor<Element>],
                order: SortOrder) -> [Element] {
        sorted { valueA, valueB in
            for descriptor in descriptors {
                let result = descriptor.comparator(valueA, valueB)
                
                switch result {
                case .orderedSame:
                    break
                case .orderedAscending:
                    return order == .forward
                case .orderedDescending:
                    return order == .reverse
                }
            }
            
            return false
        }
    }
}
