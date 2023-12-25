extension MutableCollection {
    public mutating func withSink<R>(
        _ body: (inout SinkAdapter<Self>) throws -> R
    ) rethrows -> R {
        try withUnsafeMutablePointer(to: &self) {
            var adapter = SinkAdapter(base: $0)
            return try body(&adapter)
        }
    }
}

public struct SinkAdapter<Base: MutableCollection> {
    public typealias Element = Base.Element
    
    private let base: UnsafeMutablePointer<Base>
    
    private var index: Base.Index
    
    fileprivate init(base: UnsafeMutablePointer<Base>) {
        self.base = base
        index = base.pointee.startIndex
    }
}

extension SinkAdapter: Sink {
    public mutating func append(_ element: Element) {
        base.pointee[index] = element
        index = base.pointee.index(after: index)
    }
    
    public mutating func append(contentsOf newElements: some Sequence<Element>) {
        for newElement in newElements {
            self.append(newElement)
        }
    }
    
    public mutating func reserveCapacity(_ minimumCapacity: Int) {}
}
