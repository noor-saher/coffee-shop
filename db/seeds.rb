# frozen_string_literal: true

User.create(name: 'User1', email: 'user1@example.com', password: '123456')
User.create(name: 'User2', email: 'user2@example.com', password: '123456')

Product.create(name: 'Bread', description: 'Sample product 1', price: 60.0, tax_rate: 0.05)
Product.create(name: 'Eggs', description: 'Sample product 2', price: 20.0, tax_rate: 0.1)
Product.create(name: 'Milk', description: 'Sample product 3', price: 30.0, tax_rate: 0.02)
Product.create(name: 'Butter', description: 'Sample product 4', price: 40.0, tax_rate: 0.04)

Discount.create(name: 'BreadEggs', description: '20% off on eggs if buying bread', discount_type: 'percentage',
                value: 20)
Discount.create(name: 'FreeButter', description: 'Get free butter on buying milk', discount_type: 'free', value: 0)

DiscountProduct.create(discount_id: 1, product_id: 2, applicable_product_ids: [1])
DiscountProduct.create(discount_id: 2, product_id: 4, applicable_product_ids: [3])
