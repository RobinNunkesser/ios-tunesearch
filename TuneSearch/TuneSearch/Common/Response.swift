//  Response.swift
//  AsynchronRecipe

import Foundation

enum Response<Value> {
    case success(Value)
    case failure(Error)
}
