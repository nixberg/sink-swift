public protocol Sink<Element> {
    associatedtype Element
    
    mutating func append(_ newElement: Element)
    
    mutating func append(contentsOf newElements: some Sequence<Element>)
    
    mutating func reserveCapacity(_ minimumCapacity: Int)
}

extension Array: Sink {}

extension ArraySlice: Sink {}

extension ContiguousArray: Sink {}

extension Slice: Sink where Base: RangeReplaceableCollection {}
