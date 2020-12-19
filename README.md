# promisify - Convert callback functions to Future

This μFramework introduces a way to convert old callback-based functions that accept callback as an argument, to functions that return Future<T, Error> instances. It allows painless `chaining` for function calls, instead of `pyramid of callback doom`. 

# Usage

Lets put that you are migrating your app to Combine framework and you have to use some of your code that may look like that little service below.

```swift
class UserNotificationService {
  
  static let shared = UserNotificationService()
  private init() {}
  
  func authorizeNotifications(granted: @escaping (Bool) -> Void) {
    UNUserNotificationCenter
      .current()
      .requestAuthorization(
        options: [.alert, .sound, .badge]
      ) { (permissionGranted, error) in
        let value = permissionGranted && error == nil
        granted(value)
      }
  }
  
  func getAuthorizationStatus(granted: @escaping (Bool) -> Void) {
    UNUserNotificationCenter
      .current()
      .getNotificationSettings { (settings) in
        let value = settings.authorizationStatus == .authorized
        granted(value)
      }
  }
}
```

Using this code above `as-is` will be clumsy, requiring you to manually create wrappers each time you want to use it. Like this:

```swift
// for simplicity details are omitted

turnOnNotificationsButtonTap
    .flatMap { _ -> AnyPublisher<Bool, Never> in
        return Future { promise in
            UserNotificationService.shared().authorizeNotifications { granted in
                promise(.success(granted))
            }
        }
        .eraseToAnyPublisher()
    }
    .sink(receiveValue: { value in 
        print("Notifications are allowed - \(value)")
    })
```

Instead, with `promisify` you can write code like this:

```swift
turnOnNotificationsButtonTap
    .flatMap { _ -> AnyPublisher<Bool, Never> in
        return promisify(UserNotificationService.shared().authorizeNotifications)().eraseToAnyPublisher() // eloquent and simple
    }
    .sink(receiveValue: { value in 
        print("Notifications are allowed - \(value)")
    })
```

If your callback-based functions take arguments, just add them after `promisify` call:

```swift
// example
func iTakeArguments(arg0: String, arg1: String, completion: () -> Void) {
    
}

// usage

let result: Promise<Void, Never> = promisify(iTakeArguments)(("argument0", "argument1"))
```

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Alamofire does support its use on supported platforms.

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/alexey-savchenko/promisify.git", .branch("main"))
]
```
