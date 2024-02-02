class User < ApplicationRecord
  enum beverage: { unspecified: 0, water: 1, tea: 2, coffee: 3 }

  def paid?
    # Anybody that has specified a beverage preference since only paying
    #   customers can do that.
    !unspecified?
  end
end
