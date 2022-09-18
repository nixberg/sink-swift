public protocol Sink<Element> {
    associatedtype Element
    
    mutating func append(_ element: Element) throws
    
    mutating func append(contentsOf sequence: some Sequence<Element>) throws
}

public typealias ByteSink = Sink<UInt8>

public typealias ByteSequence = Sequence<UInt8>

extension Array: Sink {}

extension ArraySlice: Sink {}

extension ContiguousArray: Sink {}

extension Slice: Sink where Base: RangeReplaceableCollection {}
