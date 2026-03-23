// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "ELEC1001",
    name: "Samsung 55-inch 4K Smart TV",
    category: "Electronics",
    price: 55000,
    brand: "Samsung",
    specifications: {
      screen_size: "55 inch",
      resolution: "4K UHD",
      voltage: "220-240V",
      smart_tv: true
    },
    warranty: {
      period: "2 years",
      type: "Manufacturer"
    },
    available_colors: ["Black"],
    ratings: {
      average: 4.5,
      reviews_count: 1200
    }
  },
  {
    _id: "CLOT2001",
    name: "Men's Casual Denim Jacket",
    category: "Clothing",
    price: 2499,
    brand: "Levi's",
    size_options: ["S", "M", "L", "XL"],
    material: "Denim",
    color: "Blue",
    care_instructions: [
      "Machine wash cold",
      "Do not bleach",
      "Iron at low temperature"
    ],
    stock: {
      warehouse: 150,
      store: 40
    }
  },
  {
    _id: "GROC3001",
    name: "Organic Almonds 500g",
    category: "Groceries",
    price: 650,
    brand: "Nature's Basket",
    expiry_date: new Date("2024-12-15"),
    manufacture_date: new Date("2024-06-15"),
    nutritional_info: {
      calories: 579,
      protein: "21g",
      fat: "50g"
    },
    ingredients: ["Almonds"],
    storage_instructions: "Store in a cool, dry place",
    is_organic: true
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "ELEC1001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

/*
Explanation:
Creating an index on the "category" field improves query performance,
especially for frequent queries like filtering products by category
(e.g., Electronics, Clothing, Groceries). It reduces scan time by
allowing MongoDB to quickly locate matching documents instead of
performing a full collection scan.
*/