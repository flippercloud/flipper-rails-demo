class User < ApplicationRecord
  enum beverage: { unspecified: 0, water: 1, tea: 2, coffee: 3 }
end
