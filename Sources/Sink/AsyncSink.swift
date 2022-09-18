public protocol AsyncSink<Element>: Sink {
    associatedtype Element
    
    mutating func append(_ element: Element) async throws
    
    mutating func append(contentsOf sequence: some Sequence<Element>) async throws
}
