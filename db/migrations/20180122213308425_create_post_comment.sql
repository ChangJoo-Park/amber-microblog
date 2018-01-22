-- +micrate Up
CREATE TABLE post_comments (
  id INTEGER NOT NULL PRIMARY KEY,
  post_id BIGINT,
  user_id BIGINT,
  body TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX post_comment_post_id_idx ON post_comments (post_id);
CREATE INDEX post_comment_user_id_idx ON post_comments (user_id);

-- +micrate Down
DROP TABLE IF EXISTS post_comments;
