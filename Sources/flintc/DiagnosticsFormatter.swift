//
//  DiagnosticsFormatter.swift
//  Diagnostic
//
//  Created by Franklin Schrans on 1/4/18.
//

import Foundation
import Rainbow
import AST
import Diagnostic

public struct DiagnosticsFormatter {
  var diagnostics: [Diagnostic]
  var compilationContext: CompilationContext

  public func rendered() -> String {
    return diagnostics.map { diagnostic in
      let infoLine = "\(diagnostic.severity == .error ? "Error".lightRed.bold : "Warning") in \(compilationContext.fileName.bold):"
      return """
      \(infoLine)
        \(diagnostic.message.indented(by: 2).bold)\(render(diagnostic.sourceLocation).bold):
        \(renderSourcePreview(at: diagnostic.sourceLocation).indented(by: 2))
      """
    }.joined(separator: "\n")
  }

  func render(_ sourceLocation: SourceLocation?) -> String {
    guard let sourceLocation = sourceLocation else { return "" }
    return " at line \(sourceLocation.line), column \(sourceLocation.column)"
  }

  func renderSourcePreview(at sourceLocation: SourceLocation?) -> String {
    let sourceLines = compilationContext.sourceCode.components(separatedBy: "\n")
    guard let sourceLocation = sourceLocation else { return "" }
    return """
    \(renderSourceLine(sourceLines[sourceLocation.line - 1], rangeOfInterest: (sourceLocation.column..<sourceLocation.column + sourceLocation.length)))
    \(String(repeating: " ", count: sourceLocation.column - 1) + String(repeating: "^", count: sourceLocation.length).lightRed.bold)
    """
  }

  func renderSourceLine(_ sourceLine: String, rangeOfInterest: Range<Int>) -> String {
    let lowerBoundIndex = sourceLine.index(sourceLine.startIndex, offsetBy: rangeOfInterest.lowerBound - 1)
    let upperBoundIndex = sourceLine.index(sourceLine.startIndex, offsetBy: rangeOfInterest.upperBound - 1)

    return String(sourceLine[sourceLine.startIndex..<lowerBoundIndex]) + String(sourceLine[lowerBoundIndex..<upperBoundIndex]).red.bold + String(sourceLine[upperBoundIndex..<sourceLine.endIndex])
  }
}

fileprivate extension String {
  func indented(by level: Int) -> String {
    let lines = components(separatedBy: "\n")
    return lines.joined(separator: "\n" + String(repeating: " ", count: level))
  }
}