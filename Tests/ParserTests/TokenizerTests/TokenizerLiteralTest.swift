//
//  TokenizerLiteralTest.swift
//  ParserTests
//
//  Created by Franklin Schrans on 12/23/17.
//

import XCTest
@testable import Parser

class TokenizerLiteralTest: XCTestCase, TokenizerTest {
  var sourceCode: String =
  """
  Test :: (any) {
    func foo() -> Bool {
      var a: Int = 2 + 4.564;
      var b: String = "hello" + " world";
      return false;
    }
  }
  """

  var expectedTokens: [Token] = [.identifier("Test"), .punctuation(.doubleColon), .punctuation(.openBracket), .identifier("any"), .punctuation(.closeBracket), .punctuation(.openBrace), .func, .identifier("foo"), .punctuation(.openBracket), .punctuation(.closeBracket), .punctuation(.arrow), .identifier("Bool"), .punctuation(.openBrace), .var, .identifier("a"), .punctuation(.colon), .identifier("Int"), .binaryOperator(.equal), .literal(.decimal(.integer(2))), .binaryOperator(.plus), .literal(.decimal(.real(4, 564))), .punctuation(.semicolon), .var, .identifier("b"), .punctuation(.colon), .identifier("String"), .binaryOperator(.equal), .literal(.string("hello")), .binaryOperator(.plus), .literal(.string(" world")), .punctuation(.semicolon), .return, .literal(.boolean(.false)), .punctuation(.semicolon), .punctuation(.closeBrace), .punctuation(.closeBrace)]

  func testLiteral() {
    test()
  }
}