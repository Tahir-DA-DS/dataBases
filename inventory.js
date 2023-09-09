//create inventory db
use <
  inventory >
  // create collections
  db.createCollection("users");
db.createCollection("admin");
db.createCollection("customers");
db.createCollection("products");
db.createCollection("orders");
db.createCollection("category");

// inserting data

db.users.insertMany([
  {
    _id: ObjectId(),
    username: "olaT",
    password: "123AB",
    gender: "M",
    birthdate: "2001-09-23"
  },

  {
    _id: ObjectId(),
    username: "HeyT",
    password: "127Ap",
    gender: "F",
    birthdate: "2004-11-20"
  }
]);

db.admin.insertMany([
  {
    id: 1,
    name: "olaT",
    users_id: "olaT_id"
  },

  {
    id: 2,
    name: "HeyT",
    users_id: "HeyT_id"
  }
]);

db.customers.insertMany([
  {
    id: ObjectId(),
    name: "base4",
    phone: "349-900-089",
    address: "Abuja",
    users_id: "id_users",
    created_at: "00:00:01-2022-06-29"
  },
  {
    id: ObjectId(),
    name: "balley",
    phone: "234-900-089",
    address: "Huja",
    users_id: "id_users",
    created_at: "00:00:01-2023-03-11"
  }
]),
  db.products.insertMany([
    {
      id: ObjectId(),
      name: "pie",
      quantity: 45,
      size: "4m",
      price: "$80",
      category_id: "category_id",
      customer_id: "customer_id"
    },
    {
      id: ObjectId(),
      name: "book",
      quantity: 15,
      size: "44cm",
      price: "$100",
      category_id: "category_id",
      customer_id: "customer_id"
    }
  ]);

db.category.insertMany([
  {
    id: ObjectId(),
    name: "food",
    quantity: 490
  },
  {
    id: ObjectId(),
    name: "stationary",
    quantity: 90
  }
]);

db.orders.insertMany([
  {
    id: 8,
    cusromer_id: "customer_id",
    quantity: 400,
    product_id: "product_id"
  },

  {
    id: 2,
    cusromer_id: "customer_id",
    quantity: 500,
    product_id: "product_id"
  }
]);

//getting records

db.users.findOne({ birthdate: "2001-09-23" });

db.orders.find({ id: { $gte: 8 } });

//updating records
db.orders.updateOne({ id: 2 }, { $set: { quantity: 900 } });
db.category.updateOne({ name: "food" }, { $set: { quantity: 109 } });

//deleting records
db.users.deleteOne({ username: "HeyT" });
db.orders.deleteOne({ id: 8 });
