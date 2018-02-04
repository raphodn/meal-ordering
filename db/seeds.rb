# ---------------------------------------------------------------------
# => CLEAR DB
# ---------------------------------------------------------------------

Meal.destroy_all
DeliveryOrder.destroy_all


# ---------------------------------------------------------------------
# => CREATE 10 MEALS
# ---------------------------------------------------------------------

meal_list = [
  ['Lotus Leaf Parcel', 'filled with glutinous rice, dried shrimp, chicken and shiitake mushroom'],
  ['Nourishing Ginseng Chicken', 'with dried goji berry, red date and mixed rice'],
  ['Tofu‑Powered Tabbouleh', 'with aubergine, roasted pumpkin and bulgur'],
  ['Dragon Well Basil Rice', 'with herbal tea egg'],
  ['Roasted Thai Chicken with Sautéed Greens', 'on a bed of sweet potatoes'],
  ['Grilled Farm Fresh Chicken', 'with pesto on organic mixed grains'],
  ['Pan‑seared Norwegian Salmon', 'with citrus vinaigrette on pasta'],
  ['Grilled Piri‑Piri Chicken', 'with cherry tomato and roasted olive'],
  ['Roasted Wild Mushrooms', 'with organic balsamic vinegar and sun-dried tomatoes'],
  ['Raspberry Frangipane', 'with almond flakes']
]

meal_list.each do |name, byline|
  Meal.create(name: name, byline: byline)
end

first_meal_id = Meal.first.id


# ---------------------------------------------------------------------
# => CREATE 5 DELIVERY ORDERS (containing any number of order items ranging from 1 to 5)
# ---------------------------------------------------------------------

orders = [
  # 1st delivery order
  [
    [first_meal_id, 2, 1000] # meal_id, quantity, unit_price
  ],
  # 2nd delivery order
  [
    [first_meal_id+2, 1, 1200],
    [first_meal_id+4, 1, 1300]
  ],
  # 3rd delivery order
  [
    [first_meal_id+1, 3, 1000],
    [first_meal_id+2, 3, 1200],
    [first_meal_id+3, 3, 1000]
  ],
  # 4th delivery order
  [
    [first_meal_id+5, 1, 1500],
    [first_meal_id+6, 1, 1500],
    [first_meal_id+7, 1, 1500],
    [first_meal_id+8, 1, 1500]
  ],
  # 5th delivery order
  [
    [first_meal_id, 2, 1000],
    [first_meal_id+4, 1, 1300],
    [first_meal_id+7, 1, 1500],
    [first_meal_id+8, 4, 1500],
    [first_meal_id+9, 2, 2000]
  ]
]

orders.each_with_index do |order_items, order_items_id|
  # create DeliveryOrder
  order = DeliveryOrder.create(
    order_id: 'GO10'+order_items_id.to_s,
    serving_datetime: DateTime.now+order_items_id.hour
  )
  order_items.each do |meal_id, quantity, unit_price|
    # populate DeliveryOrder with OrderItem(s)
    order.order_items.create(
      meal: Meal.find(meal_id),
      quantity: quantity,
      unit_price: unit_price,
      serving_date: DateTime.now+order_items_id.hour
    )
  end
end
