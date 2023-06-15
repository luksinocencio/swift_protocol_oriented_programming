import Foundation

// defining generic functions and methods

func equals<T: Equatable>(lhs: T, rhs: T) -> Bool {
    return lhs == rhs
}

print(equals(lhs: "abcd", rhs: "dcba"))
print(equals(lhs: Double.pi, rhs: 3.141592653589793))

print(Double.pi)

let d1 = Data(repeating: 1, count: 10)
let d2 = Data(repeating: 1, count: 10)
equals(lhs: d1, rhs: d2)

