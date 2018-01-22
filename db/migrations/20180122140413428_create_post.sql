-- +micrate Up
CREATE TABLE posts (
  id INTEGER NOT NULL PRIMARY KEY,
  title VARCHAR,
  body TEXT,
  user_id BIGINT,
  category_id BIGINT,
  published BOOL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX post_user_id_idx ON posts (user_id);
CREATE INDEX post_category_id_idx ON posts (category_id);

-- +micrate Down
DROP TABLE IF EXISTS posts;
