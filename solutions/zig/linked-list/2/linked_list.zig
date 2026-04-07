pub fn LinkedList(comptime T: type) type {
    return struct {
        // Please implement the doubly linked `Node` (replacing each `void`).
        pub const Node = struct {
            prev: ?*Node = null,
            next: ?*Node = null,
            data: T,
        };

        // Please implement the fields of the linked list (replacing each `void`).
        first: ?*Node = null,
        last: ?*Node = null,
        len: T = 0,

        // Please implement the below methods.
        // You need to add the parameters to each method.
        const Self = @This();

        pub fn push(self: *Self, node: *Node) void {
            if (self.len == 0) {
                self.first = node;
                self.last = node;
            } else {
                self.last.?.next = node;
                node.prev = self.last;
                self.last = node;
            }
            self.len += 1;
        }

        pub fn pop(self: *Self) ?*Node {
            const temp = self.last.?;
            self.last = temp.prev;
            unlink(temp);
            self.len -|= 1;

            return temp;
        }

        pub fn shift(self: *Self) ?*Node {
            const temp = self.first.?;
            self.first = temp.next;
            unlink(temp);
            self.len -|= 1;

            return temp;
        }

        pub fn unshift(self: *Self, node: *Node) void {
            node.next = self.first;
            if (self.len > 0) self.first.?.prev = node;
            self.first = node;

            self.len += 1;
        }

        pub fn delete(self: *Self, node: *Node) void {
            var current = self.first;
            if (self.last.? == node) self.last = node.prev;
            while (current != null) : (current = current.?.next) if (current.? == node) {
                unlink(current.?);
                self.len -|= 1;
            };
        }

        inline fn unlink(node: *Node) void {
            var left = node.prev;
            var right = node.next;
            if (left != null) left.?.next = right;
            if (right != null) right.?.prev = left;
            node.prev = null;
            node.next = null;
        }
    };
}
