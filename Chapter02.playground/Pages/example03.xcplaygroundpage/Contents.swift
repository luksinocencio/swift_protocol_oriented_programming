import Foundation

// using polymorphism

protocol Shape {
    var area: Double { get }
}

struct Reactangle: Shape {
    var height: Double
    var width: Double
    
    var area: Double {
        return height * width
    }
}

struct Square: Shape {
    let side: Double
    
    var area: Double {
        return side * side
    }
}

struct Rhombus: Shape {
    let p: Double
    let q: Double
    var area: Double {
        return (p*q)/2
    }
}

struct Circle: Shape {
    let radius: Double
    var area: Double {
        return M_PI * radius * radius
    }
}

var shape: Shape

shape = Reactangle(height: 10, width: 20)
//print(shape.area)

shape = Circle(radius: 42)
//print(shape.area)

shape = Rhombus(p: 4, q: 6)
//print(shape.area)

var shapes = [Shape]()
shapes.append(Square(side: 10))
shapes.append(Reactangle(height: 5, width: 10))
shapes.append(Rhombus(p: 1, q: 12))
shapes.append(Circle(radius: 3))

for shape in shapes {
    print(shape.area)
}
