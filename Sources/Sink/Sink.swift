public protocol Sink<Element> {
    associatedtype Element
    
    mutating func write(_ element: Element) throws
    
    mutating func write(contentsOf sequence: some Sequence<Element>) throws
}
