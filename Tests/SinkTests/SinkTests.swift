import Sink
import XCTest

final class SinkTests: XCTestCase {
    func testSink() throws {
        var sink = [0] as any Sink<_>
        
        try sink.append(1)
        XCTAssertEqual(sink as! Array, [0, 1])
        
        try sink.append(contentsOf: [2, 3])
        XCTAssertEqual(sink as! Array, [0, 1, 2, 3])
    }
    
    func testArray() throws {
        var array = [0, 1, 2, 3]
        
        array[1...].withSink {
            $0.append(-1)
            $0.append(-2)
        }
        XCTAssertEqual(array, [0, -1, -2, 3])
        
        array.withSink {
            $0.append(contentsOf: 1...4)
        }
        XCTAssertEqual(array, [1, 2, 3, 4])
    }
}
