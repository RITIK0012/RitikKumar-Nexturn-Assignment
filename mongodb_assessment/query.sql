
-- Part 1: Basic MongoDB Commands and Queries

-- Step 1: Create Collections and Insert Data

-- Create Customers Collection
db.createCollection("customers");

-- Insert Customer Documents
db.customers.insertMany([
  {
    "_id": ObjectId(),
    "name": "Ravi Kumar",
    "email": "ravikumar@example.com",
    "address": {
      "street": "12 MG Road",
      "city": "Bangalore",
      "zipcode": "560001"
    },
    "phone": "9876543210",
    "registration_date": ISODate("2023-01-01T12:00:00Z")
  },
  {
    "_id": ObjectId(),
    "name": "Aarti Sharma",
    "email": "aartisharma@example.com",
    "address": {
      "street": "45 Lajpat Nagar",
      "city": "New Delhi",
      "zipcode": "110024"
    },
    "phone": "8765432109",
    "registration_date": ISODate("2023-02-15T10:00:00Z")
  },
  {
    "_id": ObjectId(),
    "name": "Suresh Mehta",
    "email": "sureshmehta@example.com",
    "address": {
      "street": "78 JP Nagar",
      "city": "Mumbai",
      "zipcode": "400050"
    },
    "phone": "7654321098",
    "registration_date": ISODate("2023-03-10T09:00:00Z")
  },
  {
    "_id": ObjectId(),
    "name": "Neha Patel",
    "email": "nehapatel@example.com",
    "address": {
      "street": "67 Ellis Bridge",
      "city": "Ahmedabad",
      "zipcode": "380006"
    },
    "phone": "6543210987",
    "registration_date": ISODate("2023-04-20T08:00:00Z")
  },
  {
    "_id": ObjectId(),
    "name": "Amit Joshi",
    "email": "amitjoshi@example.com",
    "address": {
      "street": "34 Camp Road",
      "city": "Pune",
      "zipcode": "411001"
    },
    "phone": "5432109876",
    "registration_date": ISODate("2023-05-05T07:00:00Z")
  }
]);

