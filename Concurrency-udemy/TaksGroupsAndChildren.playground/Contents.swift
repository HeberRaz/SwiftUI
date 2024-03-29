import UIKit

// MARK: - Enums
enum CookingError: Error {
    case insufficientResources
}
enum Time {
    case hours(Int)
}

// MARK: - Protocols
protocol Ingredient {}

// MARK: - Structs
struct Dish {
    let ingredients: [Ingredient]
}
struct Meal {}
protocol Vegetable {
    func chopped() async throws -> Vegetable
}
extension Vegetable {
    func chopped() async throws -> Vegetable {
        // Chop vegetable
        Carrot()
    }
}
struct Carrot: Vegetable {
    func chopped() async throws -> Vegetable {
        Carrot()
    }
}
struct Onion: Vegetable {
    func chopped() async throws -> Vegetable {
        Onion()
    }
}
typealias Vegetables = [Vegetable]
extension Vegetables: Ingredient {}
struct Meat: Ingredient {}
struct Oven {
    func cook(dish: Dish, duration: Time) async throws -> Meal {
        Meal()
    }
}

struct Preparation {
    // Concurrently chop the vegetables.
    func chopVegetables() async throws -> Vegetables {
        // Create a task group where each child task produces a Vegetable.
        try await withThrowingTaskGroup(of: Vegetable.self) { group in
            var rawVeggies: Vegetables = getRawVeggies()
            var choppedVeggies = Vegetables()

            // Create a new child task for each vegetable that needs to be chopped.
            for veggie in rawVeggies {
                group.addTask {
                    try await veggie.chopped()
                }
            }
            // Wait for all the chopping to complete, collecting the veggies into the result array in whatever order they're ready.
            while let choppedVeggie = try await group.next() {
                choppedVeggies.append(choppedVeggie)
            }
            return choppedVeggies
        }
    }

    func getRawVeggies() -> Vegetables {
        return Vegetables()
    }

    func marinateMeat() async -> Meat {
        Meat()
    }

    func preheatOven(temperature: Double) async throws -> Oven {
        Oven()
    }

    func makeDinner() async throws -> Meal {
        // Prepare some variables to receive results from our concurrent child tasks
        var veggies: [Vegetable]?
        var meat: Meat?
        var oven: Oven?

        enum CookingStep {
            case veggies([Vegetable])
            case meat(Meat)
            case oven(Oven)
        }

        // Create a task group to scope the lifetime of our three child tasks
        try await withThrowingTaskGroup(of: CookingStep.self) { group in
            group.addTask {
                try await .veggies(chopVegetables())
            }
            group.addTask {
                await .meat(marinateMeat())
            }
            group.addTask {
                try await .oven(preheatOven(temperature: 350))
            }

            for try await finishedStep in group {
                switch finishedStep {
                case .veggies(let choppedVegetables):
                    veggies = choppedVegetables
                case .meat(let marinatedMeat):
                    meat = marinatedMeat
                case .oven(let preheatedOven):
                    oven = preheatedOven
                }
            }
        }
        /* If execution resumes normally after withThrowingTaskGroup, we can assume that all child tasks added to the group completed successfully. That means we can confidently force-unwrap the variables containing the child tasks results here*/
        guard let veggies,
              let meat,
              let oven else {
            throw CookingError.insufficientResources
        }

        let dish: Dish = Dish(ingredients: [veggies, meat])

        return try await oven.cook(dish: dish, duration: .hours(3))
    }
}

struct Eat {
    @MainActor
    static func main() async throws {
        let preparation = Preparation()
        let meal = try await preparation.makeDinner()
        print("--> meal", meal)
    }
}

// You can test Eat.main() enclosing it in a Task
//  Task {
//      try await Eat.main()
//  }

struct Cancellation {
    func chopVegetables() async throws -> Vegetables {
        return try await withThrowingTaskGroup(of: Vegetable.self) { group in
            var veggies: Vegetables = []
            group.addTask {
                try await chop(Carrot())
            }

            group.addTask {
                try await chop(Onion())
            }

            for try await veggie in group {
                veggies.append(veggie)
            }

            return veggies
        }
    }

    func chop(_ vegetable: Vegetable) async throws -> Vegetable {
        try Task.checkCancellation() // automatically throws `CancelationError`
        // chop, chop, chop ...
        guard !Task.isCancelled else {
            print("Cancelled mid-way through chopping of \(vegetable)!")
            throw CancellationError()
        }
        // chop, chop, chop ...
        return Carrot()
    }
}
