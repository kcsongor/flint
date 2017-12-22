extension TopLevelModule: Equatable {
   public static func ==(lhs: TopLevelModule, rhs: TopLevelModule) -> Bool {
      return
         lhs.contractDeclaration == rhs.contractDeclaration &&
         lhs.contractBehaviorDeclarations == rhs.contractBehaviorDeclarations
   }
}

extension ContractDeclaration: Equatable {
   static func ==(lhs: ContractDeclaration, rhs: ContractDeclaration) -> Bool {
      return
         lhs.identifier == rhs.identifier &&
         lhs.variableDeclarations == rhs.variableDeclarations
   }
}

extension ContractBehaviorDeclaration: Equatable {
   static func ==(lhs: ContractBehaviorDeclaration, rhs: ContractBehaviorDeclaration) -> Bool {
      return
         lhs.contractIdentifier == rhs.contractIdentifier &&
         lhs.callerCapabilities == rhs.callerCapabilities &&
         lhs.functionDeclarations == rhs.functionDeclarations
   }
}

extension VariableDeclaration: Equatable {
   static func ==(lhs: VariableDeclaration, rhs: VariableDeclaration) -> Bool {
      return
         lhs.identifier == rhs.identifier &&
         lhs.type == rhs.type
   }
}

extension FunctionDeclaration: Equatable {
   static func ==(lhs: FunctionDeclaration, rhs: FunctionDeclaration) -> Bool {
      return
         lhs.modifiers == rhs.modifiers &&
         lhs.identifier == rhs.identifier &&
         lhs.parameters == rhs.parameters &&
         lhs.resultType == rhs.resultType &&
         lhs.body == rhs.body
   }
}

extension Parameter: Equatable {
   static func ==(lhs: Parameter, rhs: Parameter) -> Bool {
      return
         lhs.identifier == rhs.identifier &&
         lhs.type == rhs.type
   }
}

extension TypeAnnotation: Equatable {
   static func ==(lhs: TypeAnnotation, rhs: TypeAnnotation) -> Bool {
      return lhs.type == rhs.type
   }
}

extension Identifier: Equatable {
   static func ==(lhs: Identifier, rhs: Identifier) -> Bool {
      return lhs.name == rhs.name
   }
}

extension Type: Equatable {
   static func ==(lhs: Type, rhs: Type) -> Bool {
      return lhs.name == rhs.name
   }
}

extension CallerCapability: Equatable {
   static func ==(lhs: CallerCapability, rhs: CallerCapability) -> Bool {
      return lhs.name == rhs.name
   }
}

extension BinaryExpression: Equatable {
   static func ==(lhs: BinaryExpression, rhs: BinaryExpression) -> Bool {
      return
         lhs.lhs == rhs.lhs &&
         lhs.rhs == rhs.rhs &&
         lhs.op == rhs.op
   }
}

extension Expression: Equatable {
   static func ==(lhs: Expression, rhs: Expression) -> Bool {
      switch (lhs, rhs) {
      case (.identifier(let lhsIdentifier), .identifier(let rhsIdentifier)):
         return lhsIdentifier == rhsIdentifier
      case (.binaryExpression(let lhsBinaryExpression), .binaryExpression(let rhsBinaryExpression)):
         return lhsBinaryExpression == rhsBinaryExpression
      default:
         return false
      }
   }
}

extension Statement: Equatable {
   static func ==(lhs: Statement, rhs: Statement) -> Bool {
      switch (lhs, rhs) {
      case (.expression(let lhsExpression), .expression(let rhsExpression)):
         return lhsExpression == rhsExpression
      case (.returnStatement(let lhsReturnStatement), .returnStatement(let rhsReturnStatement)):
         return lhsReturnStatement == rhsReturnStatement
      default:
         return false
      }
   }
}

extension ReturnStatement: Equatable {
   static func ==(lhs: ReturnStatement, rhs: ReturnStatement) -> Bool {
      return lhs.expression == rhs.expression
   }
}
