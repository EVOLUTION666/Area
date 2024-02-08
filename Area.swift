import Foundation
import XCTest

protocol Shape {
    func area() -> Double
}

// MARK: - Circle

class Circle: Shape {
    let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
}

// MARK: - Triangle

class Triangle: Shape {
    let sideA: Double
    let sideB: Double
    let sideC: Double
    
    init(sideA: Double, sideB: Double, sideC: Double) {
        self.sideA = sideA
        self.sideB = sideB
        self.sideC = sideC
    }
    
    func area() -> Double {
        let s = (sideA + sideB + sideC) / 2
        return sqrt(s * (s - sideA) * (s - sideB) * (s - sideC))
    }
    
    func isRightAngled() -> Bool {
        let sides = [sideA, sideB, sideC].sorted()
        return sides[0]*sides[0] + sides[1]*sides[1] == sides[2]*sides[2]
    }
}

func calculateArea(shape: Shape) -> Double {
    return shape.area()
}

let circle = Circle(radius: 5)
let triangle = Triangle(sideA: 3, sideB: 4, sideC: 5)

print("Площадь круга: \(circle.area())")
print("Площадь треугольника: \(triangle.area())")
print("Треугольник прямоугольный: \(triangle.isRightAngled())")
print("\(calculateArea(shape: circle))")
print("\(calculateArea(shape: triangle))")



// MARK: - Tests

class ShapeTests: XCTestCase {
    
    func testCircleArea() {
        let circle = Circle(radius: 5)
        XCTAssertEqual(circle.area(), Double.pi * 25)
        
    }
    
    func testTriangleArea() {
        let triangle = Triangle(sideA: 3, sideB: 4, sideC: 5)
        XCTAssertEqual(triangle.area(), 6.0)
    }
    
    func testRightAngledTriangle() {
        let triangle = Triangle(sideA: 3, sideB: 4, sideC: 5)
        XCTAssertTrue(triangle.isRightAngled())
    }
    
    func testCalculateArea() {
        let circle = Circle(radius: 5)
        let triangle = Triangle(sideA: 3, sideB: 4, sideC: 5)
        
        XCTAssertEqual(calculateArea(shape: circle), Double.pi * 25)
        XCTAssertEqual(calculateArea(shape: triangle), 6.0)
    }
    
}

let testSuite = ShapeTests.defaultTestSuite
testSuite.run()