--OUTPUT
 acknowledged: true,
  insertedIds: {
    '0': ObjectId("673458448aea638ef6081d2b"),
    '1': ObjectId("673458448aea638ef6081d2c"),
    '2': ObjectId("673458448aea638ef6081d2d"),
    '3': ObjectId("673458448aea638ef6081d2e"),
    '4': ObjectId("673458448aea638ef6081d2f")


--Insert 5 Orders into the orders Collection

var raviId = db.customers.findOne({ "name": "Ravi Kumar" })._id;
var aartiId = db.customers.findOne({ "name": "Aarti Sharma" })._id;
var sureshId = db.customers.findOne({ "name": "Suresh Mehta" })._id;
var nehaId = db.customers.findOne({ "name": "Neha Patel" })._id;
var amitId = db.customers.findOne({ "name": "Amit Joshi" })._id;




-- Create Orders Collection
db.createCollection("orders");

-- Insert Order Documents
// Insert 5 orders into the 'orders' collection
db.orders.insertMany([
  {
    "_id": ObjectId(),
    "order_id": "ORD100001",
    "customer_id": raviId,
    "order_date": ISODate("2023-06-01T10:00:00Z"),
    "status": "shipped",
    "items": [
      { "product_name": "Smartphone", "quantity": 1, "price": 20000 },
      { "product_name": "Earbuds", "quantity": 1, "price": 1500 }
    ],
    "total_value": 21500
  },
  {
    "_id": ObjectId(),
    "order_id": "ORD100002",
    "customer_id": aartiId,
    "order_date": ISODate("2023-06-05T12:30:00Z"),
    "status": "processing",
    "items": [
      { "product_name": "Laptop", "quantity": 1, "price": 55000 },
      { "product_name": "Mouse", "quantity": 1, "price": 1000 }
    ],
    "total_value": 56000
  },
  {
    "_id": ObjectId(),
    "order_id": "ORD100003",
    "customer_id": sureshId,
    "order_date": ISODate("2023-06-10T14:00:00Z"),
    "status": "delivered",
    "items": [
      { "product_name": "Tablet", "quantity": 1, "price": 30000 }
    ],
    "total_value": 30000
  },
  {
    "_id": ObjectId(),
    "order_id": "ORD100004",
    "customer_id": nehaId,
    "order_date": ISODate("2023-06-15T16:45:00Z"),
    "status": "shipped",
    "items": [
      { "product_name": "Camera", "quantity": 1, "price": 25000 },
      { "product_name": "Tripod", "quantity": 1, "price": 2000 }
    ],
    "total_value": 27000
  },
  {
    "_id": ObjectId(),
    "order_id": "ORD123456",
    "customer_id": amitId,
    "order_date": ISODate("2023-06-20T18:00:00Z"),
    "status": "processing",
    "items": [
      { "product_name": "Monitor", "quantity": 1, "price": 12000 },
      { "product_name": "Keyboard", "quantity": 1, "price": 2000 }
    ],
    "total_value": 14000
  }
]);


--OUTPUT
 acknowledged: true,
  insertedIds: {
    '0': ObjectId("673458d68aea638ef6081d30"),
    '1': ObjectId("673458d68aea638ef6081d31"),
    '2': ObjectId("673458d68aea638ef6081d32"),
    '3': ObjectId("673458d68aea638ef6081d33"),
    '4': ObjectId("673458d68aea638ef6081d34")

-- Find Orders for a Specific Customer

var customer = db.customers.findOne({ "name": "Ravi Kumar" });
if (customer) {
    var customerId = customer._id;
    db.orders.find({ "customer_id": customerId });
} else {
    print("Customer 'Ravi Kumar' not found");
}
--OUTPUT
{
    _id: ObjectId("673458d68aea638ef6081d30"),
    order_id: 'ORD100001',
    customer_id: ObjectId("673458448aea638ef6081d2b"),
    order_date: ISODate("2023-06-01T10:00:00.000Z"),
    status: 'shipped',
    items: [
      { product_name: 'Smartphone', quantity: 1, price: 20000 },
      { product_name: 'Earbuds', quantity: 1, price: 1500 }
    ],
    total_value: 21500
  }

-- 3. Find the Customer for a Specific Order:
var customerId = db.customers.findOne({ "name": "Ravi Kumar" })._id;
 db.customers.findOne({ "_id": order.customer_id });

--OUTPUT
  _id: ObjectId("673458448aea638ef6081d2f"),
  name: 'Amit Joshi',
  email: 'amitjoshi@example.com',
  address: { street: '34 Camp Road', city: 'Pune', zipcode: '411001' },
  phone: '5432109876',
  registration_date: ISODate("2023-05-05T07:00:00.000Z")

-- Update Order Status
db.orders.updateOne(
  { "order_id": "ORD123456" },
  { $set: { "status": "delivered" } }
);
--OUTPUT
 acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0


-- Delete an Order
db.orders.deleteOne({ order_id: "ORD123456" });

--OUTPUT
{ acknowledged: true, deletedCount: 1 }

-- Part 2: Aggregation Pipeline

-- Calculate Total Value of All Orders by Customer
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      localField: "customer_id",
      foreignField: "_id",
      as: "customer_info"
    }
  },
  {
    $unwind: "$customer_info"
  },
  {
    $group: {
      _id: "$customer_info.name",
      total_order_value: { $sum: "$total_value" }
    }
  },
  {
    $project: {
      _id: 0,
      customer_name: "$_id",
      total_order_value: 1
    }
  }
]);

--OUTPUT
 { total_order_value: 21500, customer_name: 'Ravi Kumar' },
  { total_order_value: 30000, customer_name: 'Suresh Mehta' },
  { total_order_value: 27000, customer_name: 'Neha Patel' },
  { total_order_value: 56000, customer_name: 'Aarti Sharma' }

-- Group Orders by Status
db.orders.aggregate([
  {
    $group: {
      _id: "$status",
      order_count: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
      status: "$_id",
      order_count: 1
    }
  }
]);
--OUTPUT
 { order_count: 1, status: 'processing' },
  { order_count: 2, status: 'shipped' },
  { order_count: 1, status: 'delivered' }

