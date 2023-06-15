import Foundation

// the importance of generics

func equals(lhs: Int, rhs: Int) -> Bool {
    return lhs == rhs
}

print(equals(lhs: 3, rhs: 4))
// Error different type
//print(equals(lhs: 1.4, rhs: 1.5))
