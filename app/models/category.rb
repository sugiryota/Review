class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '映画' },
    { id: 3, name: 'アニメ' },
    { id: 4, name: '音楽' },
    { id: 5, name: '本' },
    { id: 6, name: 'その他' }

  ]
  include ActiveHash::Associations
  has_many :items
end
