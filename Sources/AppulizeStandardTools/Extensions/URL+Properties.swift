/**
 Copyright 2022 Maciej Swic
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import Foundation

/**
 This extension simplifies access to file attributes.
 */

public extension URL {
    /// Provides simplified one-line access to file attributes.
    var attributes: [FileAttributeKey: Any]? {
        do {
            return try FileManager.default.attributesOfItem(atPath: path)
        } catch let error as NSError {
            print("FileAttribute error: \(error)")
        }
        
        return nil
    }
    
    /// Returns the file size as an `UInt64`, or nil if the file doesn't exist or an error occurrs.
    var fileSize: UInt64? {
        return attributes?[.size] as? UInt64
    }
    
    /// Returns a formatted string representing the file size, or nil if the file doesn't exist or an error occurrs.
    var fileSizeString: String? {
        guard let fileSize = fileSize else { return nil }
        
        return ByteCountFormatter.string(fromByteCount: Int64(fileSize), countStyle: .file)
    }
    
    /// Returns the creation date of the file, or nil if the file doesn't exist or an error occurrs.
    var creationDate: Date? {
        return attributes?[.creationDate] as? Date
    }
    
    /// Returns the modification date of the file, or nil if the file doesn't exist or an error occurrs.
    var modificationDate: Date? {
        return attributes?[.modificationDate] as? Date
    }
}
