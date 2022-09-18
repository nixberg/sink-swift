extension RangeReplaceableCollection {
    public mutating func write(_ byte: Element) {
        self.append(byte)
    }
    
    public mutating func write(contentsOf sequence: some Sequence<Element>) {
        self.append(contentsOf: sequence)
    }
}

extension Array: Sink {}

extension ArraySlice: Sink {}

extension ContiguousArray: Sink {}

extension Slice: Sink where Base: RangeReplaceableCollection {}
