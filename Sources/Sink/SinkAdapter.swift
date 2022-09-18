public struct SinkAdapter<Base: MutableCollection>: Sink {
    public typealias Element = Base.Element
    
    private let basePointer: UnsafeMutablePointer<Base>
    
    private var index: Base.Index
    
    init(basePointer: UnsafeMutablePointer<Base>) {
        self.basePointer = basePointer
        index = basePointer.pointee.startIndex
    }
    
    public mutating func write(_ element: Element) {
        basePointer.pointee[index] = element
        index = basePointer.pointee.index(after: index)
    }
    
    public mutating func write(contentsOf sequence: some Sequence<Element>) {
        for element in sequence {
            self.write(element)
        }
    }
}

extension MutableCollection {
    public mutating func withSink<R>(
        _ body: (inout SinkAdapter<Self>) throws -> R
    ) rethrows -> R {
        try withUnsafeMutablePointer(to: &self) {
            var adapter = SinkAdapter(basePointer: $0)
            return try body(&adapter)
        }
    }
}
