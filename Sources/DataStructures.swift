//
//  DataStructures.swift
//  Animate
//
//  Created by Reid Chatham on 10/18/16.
//  Copyright © 2016 Reid Chatham. All rights reserved.
//


/// :nodoc:
internal class Node<T> {
    var data: T
    var next: Node<T>?
    init(data: T) {
        self.data = data
    }
}

/// :nodoc:
internal struct Queue<T> {
    var first, last: Node<T>?
    mutating func dequeue() -> T? {
        let pop = first?.data
        if first === last {
            first = nil
            last = nil
        } else {
            first = first?.next
        }
        return pop
    }
    mutating func enqueue(data: T) {
        if last == nil {
            first = Node(data: data)
            last = first
        } else {
            last?.next = Node(data: data)
            last = last?.next
        }
    }
}

extension Queue {
    mutating func append(_ queue: Queue) {
        if last != nil {
            last?.next = queue.first
            last = queue.last
        } else {
            first = queue.first
            last = queue.last
        }
    }
}

extension Queue {
    mutating func release() {
        // nodes will be automatically released because of swift's automatic reference counting.
        first = nil
        last = nil
    }
}
