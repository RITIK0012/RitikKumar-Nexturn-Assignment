const jsonData = `[
    {
      "id": 1,
      "name": "Laptop",
      "category": "Electronics",
      "price": 1200,
      "available": true
    },
    {
      "id": 2,
      "name": "Headphones",
      "category": "Electronics",
      "price": 150,
      "available": false
    },
    {
      "id": 3,
      "name": "Shirt",
      "category": "Clothing",
      "price": 25,
      "available": true
    },
    {
      "id": 4,
      "name": "Smartphone",
      "category": "Electronics",
      "price": 800,
      "available": true
    }
  ]`;
  
  // Task 1: Parse the JSON data
  function parseProducts(jsonData) {
    try {
      const products = JSON.parse(jsonData);  // Parse JSON data into JavaScript object
      console.log("Parsed Products: ", products);
      return products;
    } catch (error) {
      console.error("Error parsing JSON data:", error);
      return [];
    }
  }
  
  // Task 2: Add a new product
  function addProduct(products, newProduct) {
    products.push(newProduct);  // Add the new product to the products array
    console.log("Product Added:", newProduct);
    return products;
  }
  
  // Task 3: Update the price of a product
  function updatePrice(products, productId, newPrice) {
    const product = products.find(p => p.id === productId);  // Find the product by ID
    if (product) {
      product.price = newPrice;  // Update the price
      console.log(`Updated Price of Product ID ${productId}: ${newPrice}`);
    } else {
      console.log("Error: Product not found.");
    }
  }
  
  // Task 4: Filter products based on availability
  function filterAvailableProducts(products) {
    const availableProducts = products.filter(p => p.available === true);  // Filter available products
    console.log("Available Products: ", availableProducts);
    return availableProducts;
  }
  
  // Task 5: Filter products by category
  function filterProductsByCategory(products, category) {
    const categoryProducts = products.filter(p => p.category === category);  // Filter by category
    console.log(`Products in Category "${category}":`, categoryProducts);
    return categoryProducts;
  }
  
  // Parse the JSON data into an array of products
  const products = parseProducts(jsonData);
  
  // Add a new product
  const newProduct = {
    id: 5,
    name: "Tablet",
    category: "Electronics",
    price: 300,
    available: true
  };
  addProduct(products, newProduct);
  
  // Update the price of a product
  updatePrice(products, 1, 1100);  // Update Laptop price to 1100
  
  // Filter available products
  filterAvailableProducts(products);
  
  // Filter products by category
  filterProductsByCategory(products, "Electronics");
  