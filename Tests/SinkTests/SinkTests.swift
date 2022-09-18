import Sink
import XCTest

final class SinkTests: XCTestCase {
    func testExample() throws {
        var array = [0]
        
        array.write(1)
        XCTAssertEqual(array, [0, 1])
        
        array.write(contentsOf: [2, 3])
        XCTAssertEqual(array, [0, 1, 2, 3])
        
        array[1...].withSink {
            $0.write(-1)
            $0.write(-2)
        }
        XCTAssertEqual(array, [0, -1, -2, 3])
        
        array.withSink {
            $0.write(contentsOf: 1...4)
        }
        XCTAssertEqual(array, [1, 2, 3, 4])
    }
}
