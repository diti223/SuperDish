//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.02.2024.
//

import Foundation
import Combine

class ListViewModel<T>: ObservableObject {
    
    public enum State {
        case empty
        case loading
        case items([T])
        case reloading(items: [T]?)
        
        var toReload: State {
            State.reloading(items: items)
        }
        
        var items: [T]? {
            switch self {
                case .reloading(let items):
                    return items
                case .items(let items):
                    return items
                default:
                    return nil
            }
        }
        
        var isLoading: Bool {
            switch self {
                case .loading, .reloading:
                    return true
                default:
                    return false
            }
        }
    }
    
    @Published public private(set) var errorMessage: String?
    @Published public private(set) var state: State = .empty
    
    public var isLoading: Bool {
        state.isLoading
    }
    
    public var items: [T]? {
        state.items
    }
    
    
    
    var fetchUseCase: UseCaseFetcher<[T]>
    
    public init(fetchUseCase: UseCaseFetcher<[T]>) {
        self.fetchUseCase = fetchUseCase
    }
    
    @MainActor
    public func onAppear() {
        Task { [weak self] in
            await self?.fetchOnAppear()
        }
    }
    
    @MainActor
    public func reload() {
        Task { [weak self] in
            await self?.refetch()
        }
    }
    
    
    
    private func fetchOnAppear() async {
        self.state = .loading
        await fetchData()
    }
    
    private func refetch() async {
        self.state = .reloading(items: items)
        await fetchData()
    }
    
    private func fetchData() async {
        do {
            let result = try await fetchUseCase.execute()
            self.state = .items(result)
        } catch {
            handleFetch(error: error)
        }
    }
    
    private func handleFetch(error: Error) {
        self.errorMessage = error.localizedDescription
    }
}

// loadable items
// creatable items
// listable items
// updatable items
// deletable items

class RestaurantsViewModel: ObservableObject {
    @Published var restaurants: [Restaurant]?
    
    var useCase: UseCaseFetcher<[Restaurant]>
    
    init(useCase: UseCaseFetcher<[Restaurant]>) {
        self.useCase = useCase
    }
}


class MenuViewModel: ObservableObject {
    @Published var items: [MenuItem]?
    var useCase: UseCaseFetcher<[Restaurant]>
    
    init(useCase: UseCaseFetcher<[Restaurant]>) {
        self.useCase = useCase
    }
}

class PlaceOrderViewModel: ObservableObject {
    @Published var items: [OrderItem]
    @Published var paymentDetails: PaymentDetails?
    @Published var deliveryDetails: DeliveryDetails?
    
    init(items: [OrderItem]) {
        self.items = items
    }
}

typealias Seconds = TimeInterval

class TrackOrderViewModel: ObservableObject {
    let order: Order
    @Published var status: OrderStatus
    @Published var durationTime: Seconds?
    
    var cancelUseCase: UseCaseVoid
    var statusReceiver: AnyPublisher<OrderStatus, Never>
    
    var canCancelOrder: Bool {
        if let durationTime, durationTime > 600 {
            return false
        }
        return true
    }
    
    var subscribers: Set<AnyCancellable> = []
    
    init(order: Order, status: OrderStatus, cancelUseCase: UseCaseVoid, statusReceiver: AnyPublisher<OrderStatus, Never>) {
        self.order = order
        self.status = status
        self.cancelUseCase = cancelUseCase
        self.statusReceiver = statusReceiver
        
        statusReceiver
            .assign(to: \.status, on: self)
            .store(in: &subscribers)
    }
    
    public func cancelOrder() {
        Task {
            do {
                try await cancelUseCase.execute()
            } catch {
                
            }
        }
    }
}

/// Values between 0 to 10 representing the rating for an order
typealias Rating = Int


struct OrderRating {
    var food: Rating = 0
    var speed: Rating = 0
}

class ReviewOrderViewModel: ObservableObject {
    let order: Order
    
    @Published var rating = OrderRating()
    
    init(order: Order) {
        self.order = order
    }
}
