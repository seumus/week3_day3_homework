CREATE TABLE pet_shops(
  id SERIAL8 primary key,
  name VARCHAR(255),
  address VARCHAR(255),
  type VARCHAR(255)
);

CREATE TABLE pets(
  id SERIAL4 primary key,
  name VARCHAR(255),
  pet_type VARCHAR(244),
  store_id SERIAL4 references pet_shops(id)
);
