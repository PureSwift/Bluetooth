//
//  CSV.swift
//  swift-csv
//
//  Created by Matthias Hochgatterer on 02/06/2017.
//  Copyright © 2017 Matthias Hochgatterer. All rights reserved.
//
// https://github.com/brutella/swift-csv

import Foundation

public protocol CSVParserDelegate: AnyObject {
    
    /// Called when the parser begins parsing.
    func parserDidBeginDocument(_ parser: CSV.Parser)
    
    /// Called when the parser finished parsing without errors.
    func parserDidEndDocument(_ parser: CSV.Parser)
    
    /// Called when the parser begins parsing a line.
    func parser(_ parser: CSV.Parser, didBeginLineAt index: UInt)
    
    /// Called when the parser finished parsing a line.
    func parser(_ parser: CSV.Parser, didEndLineAt index: UInt)
    
    /// Called for every field in a line.
    func parser(_ parser: CSV.Parser, didReadFieldAt index: UInt, value: String)
}

extension String.Encoding {
    /// Unicode text data may start with a [byte order mark](https://en.wikipedia.org/wiki/Byte_order_mark) to specify the encoding and endianess.
    struct BOM {
        let encoding: String.Encoding
        init?(bom0: UInt8, bom1: UInt8, bom2: UInt8, bom3: UInt8) {
            switch (bom0, bom1, bom2, bom3) {
            case (0xEF, 0xBB, 0xBF, _):
                self.encoding = .utf8
            case (0xFE, 0xFF, _, _):
                self.encoding = .utf16BigEndian
            case (0xFF, 0xFE, _, _):
                self.encoding = .utf16LittleEndian
            case (0x00, 0x00, 0xFE, 0xFF):
                self.encoding = .utf32BigEndian
            case (0xFF, 0xFE, 0x00, 0x00):
                self.encoding = .utf32LittleEndian
            default:
                return nil
            }
        }
        
        var length: Int {
            switch self.encoding {
            case String.Encoding.utf8:
                return 3
            case String.Encoding.utf16BigEndian, String.Encoding.utf16LittleEndian:
                return 2
            case String.Encoding.utf32BigEndian, String.Encoding.utf32LittleEndian:
                return 4
            default:
                return 0
            }
        }
    }
}

public struct CSVError: Error {
    public let description: String
}

public struct CSV {
    
    static let CarriageReturn: UnicodeScalar = "\r"
    static let LineFeed: UnicodeScalar = "\n"
    static let DoubleQuote: UnicodeScalar = "\""
    static let Nul: UnicodeScalar = UnicodeScalar(0)
    
    /// Writes data in CSV format into an output stream.
    /// The writer uses the line feed "\n" character for line breaks. (Even though [RFC 4180](https://tools.ietf.org/html/rfc4180) specifies CRLF as line break characters.)
    public class Writer {
        
        let outputStream: OutputStream
        let configuration: CSV.Configuration
        
        internal let illegalCharacterSet: CharacterSet
        internal var maxNumberOfWrittenFields: Int?
        internal var numberOfWrittenLines: Int = 0
        
        public init(outputStream: OutputStream, configuration: CSV.Configuration) {
            
            if outputStream.streamStatus == .notOpen {
                outputStream.open()
            }
            
            self.outputStream = outputStream
            self.configuration = configuration
            self.illegalCharacterSet = CharacterSet(charactersIn: "\(DoubleQuote)\(configuration.delimiter)\(CarriageReturn)\(LineFeed)")
        }
        
        /// Writes fields as a line to the output stream.
        public func writeLine(of fields: [String]) throws {
            if let count = self.maxNumberOfWrittenFields {
                if count != fields.count {
                    throw CSVError(description: "Invalid number of fields")
                }
            } else {
                maxNumberOfWrittenFields = fields.count
            }
            
            if numberOfWrittenLines > 0 {
                self.writeNewLineCharacter()
            }
            
            let escapedValues = fields.map({ self.escapedValue(for: $0) })
            let string = escapedValues.joined(separator: String(configuration.delimiter))
            self.writeString(string)
            
            numberOfWrittenLines += 1
        }
        
        internal func writeNewLineCharacter() {
            self.writeString(String(LineFeed))
        }
        
        internal func escapedValue(for field: String) -> String {
            if let _ = field.rangeOfCharacter(from: illegalCharacterSet) {
                // A double quote must be preceded by another double quote
                let value = field.replacingOccurrences(of: String(DoubleQuote), with: "\"\"")
                // Quote fields containing illegal characters
                return "\"\(value)\""
            }
            
            return field
        }
        
        internal func writeString(_ string: String) {
            if let data = string.data(using: configuration.encoding) {
                data.withUnsafeBytes({
                    (pointer: UnsafeRawBufferPointer) -> Void in
                    if let bytes = pointer.bindMemory(to: UInt8.self).baseAddress {
                        let _ = self.outputStream.write(bytes, maxLength: pointer.count)
                    }
                })
            }
        }
    }
    
    public class Parser {
        
