DROP TABLE portfolio;

CREATE TABLE portfolio(
  id SERIAL4 PRIMARY KEY,
  value INT,
  bedrooms INT,
  year INT,
  build VARCHAR(255)
)
