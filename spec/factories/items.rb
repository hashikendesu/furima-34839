FactoryBot.define do
  factory :item do
    name                  {"hoge"}
    text                  {"hoge"}
    category_id           {2}
    statu_id              {2}
    charge_id             {2}
    area_id               {2}
    delivery_time_id      {2}
    price                 {9999}
    association :user
  end
end