        public weak var delegate: CSVParserDelegate?
        public let configuration: CSV.Configuration
        public var trimsWhitespaces: Bool = false
        
        // Reference to the file stream
        private let inputStream: InputStream
        
        // The buffer for field values
        private var fieldBuffer = [UInt8]()
        
        // The current row index
        private var row: UInt = 0
        
        // The current column index
        private var column: UInt = 0
        
        // Flag to know if the parser was cancelled.
        private var cancelled: Bool = false
        
        private enum State {
            case beginningOfDocument
            case endOfDocument
            case beginningOfLine
            case endOfLine
            case inField
            case inQuotedField
            case maybeEndOfQuotedField
            case endOfField
        }
        
        // The current parser state
        private var state: State = .beginningOfDocument {
            didSet {
                if oldValue == .beginningOfDocument {
                    delegate?.parserDidBeginDocument(self)
                }
                
                switch (state) {
                case .endOfDocument:
                    delegate?.parserDidEndDocument(self)
                case .beginningOfLine:
                    delegate?.parser(self, didBeginLineAt: row)
                case .endOfLine:
                    delegate?.parser(self, didEndLineAt: row)
                    column = 0
                    row += 1
                case .endOfField:
                    let data = Data(fieldBuffer)
                    let value: String
                    if let string = String(data: data, encoding: configuration.encoding) { // Try to decode using the specified encoding
                        value = string
                    } else {
                        value = String(cString: fieldBuffer + [0]) // cString requires '\0' at the end
                    }
                    fieldBuffer.removeAll()
                    
                    if !value.isEmpty && self.trimsWhitespaces {
                        let trimmed = value.trimmingCharacters(in: CharacterSet.whitespaces)
                        delegate?.parser(self, didReadFieldAt: column, value: trimmed)
                    } else {
                        delegate?.parser(self, didReadFieldAt: column, value: value)
                    }
                    
                    column += 1
                default:
                    break
                }
            }
        }
        
        /// Initializes the parser with an url.
        ///
        /// - Paramter url: An url referencing a CSV file.
        public convenience init?(url: URL, configuration: CSV.Configuration) {
            guard let inputStream = InputStream(url: url) else {
                return nil
            }
            
            self.init(inputStream: inputStream, configuration: configuration)
        }
        
        /// Initializes the parser with a string.
        ///
        /// - Paramter string: A CSV string.
        public convenience init(string: String, configuration: CSV.Configuration) {
            self.init(data: string.data(using: .utf8)!, configuration: configuration)
        }
        
        /// Initializes the parser with data.
        ///
        /// - Paramter data: Data represeting CSV content.
        public convenience init(data: Data, configuration: CSV.Configuration) {
            self.init(inputStream: InputStream(data: data), configuration: configuration)
        }
        
        /// Initializes the parser with an input stream.
        ///
        /// - Paramter inputStream: An input stream of CSV data.
        public init(inputStream: InputStream, configuration: CSV.Configuration = CSV.Configuration(delimiter: ",")) {
            self.inputStream = inputStream
            self.configuration = configuration
        }
        
