json.array! @likes do |like|
  json.user_id like.user_id 
  json.item_id like.item_id 
end