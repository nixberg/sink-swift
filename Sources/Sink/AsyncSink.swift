public protocol AsyncSink<Element>: Sink {
    associatedtype Element
    
    mutating func write(_ element: Element) async throws
    
    mutating func write(contentsOf sequence: some Sequence<Element>) async throws
}