        /// Cancels the parser.
        public func cancel() {
            self.cancelled = true
        }
        
        
        /// Starts parsing the CSV data. Calling this method does nothing if the parser already finished parsing the data.
        ///
        /// - Throws: An error if the data doesn't conform to [RFC 4180](https://tools.ietf.org/html/rfc4180).
        public func parse() throws {
            
            guard self.state != .endOfDocument && !cancelled else {
                return
            }
            
            let reader = BufferedByteReader(inputStream: inputStream)
            
            // Consume bom if available
            if let bom0 = reader.peek(at: 0), let bom1 = reader.peek(at: 1), let bom2 = reader.peek(at: 2), let bom3 = reader.peek(at: 3) {
                if let bom = String.Encoding.BOM(bom0: bom0, bom1: bom1, bom2: bom2, bom3: bom3) {
                    for _ in 0..<bom.length {
                        let _ = reader.pop()
                    }
                }
            }
            
            while !reader.isAtEnd {
                while let char = reader.pop(), !cancelled {
                    let scalar = UnicodeScalar(char)
                    
                    // If we are at the begin of the data and there is a new character, we transition to the beginning of the line
                    if state == .beginningOfDocument {
                        state = .beginningOfLine
                    }
                    
                    // If we are at the end of the line and there is a new character, we transition to the beginning of the line
                    if state == .endOfLine {
                        state = .beginningOfLine
                    }
                    
                    switch scalar {
                    case self.configuration.delimiter:
                        switch state {
                        case .beginningOfLine:
                            state = .endOfField
                        case .inField:
                            state = .endOfField
                        case .inQuotedField:
                            fieldBuffer.append(char)
                        case .maybeEndOfQuotedField:
                            state = .endOfField
                        case .endOfField:
                            state = .endOfField
                        default:
                            assertionFailure("Invalid state")
                        }
                    case CSV.CarriageReturn:
                        switch state {
                        case .beginningOfLine:
                            fallthrough
                        case .inField:
                            fallthrough
                        case .maybeEndOfQuotedField:
                            fallthrough
                        case .endOfField:
                            
                            // If there is a \n after the carriage return, we read it.
                            // But that's optional
                            if let next = reader.peek(), UnicodeScalar(next) == "\n" {
                                let _ = reader.pop()
                            }
                            
                            state = .endOfField
                            state = .endOfLine
                        case .inQuotedField:
                            fieldBuffer.append(char)
                        default:
                            assertionFailure("Invalid state")
                        }
                    case CSV.LineFeed:
                        switch state {
                        case .beginningOfLine:
                            fallthrough
                        case .inField:
                            fallthrough
                        case .maybeEndOfQuotedField:
                            fallthrough
                        case .endOfField:
                            state = .endOfField
                            state = .endOfLine
                        case .inQuotedField:
                            fieldBuffer.append(char)
                        default:
                            assertionFailure("Invalid state")
                        }
                    case CSV.DoubleQuote:
                        switch state {
                        case .beginningOfLine:
                            state = .inQuotedField
                        case .endOfField:
                            state = .inQuotedField
                        case .maybeEndOfQuotedField:
                            fieldBuffer.append(char)
                            state = .inQuotedField
                        case .inField:
                            Swift.print("Double quote unexpected in unquoted field")
                            // Ignore error
                            fieldBuffer.append(char)
                            break
                        case .inQuotedField:
                            state = .maybeEndOfQuotedField
                        default:
                            assertionFailure("Invalid state")
                        }
                    case CSV.Nul:
                        // Nul characters happen when characters are made up of more than 1 byte
                        switch state {
                        case .inField:
                            fallthrough
                        case .inQuotedField:
                            if fieldBuffer.count > 0 {
                                // Append to any existing character
                                fieldBuffer.append(char)
                            }
                        default:
                            break
                        }
                    default: // Any other characters
                        switch state {
                        case .beginningOfLine:
                            fieldBuffer.append(char)
                            state = .inField
                        case .endOfField:
                            fieldBuffer.append(char)
                            state = .inField
                        case .maybeEndOfQuotedField:
                            // Skip values outside of quoted fields
                            break
                        case .inField:
                            fieldBuffer.append(char)
                        case .inQuotedField:
                            fieldBuffer.append(char)
                        default:
                            assertionFailure("Invalid state")
                        }
                    }
                }
                
                if cancelled {
                    return
                }
                
                // Transition to the correct state at the end of the document
                switch state {
                case .beginningOfDocument:
                    // There was no data at all
                    break
                case .endOfDocument:
                    assertionFailure("Invalid state")
                case .beginningOfLine:
                    break
                case .endOfLine:
                    break
                case .endOfField:
                    // Rows must not end with the delimieter
                    // Therefore we there must be a new field before the end
                    state = .inField
                    state = .endOfField
                    state = .endOfLine
                case .inField:
                    state = .endOfField
                    state = .endOfLine
                case .inQuotedField:
                    throw CSVError(description: "Unexpected end of quoted field")
                case .maybeEndOfQuotedField:
                    state = .endOfField
                    state = .endOfLine
                }
                
                // Now we are at the end
                state = .endOfDocument
            }
        }
    }
    
    /// A configuration specifies the delimiter and encoding for parsing CSV data.
    public struct Configuration {
        
        public let delimiter: UnicodeScalar
        public let encoding: String.Encoding
        
        /// Initializes a configuration with a delimiter and text encoding.
        public init(delimiter: UnicodeScalar, encoding: String.Encoding = .utf8) {
            self.delimiter = delimiter
            self.encoding = encoding
        }
    }
}

internal class BufferedByteReader {
    let inputStream: InputStream
    var isAtEnd = false
    var buffer = [UInt8]()
    var bufferIndex = 0
    
    init(inputStream: InputStream) {
        if inputStream.streamStatus == .notOpen {
            inputStream.open()
        }
        
        self.inputStream = inputStream
    }
    
    /// - returns: The next character and removes it from the stream after it has been returned, or nil if the stream is at the end.
	func pop() -> UInt8? {
		guard let byte = self.peek() else {
			isAtEnd = true
			return nil
		}
		bufferIndex += 1
		return byte
	}
	
	/// - Returns: The character at `index`, or nil if the stream is at the end.
	func peek(at index: Int = 0) -> UInt8? {
		let peekIndex = bufferIndex + index
		guard peekIndex < buffer.count else {
			guard read(100) > 0 else {
				// end of file or error
				return nil
			}
			return self.peek(at:index)
		}
		return buffer[peekIndex]
	}
	
    // MARK: - Private
	
	private func read(_ amount: Int) -> Int {
		if bufferIndex > 0 {
			buffer.removeFirst(bufferIndex)
			bufferIndex = 0
		}
		var temp = [UInt8](repeating: 0, count: amount)
        let length = inputStream.read(&temp, maxLength: temp.count)
		if length > 0 {
			buffer.append(contentsOf: temp[0..<length])
		}
        return length
    }
}
