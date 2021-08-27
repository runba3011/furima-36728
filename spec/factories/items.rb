FactoryBot.define do
  factory :item do
    name             {'商品ちゃん'}
    explain          {'私の大切な宝物でしたが必要なくなりました'}
    category_id      {1}
    status_id        {2}
    send_cost_id     {1}
    prefecture_id    {2}
    send_limit_id    {1}
    price            {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
