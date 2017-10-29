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
