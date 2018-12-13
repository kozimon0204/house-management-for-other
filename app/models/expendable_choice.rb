class ExpendableChoice < ApplicationRecord
  enum status: { picking: 0, ordered: 1, preparing: 2, offered: 3, pending: 5, served: 9 }

end
