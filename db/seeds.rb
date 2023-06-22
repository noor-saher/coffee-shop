# frozen_string_literal: true

User.create(name: 'User1', email: 'user1@example.com', password: '123456')
User.create(name: 'User2', email: 'user2@example.com', password: '123456')

Product.create(name: 'Iced Latte', description: 'Sample product 1', price: 60.0, tax_rate: 0.05)
Product.create(name: 'Croissant', description: 'Sample product 2', price: 20.0, tax_rate: 0.1)
Product.create(name: 'Cappuccino', description: 'Sample product 3', price: 30.0, tax_rate: 0.02)
Product.create(name: 'Danish Pastry', description: 'Sample product 4', price: 40.0, tax_rate: 0.04)

Discount.create(name: 'Croissant&IcedLatte', description: '20% off on croissant if buying Iced Latte', discount_type: :percentage,
                value: 20, product_id: 2, applicable_product_ids: [1])
Discount.create(name: 'FreeDanishPastry', description: 'Get free Danish Pastry on buying Cappuccino', discount_type: :free, 
                value: 0, product_id: 4, applicable_product_ids: [3])
