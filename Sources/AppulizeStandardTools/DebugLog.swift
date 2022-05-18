/**
 Copyright 2022 Maciej Swic
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import Foundation

#if DEBUG
    public func dLog(_ object: Any, filename: String = #file, function: String = #function, line: Int = #line) {
        let log = "[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(object)"
        print(log)
    }

    public func dLog(_ objects: Any..., filename: String = #file, function: String = #function, line: Int = #line) {
        for object in objects {
            let log = "[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(object)"
            
            print(log)
        }
    }
#else
    public func dLog(_ object: Any, filename: String = #file, function: String = #function, line: Int = #line) {
        // Noop
    }

    public func dLog(_ objects: Any..., filename: String = #file, function: String = #function, line: Int = #line) {
        // Noop
    }
#endif

public func aLog(_ object: Any, filename: String = #file, function: String = #function, line: Int = #line) {
    let log = "[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(object)"
    print(log)
}
