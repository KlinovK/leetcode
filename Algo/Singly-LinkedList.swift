//
//  Singly-LinkedList.swift
//  Algoritmization
//
//  Created by Константин Клинов on 03/02/26.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class ListNodeSolutions {
    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {

        func gcd(_ a: Int?, _ b: Int?) -> Int? {
            guard let a = a, let b = b else { return nil }

            var currentA = abs(a)
            var currentB = abs(b)

            while currentB != 0 {
                let temp = currentB
                currentB = currentA % currentB
                currentA = temp
            }

            return currentA
        }

        guard head != nil else { return nil }

        var current: ListNode? = head

        while let next = current?.next {
            let gcdNode = ListNode(gcd(current?.val, next.val) ?? 0)
            gcdNode.next = next
            current?.next = gcdNode
            current = next
        }

        return head
    }

}
