class SendCost < ActiveHash::Base
  self.data[
    {id: 0 , name: '--'}
  ]

  include ActiveHash::Associations
end