--List Customers with Their Recent Orders
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      localField: "customer_id",
      foreignField: "_id",
      as: "customer_info"
    }
  },
  {
    $unwind: "$customer_info"
  },
  {
    $sort: { "order_date": -1 }
  },
  {
    $group: {
      _id: "$customer_id",
      most_recent_order: { $first: "$$ROOT" }
    }
  },
  {
    $project: {
      _id: 0,
      customer_name: "$most_recent_order.customer_info.name",
      email: "$most_recent_order.customer_info.email",
      order_id: "$most_recent_order.order_id",
      total_value: "$most_recent_order.total_value",
      order_date: "$most_recent_order.order_date"
    }
  }
]);
--OUTPUT

  {
    customer_name: 'Aarti Sharma',
    email: 'aartisharma@example.com',
    order_id: 'ORD100002',
    total_value: 56000,
    order_date: ISODate("2023-06-05T12:30:00.000Z")
  },
  {
    customer_name: 'Suresh Mehta',
    email: 'sureshmehta@example.com',
    order_id: 'ORD100003',
    total_value: 30000,
    order_date: ISODate("2023-06-10T14:00:00.000Z")
  },
  {
    customer_name: 'Ravi Kumar',
    email: 'ravikumar@example.com',
    order_id: 'ORD100001',
    total_value: 21500,
    order_date: ISODate("2023-06-01T10:00:00.000Z")
  },
  {
    customer_name: 'Neha Patel',
    email: 'nehapatel@example.com',
    order_id: 'ORD100004',
    total_value: 27000,
    order_date: ISODate("2023-06-15T16:45:00.000Z")
  }


-- Find the Most Expensive Order by Customer
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      localField: "customer_id",
      foreignField: "_id",
      as: "customer_info"
    }
  },
  {
    $unwind: "$customer_info"
  },
  {
    $sort: { "total_value": -1 }
  },
  {
    $group: {
      _id: "$customer_id",
      highest_value_order: { $first: "$$ROOT" }
    }
  },
  {
    $project: {
      _id: 0,
      customer_name: "$highest_value_order.customer_info.name",
      order_id: "$highest_value_order.order_id",
      total_value: "$highest_value_order.total_value"
    }
  }
]);
--OUTPUT


  {
    customer_name: 'Suresh Mehta',
    order_id: 'ORD100003',
    total_value: 30000
  },
  {
    customer_name: 'Ravi Kumar',
    order_id: 'ORD100001',
    total_value: 21500
  },
  {
    customer_name: 'Aarti Sharma',
    order_id: 'ORD100002',
    total_value: 56000
  },
  {
    customer_name: 'Neha Patel',
    order_id: 'ORD100004',
    total_value: 27000
  }


-- Part 3: Real-World Scenario with Relationships

--Find All Customers Who Placed Orders in the Last Month
db.orders.aggregate([
    {
        $match: {
            order_date: { $gte: new Date(new Date().setDate(new Date().getDate() - 30)) }
        }
    },
    {
        $lookup: {
            from: "customers",
            localField: "customer_id",
            foreignField: "_id",
            as: "customer_info"
        }
    },
    { $unwind: "$customer_info" },
    {
        $group: {
            _id: "$customer_id",
            customer_name: { $first: "$customer_info.name" },
            email: { $first: "$customer_info.email" },
            most_recent_order_date: { $max: "$order_date" }
        }
    },
    {
        $project: {
            _id: 0,
            customer_name: 1,
            email: 1,
            most_recent_order_date: 1
        }
    }
]);



--Find All Products Ordered by a Specific Customer
const customer = db.customers.findOne({ "name": "Ravi Kumar" });
if (customer) {
    db.orders.aggregate([
        {
            $match: { "customer_id": customer._id }
        },
        { $unwind: "$items" },
        {
            $group: {
                _id: "$items.product_name",
                total_quantity: { $sum: "$items.quantity" }
            }
        },
        {
            $project: {
                _id: 0,
                product_name: "$_id",
                total_quantity: 1
            }
        }
    ]);
} else {
    print("Customer 'Ravi Kumar' not found");
}
--output
 { total_quantity: 1, product_name: 'Earbuds' },
  { total_quantity: 1, product_name: 'Smartphone' }


