-- ============================================
-- ChirpX Database Schema
-- ============================================

CREATE DATABASE IF NOT EXISTS chirpx CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE chirpx;

-- Users
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  display_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  bio TEXT,
  avatar_url VARCHAR(500) DEFAULT '/frontend/assets/default-avatar.png',
  banner_url VARCHAR(500) DEFAULT '/frontend/assets/default-banner.jpg',
  website VARCHAR(255),
  location VARCHAR(100),
  is_verified TINYINT(1) DEFAULT 0,
  is_admin TINYINT(1) DEFAULT 0,
  is_banned TINYINT(1) DEFAULT 0,
  ban_reason TEXT,
  role ENUM('user','moderator','admin') DEFAULT 'user',
  email_verified TINYINT(1) DEFAULT 0,
  email_verify_token VARCHAR(255),
  password_reset_token VARCHAR(255),
  password_reset_expires DATETIME,
  refresh_token TEXT,
  simulated_followers INT DEFAULT 0,
  simulated_following INT DEFAULT 0,
  simulated_posts INT DEFAULT 0,
  theme ENUM('dark','light','auto') DEFAULT 'dark',
  accent_color VARCHAR(20) DEFAULT '#1DA1F2',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Posts
CREATE TABLE posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  content TEXT,
  media_url VARCHAR(500),
  media_type ENUM('image','video','gif','none') DEFAULT 'none',
  parent_id INT DEFAULT NULL COMMENT 'For replies/threads',
  thread_root_id INT DEFAULT NULL COMMENT 'Root of thread',
  is_pinned TINYINT(1) DEFAULT 0,
  is_deleted TINYINT(1) DEFAULT 0,
  is_scheduled TINYINT(1) DEFAULT 0,
  is_draft TINYINT(1) DEFAULT 0,
  scheduled_at DATETIME,
  sim_likes INT DEFAULT 0,
  sim_reposts INT DEFAULT 0,
  sim_views INT DEFAULT 0,
  sim_comments INT DEFAULT 0,
  sim_bookmarks INT DEFAULT 0,
  is_trending TINYINT(1) DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (parent_id) REFERENCES posts(id) ON DELETE SET NULL
);

-- Hashtags
CREATE TABLE hashtags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tag VARCHAR(100) UNIQUE NOT NULL,
  sim_post_count INT DEFAULT 0,
  is_trending TINYINT(1) DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Post Hashtags
CREATE TABLE post_hashtags (
  post_id INT NOT NULL,
  hashtag_id INT NOT NULL,
  PRIMARY KEY (post_id, hashtag_id),
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
  FOREIGN KEY (hashtag_id) REFERENCES hashtags(id) ON DELETE CASCADE
);

-- Mentions
CREATE TABLE mentions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  post_id INT NOT NULL,
  mentioned_user_id INT NOT NULL,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
  FOREIGN KEY (mentioned_user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Follows (real user follows)
CREATE TABLE follows (
  follower_id INT NOT NULL,
  following_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (follower_id, following_id),
  FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (following_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Bookmarks
CREATE TABLE bookmarks (
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, post_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

-- Simulated Engagement Log (fake demo activity)
CREATE TABLE sim_engagement_log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  post_id INT NOT NULL,
  action ENUM('like','repost','view','comment','bookmark') NOT NULL,
  sim_user_name VARCHAR(100),
  amount INT DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

-- Notifications
CREATE TABLE notifications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL COMMENT 'Recipient',
  actor_id INT COMMENT 'Who triggered it (null = system)',
  type ENUM('like','repost','follow','comment','mention','system','report') NOT NULL,
  post_id INT,
  message TEXT,
  is_read TINYINT(1) DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (actor_id) REFERENCES users(id) ON DELETE SET NULL,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE SET NULL
);

-- Conversations (DMs)
CREATE TABLE conversations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200),
  is_group TINYINT(1) DEFAULT 0,
  created_by INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Conversation Members
CREATE TABLE conversation_members (
  conversation_id INT NOT NULL,
  user_id INT NOT NULL,
  joined_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (conversation_id, user_id),
  FOREIGN KEY (conversation_id) REFERENCES conversations(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Messages
CREATE TABLE messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  conversation_id INT NOT NULL,
  sender_id INT NOT NULL,
  content TEXT,
  media_url VARCHAR(500),
  media_type ENUM('image','video','gif','audio','file','none') DEFAULT 'none',
  reaction VARCHAR(10),
  is_read TINYINT(1) DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (conversation_id) REFERENCES conversations(id) ON DELETE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Reports
CREATE TABLE reports (
  id INT AUTO_INCREMENT PRIMARY KEY,
  reporter_id INT,
  post_id INT,
  reported_user_id INT,
  reason VARCHAR(200) NOT NULL,
  details TEXT,
  status ENUM('pending','reviewed','dismissed','actioned') DEFAULT 'pending',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (reporter_id) REFERENCES users(id) ON DELETE SET NULL,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE SET NULL,
  FOREIGN KEY (reported_user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Sessions / Refresh tokens
CREATE TABLE sessions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  refresh_token TEXT NOT NULL,
  ip_address VARCHAR(50),
  user_agent TEXT,
  expires_at DATETIME NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Sim Bot Users (fake AI users for demo)
CREATE TABLE sim_bots (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  username VARCHAR(50) NOT NULL,
  avatar_url VARCHAR(500),
  bio TEXT,
  is_active TINYINT(1) DEFAULT 1,
  post_frequency INT DEFAULT 30 COMMENT 'seconds between posts',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX idx_posts_user ON posts(user_id);
CREATE INDEX idx_posts_parent ON posts(parent_id);
CREATE INDEX idx_posts_trending ON posts(is_trending);
CREATE INDEX idx_notifs_user ON notifications(user_id, is_read);
CREATE INDEX idx_messages_conv ON messages(conversation_id);
CREATE INDEX idx_follows_follower ON follows(follower_id);
CREATE INDEX idx_follows_following ON follows(following_id);