# SwiftHelper

## Inferred dot notation

If you have a class, struct, or enum, and you define or assign to a property whose type is already known to the Swift compiler, you don't need to explicitly specify the type when accessing the corresponding static property.

*Example*

```swift
// Consider the following enum
enum Direction {
  case north
  case south
  case east
  case west
}
```
Consider a property in some class or file that is of type `Direction`
```swift
// If we wanted to define it explicitly we would do the following:
let someProperty: Direction = Direction.north
```
But we don't need to do that, instead we can just do the following, wherein the Swift compiler will infer the type and automatically access the correct type for the specifiect static property
```swift
let someProperty: Direction = .north
```

## Closures 

```swift
let divide = {
   (val1: Int, val2: Int) -> Int in 
   return val1 / val2 
}

let result = divide(200, 20)
print (result)
```

## Enums

```swift
enum Student {
   case Name(String)
   case Mark(Int,Int,Int)
}

var studDetails = Student.Name("Swift 4")
var studMarks = Student.Mark(98,97,95)

switch studMarks {
   case .Name(let studName):
      print("Student name is: \(studName).")
   case .Mark(let Mark1, let Mark2, let Mark3):
      print("Student Marks are: \(Mark1),\(Mark2),\(Mark3).")
}
```

## Structs

```swift
struct MarksStruct {
   var mark: Int

   init(mark: Int) {
      self.mark = mark
   }
}

var aStruct = MarksStruct(mark: 98)
var bStruct = aStruct     // aStruct and bStruct are two structs with the same value!
bStruct.mark = 97

print(aStruct.mark)      // 98
print(bStruct.mark)      // 97
```
## Properties 

### Stored Property

Another method to have stored property is to have as constant structures. So the whole instance of the structures will be considered as 'Stored Properties of Constants'.

```swift
struct Number {
   var digits: Int
   let numbers = 3.1415
}

var n = Number(digits: 12345)
n.digits = 67

print("\(n.digits)")
print("\(n.numbers)")
n.numbers = 8.7
```
### Computed Property

Rather than storing the values computed properties provide a getter and an optional setter to retrieve and set other properties and values indirectly.

```swift
class sample {
   var no1 = 0.0, no2 = 0.0
   var length = 300.0, breadth = 150.0

   var middle: (Double, Double) {
      get {
         return (length / 2, breadth / 2)
      }
      
      set(axis){
         no1 = axis.0 - (length / 2)
         no2 = axis.1 - (breadth / 2)
      }
   }
}

var result = sample()
print(result.middle)
result.middle = (0.0, 10.0)

print(result.no1)
print(result.no2)
```
## Inheritance 

The act of basing a new class on an existing class is defined as 'Subclass'. The subclass inherits the properties, methods and functions of its base class. To define a subclass ':' is used before the base class name

```swift
class StudDetails {
   var mark1: Int;
   var mark2: Int;
   
   init(stm1:Int, results stm2:Int) {
      mark1 = stm1;
      mark2 = stm2;
   }
   func print() {
      print("Mark1:\(mark1), Mark2:\(mark2)")
   }
}

class display : StudDetails {
   init() {
      super.init(stm1: 93, results: 89)
   }
}

let marksobtained = display()
marksobtained.print()
```
When we run the above program using playground, we get the following result −

Mark1:93, Mark2:89

### Deinitialization

```swift
var counter = 0; // for reference counting
class baseclass {
   init() {
      counter++;
   }
   deinit {
      counter--;
   }
}
var print: baseclass? = baseclass()

print(counter)
print = nil
print(counter)
```
When we run the above program using playground, we get the following result −

1
0
When print = nil statement is omitted the values of the counter retains the same since it is not deinitialized.