--Find the Top 3 Customers with the Most Expensive Total Orders
db.orders.aggregate([
    {
        $lookup: {
            from: "customers",
            localField: "customer_id",
            foreignField: "_id",
            as: "customer_info"
        }
    },
    { $unwind: "$customer_info" },
    {
        $group: {
            _id: "$customer_id",
            customer_name: { $first: "$customer_info.name" },
            email: { $first: "$customer_info.email" },
            total_spent: { $sum: "$total_value" }
        }
    },
    {
        $sort: { total_spent: -1 }
    },
    {
        $limit: 3
    },
    {
        $project: {
            _id: 0,
            customer_name: 1,
            email: 1,
            total_spent: 1
        }
    }
]);
--Output
{
    customer_name: 'Aarti Sharma',
    email: 'aartisharma@example.com',
    total_spent: 56000
  },
  {
    customer_name: 'Suresh Mehta',
    email: 'sureshmehta@example.com',
    total_spent: 30000
  },
  {
    customer_name: 'Neha Patel',
    email: 'nehapatel@example.com',
    total_spent: 27000
  }



--Add a New Order for an Existing Customer
const jane = db.customers.findOne({ "name": "Ravi Kumar" });
if (jane) {
    db.orders.insertOne({
        _id: ObjectId(),
        order_id: "ORD123789",
        customer_id: jane._id,
        order_date: new Date(),
        status: "processing",
        items: [
            { product_name: "Smartphone", quantity: 1, price: 30000 },
            { product_name: "Headphones", quantity: 2, price: 2000 }
        ],
        total_value: 34000
    });
    print("New order added for 'Ravi Kumar'");
} else {
    print("Customer 'Ravi Kumar' not found");
}
--output
New order added for 'Ravi Kumar'


--Part 4: Bonus Challenge

--Find Customers Who Have Not Placed Orders
db.customers.aggregate([
    {
        $lookup: {
            from: "orders",
            localField: "_id",
            foreignField: "customer_id",
            as: "orders"
        }
    },
    {
        $match: {
            "orders": { $size: 0 }  // Customers with no orders
        }
    },
    {
        $project: {
            _id: 0,
            customer_name: 1,
            email: 1
        }
    }
]).pretty();
--output
[ { email: 'amitjoshi@example.com' } ]

--Calculate the Average Number of Items Ordered per Order
db.orders.aggregate([
    {
        $project: {
            total_items: { $sum: { $map: { input: "$items", as: "item", in: "$$item.quantity" } } }
        }
    },
    {
        $group: {
            _id: null,
            average_items_per_order: { $avg: "$total_items" }
        }
    }
]).pretty();
--output
[ { _id: null, average_items_per_order: 2 } ]


--Join Customer and Order Data Using $lookup
db.orders.aggregate([
    {
        $lookup: {
            from: "customers",
            localField: "customer_id",
            foreignField: "_id",
            as: "customer_info"
        }
    },
    { $unwind: "$customer_info" },
    {
        $project: {
            _id: 0,
            customer_name: "$customer_info.name",
            email: "$customer_info.email",
            order_id: 1,
            total_value: 1,
            order_date: 1
        }
    }
]).pretty();
--output
{
    order_id: 'ORD100001',
    order_date: ISODate("2023-06-01T10:00:00.000Z"),
    total_value: 21500,
    customer_name: 'Ravi Kumar',
    email: 'ravikumar@example.com'
  },
  {
    order_id: 'ORD100002',
    order_date: ISODate("2023-06-05T12:30:00.000Z"),
    total_value: 56000,
    customer_name: 'Aarti Sharma',
    email: 'aartisharma@example.com'
  },
  {
    order_id: 'ORD100003',
    order_date: ISODate("2023-06-10T14:00:00.000Z"),
    total_value: 30000,
    customer_name: 'Suresh Mehta',
    email: 'sureshmehta@example.com'
  },
  {
    order_id: 'ORD100004',
    order_date: ISODate("2023-06-15T16:45:00.000Z"),
    total_value: 27000,
    customer_name: 'Neha Patel',
    email: 'nehapatel@example.com'
  },
  {
    order_id: 'ORD123789',
    order_date: ISODate("2024-11-13T08:10:15.279Z"),
    total_value: 34000,
    customer_name: 'Ravi Kumar',
    email: 'ravikumar@example.com'
  }